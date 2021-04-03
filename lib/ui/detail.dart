import 'dart:async';

import 'package:ethereum_auction/config/constant_value.dart';
import 'package:ethereum_auction/service/auction.dart';
import 'package:ethereum_auction/store/actions/action_dispatcher.dart';
import 'package:ethereum_auction/store/actions/actions.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:ethereum_auction/ui/common.dart';
import 'package:ethereum_auction/ui/detail_view_model.dart';
import 'package:ethereum_auction/ui/string_assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide ActionDispatcher;
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.title}) : super(key: key);

  final String title;

  final _biddingFormKey = GlobalKey<FormState>();

  final _shippingInfoFormKey = GlobalKey<FormState>();

  final _biddingAmountController = new TextEditingController();

  final _shippingInfoController = new TextEditingController();

  StreamSubscription _subscription;

  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailPage> {
  PageState _pageState = PageState.normal;

  void detailPageChangeHandler(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    if (store.state.auctionDetail.ownerAddress != null &&
        widget._subscription == null) {
      final contract = store.state.auctionDetail.contract;
      if (contract != null) {
        var updateEvent = contract.event('AuctionUpdated');
        var ethClient = Web3Client(store.state.appConfig.rpcUrl, Client(),
            socketConnector: () =>
                IOWebSocketChannel.connect(store.state.appConfig.wsUrl)
                    .cast<String>());
        widget._subscription = ethClient
            .events(
                FilterOptions.events(contract: contract, event: updateEvent))
            .listen((event) {
          final decoded = updateEvent.decodeResults(event.topics, event.data);
          final auctionAddress = decoded[0] as EthereumAddress;
          ActionDispatcher.of(context).getAuctionDetail(auctionAddress);

          final senderAddress = decoded[1] as EthereumAddress;
          if (senderAddress == store.state.user.ethAddress) {
            setState(() {
              _pageState = PageState.normal;
            });
          }
        });
      }
    }

    if (store.state.ethResponse.isNotEmpty)
      setState(() => _pageState = PageState.normal);
  }

  Widget buttonContent(String text, PageState exceptPageState,
          Color indicatorBackgroundColor) =>
      _pageState != exceptPageState
          ? Text(text)
          : SizedBox(
              child: CircularProgressIndicator(
                backgroundColor: indicatorBackgroundColor,
              ),
              height: ConstantValue.innerProgressIndicatorSize,
              width: ConstantValue.innerProgressIndicatorSize,
            );

  Widget detailInfo(BuildContext context, DetailViewModel viewModel) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            viewModel.auctionDetail.item,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            StringAssets.auctionOwnerPrefix +
                viewModel.auctionDetail.ownerAddress.toString(),
          ),
          Text(viewModel.auctionDetail.itemDescription),
          Text(
              StringAssets.auctionPricePrefix +
                  (viewModel.auctionDetail.currentHighestBidding == BigInt.zero
                      ? viewModel.auctionDetail.startPrice.toString()
                      : viewModel.auctionDetail.currentHighestBidding
                          .toString()),
              style: Theme.of(context).textTheme.subtitle2),
          Text(describeEnum(viewModel.auctionDetail.currentState),
              style: Theme.of(context).textTheme.headline6),
          if (viewModel.auctionDetail.currentState == AuctionState.confirmed ||
              viewModel.auctionDetail.currentState == AuctionState.completed)
            Text(StringAssets.auctionShippingInfoPrefix +
                viewModel.auctionDetail.shippingInfo),
        ],
      );

  void bidOnPressHandler(BuildContext context, DetailViewModel viewModel) {
    if (_pageState == PageState.normal) {
      setState(() => _pageState = PageState.bidLoading);
      if (widget._biddingFormKey.currentState.validate())
        ActionDispatcher.of(context).bid(
            viewModel.auctionDetail.contract.address,
            viewModel.user.credential,
            BigInt.from(num.parse(widget._biddingAmountController.text)));
    }
  }

  void revokeOnPressHandler(BuildContext context, DetailViewModel viewModel) {
    if (_pageState == PageState.normal) {
      setState(() => _pageState = PageState.revokeLoading);
      ActionDispatcher.of(context).revoke(
          viewModel.auctionDetail.contract.address, viewModel.user.credential);
    }
  }

  endOnPressHandler(BuildContext context, DetailViewModel viewModel) {
    if (_pageState == PageState.normal) {
      setState(() => _pageState = PageState.endLoading);
      ActionDispatcher.of(context).end(
          viewModel.auctionDetail.contract.address, viewModel.user.credential);
    }
  }

  cancelOnPressHandler(BuildContext context, DetailViewModel viewModel) {
    if (_pageState == PageState.normal) {
      setState(() => _pageState = PageState.cancelLoading);
      ActionDispatcher.of(context).cancel(
          viewModel.auctionDetail.contract.address, viewModel.user.credential);
    }
  }

  updateShippingOnPressHandler(
      BuildContext context, DetailViewModel viewModel) {
    if (_pageState == PageState.normal) {
      setState(() => _pageState = PageState.updateShippingLoading);
      if (widget._shippingInfoFormKey.currentState.validate())
        ActionDispatcher.of(context).updateShippingInfo(
            viewModel.auctionDetail.contract.address,
            viewModel.user.credential,
            widget._shippingInfoController.text);
    }
  }

  Widget bidForm(BuildContext context, DetailViewModel viewModel) => Form(
      key: widget._biddingFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration:
                InputDecoration(hintText: StringAssets.biddingAmountText),
            validator: (value) => value.isEmpty
                ? StringAssets.biddingAmountNotInputtedError
                : null,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            controller: widget._biddingAmountController,
          ),
          ElevatedButton(
            onPressed: () => bidOnPressHandler(context, viewModel),
            child: buttonContent(
                StringAssets.bidButtonText, PageState.bidLoading, Colors.white),
          ),
        ],
      ));

  Widget updateShippingInfoForm(
          BuildContext context, DetailViewModel viewModel) =>
      Form(
          key: widget._shippingInfoFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration:
                    InputDecoration(hintText: StringAssets.shippingInfoText),
                validator: (value) => value.isEmpty
                    ? StringAssets.shippingInfoNotInputtedError
                    : null,
                controller: widget._shippingInfoController,
              ),
              ElevatedButton(
                onPressed: () =>
                    updateShippingOnPressHandler(context, viewModel),
                child: buttonContent(StringAssets.updateShippingInfoButtonText,
                    PageState.updateShippingLoading, Colors.white),
              ),
            ],
          ));

  Widget detailPageButton(
          BuildContext context,
          DetailViewModel viewModel,
          void Function(BuildContext context, DetailViewModel viewModel)
              onPressHandler,
          String buttonText,
          PageState exceptPageState,
          Color indicatorBackgroundColor) =>
      OutlinedButton(
        onPressed: () => onPressHandler(context, viewModel),
        child: buttonContent(
            buttonText, exceptPageState, indicatorBackgroundColor),
      );

  Widget mainContent(BuildContext context, DetailViewModel viewModel) => Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: ConstantValue.defaultPadding,
              horizontal: ConstantValue.defaultPadding),
          child: ListView(
            children: <Widget>[
              viewModel.auctionDetail.ownerAddress != null
                  ? detailInfo(context, viewModel)
                  : Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    ),
              Column(
                children: <Widget>[
                  if (viewModel.ethResponse.isNotEmpty)
                    errorCard(context, viewModel.ethResponse),
                  if (viewModel.auctionDetail.currentState ==
                          AuctionState.open &&
                      viewModel.auctionDetail.ownerAddress !=
                          viewModel.user.ethAddress)
                    bidForm(context, viewModel),
                  if ((viewModel.auctionDetail.currentState ==
                              AuctionState.open ||
                          viewModel.auctionDetail.currentState ==
                              AuctionState.confirmed) &&
                      viewModel.auctionDetail.ownerAddress !=
                          viewModel.user.ethAddress &&
                      viewModel.auctionDetail.currentHighestBuyer ==
                          viewModel.user.ethAddress)
                    Align(
                      alignment: Alignment.topLeft,
                      child: detailPageButton(
                          context,
                          viewModel,
                          revokeOnPressHandler,
                          StringAssets.revokeButtonText,
                          PageState.revokeLoading,
                          Colors.white),
                    ),
                  if (viewModel.auctionDetail.currentState ==
                          AuctionState.open &&
                      viewModel.auctionDetail.ownerAddress ==
                          viewModel.user.ethAddress)
                    Row(
                      // Owner actions
                      children: <Widget>[
                        detailPageButton(
                            context,
                            viewModel,
                            endOnPressHandler,
                            StringAssets.endButtonText,
                            PageState.endLoading,
                            Colors.white),
                        detailPageButton(
                            context,
                            viewModel,
                            cancelOnPressHandler,
                            StringAssets.cancelButtonText,
                            PageState.cancelLoading,
                            Colors.white),
                      ],
                    ),
                  if ((viewModel.auctionDetail.currentState ==
                              AuctionState.confirmed ||
                          viewModel.auctionDetail.currentState ==
                              AuctionState.completed) &&
                      viewModel.auctionDetail.ownerAddress ==
                          viewModel.user.ethAddress)
                    updateShippingInfoForm(context, viewModel),
                ],
              ),
            ],
          ),
        ),
      );

  // This trailing comma makes auto-formatting nicer for build methods.

  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, DetailViewModel>(
        onDidChange: (_) => detailPageChangeHandler(context),
        onDispose: (store) {
          if (widget._subscription != null) {
            widget._subscription.cancel();
          }
          store.dispatch(UpdateEthResponseAction(''));
          store.dispatch(GetAuctionSummariesAction());
        },
        converter: (_) => DetailViewModel.of(context),
        builder: (context, viewModel) => Scaffold(
            appBar: myAppBar(context, widget.title),
            body: viewModel.user.credential != null
                ? mainContent(context, viewModel)
                : userAccountNotFoundDialog(context)),
        distinct: true,
      );
}

enum PageState {
  normal,
  bidLoading,
  revokeLoading,
  endLoading,
  cancelLoading,
  updateShippingLoading,
}
