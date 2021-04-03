import 'dart:async';

import 'package:ethereum_auction/config/constant_value.dart';
import 'package:ethereum_auction/service/auction_factory.dart';
import 'package:ethereum_auction/store/actions/action_dispatcher.dart';
import 'package:ethereum_auction/store/actions/actions.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:ethereum_auction/ui/common.dart';
import 'package:ethereum_auction/ui/new_view_model.dart';
import 'package:ethereum_auction/ui/string_assets.dart';
import 'package:flutter/material.dart' hide ActionDispatcher;
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class NewPage extends StatefulWidget {
  NewPage({Key key, this.title}) : super(key: key);

  final String title;

  final _formKey = GlobalKey<FormState>();

  final _itemNameController = new TextEditingController();

  final _itemDescController = new TextEditingController();

  final _startPriceController = new TextEditingController();

  StreamSubscription _subscription;

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  bool _loading = false;

  void submitCreation(
      BuildContext context, Credentials credential, List<dynamic> args) async {
    setState(() => _loading = true);
    ActionDispatcher.of(context).createAuction(credential, args);

    final store = StoreProvider.of<AppState>(context);
    final contract = AuctionFactory.instance().contract;
    if (contract != null) {
      var updateEvent = contract.event('AuctionCreated');
      if (widget._subscription == null) {
        var ethClient = Web3Client(store.state.appConfig.rpcUrl, Client(),
            socketConnector: () =>
                IOWebSocketChannel.connect(store.state.appConfig.wsUrl)
                    .cast<String>());
        widget._subscription = ethClient
            .events(
                FilterOptions.events(contract: contract, event: updateEvent))
            .listen((event) {
          final decoded = updateEvent.decodeResults(event.topics, event.data);
          final newAuctionAddress = decoded[0] as EthereumAddress;
          final ownerAddress = decoded[1] as EthereumAddress;
          if (ownerAddress == store.state.user.ethAddress) {
            setState(() => _loading = false);
            showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) => AlertDialog(
                title: Text(StringAssets.auctionCreatedTitle),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(StringAssets.auctionCreatedText),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(StringAssets.auctionCreatedOptionNoText),
                    onPressed: () async {
                      if (widget._subscription != null) {
                        await widget._subscription.cancel();
                      }
                      await Navigator.of(context)
                          .popUntil(ModalRoute.withName('/'));
                    },
                  ),
                  TextButton(
                    child: Text(StringAssets.auctionCreatedOptionYesText),
                    onPressed: () async {
                      ActionDispatcher.of(context)
                          .getAuctionDetail(newAuctionAddress);
                      if (widget._subscription != null) {
                        await widget._subscription.cancel();
                      }
                      await Navigator.of(context).pushNamed('/detail');
                    },
                  ),
                ],
              ),
            );
          }
        });
      }
    }
  }

  Widget createAuctionSubmitButton(NewViewModel viewModel) => ElevatedButton(
        onPressed: () {
          if (!_loading) {
            if (widget._formKey.currentState.validate()) {
              var args = [
                widget._itemNameController.text,
                widget._itemDescController.text,
                BigInt.from(num.parse(widget._startPriceController.text)),
              ];
              submitCreation(context, viewModel.user.credential, args);
            }
          }
        },
        child: _loading
            ? SizedBox(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
                height: ConstantValue.innerProgressIndicatorSize,
                width: ConstantValue.innerProgressIndicatorSize,
              )
            : Text(
                StringAssets.createAuctionButtonText,
              ),
      );

  Widget createAuctionForm(BuildContext context, NewViewModel viewModel) =>
      Form(
          key: widget._formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      hintText: StringAssets.newAuctionItemText),
                  validator: (value) => value.isEmpty
                      ? StringAssets.newAuctionItemNotInputtedError
                      : null,
                  controller: widget._itemNameController,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: StringAssets.newAuctionItemDescriptionText),
                  validator: (value) => value.isEmpty
                      ? StringAssets.newAuctionFormDescriptionNotInputtedError
                      : null,
                  controller: widget._itemDescController,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: StringAssets.newAuctionStartPriceText),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  validator: (value) => value.isEmpty
                      ? StringAssets.newAuctionStartPriceNotInputtedError
                      : null,
                  controller: widget._startPriceController,
                ),
                if (viewModel.ethResponse.isNotEmpty)
                  errorCard(context, viewModel.ethResponse),
                createAuctionSubmitButton(viewModel),
              ]));

  Widget mainContent(BuildContext context, NewViewModel viewModel) => Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ConstantValue.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            createAuctionForm(context, viewModel),
          ],
        ),
      ));

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, NewViewModel>(
        converter: (_) => NewViewModel.of(context),
        onDispose: (store) {
          if (widget._subscription != null) {
            widget._subscription.cancel();
          }
          store.dispatch(UpdateEthResponseAction(''));
          store.dispatch(GetAuctionSummariesAction());
        },
        builder: (context, viewModel) => Scaffold(
          appBar: myAppBar(context, widget.title),
          body: viewModel.user.credential != null
              ? mainContent(context, viewModel)
              : userAccountNotFoundDialog(context),
        ),
        distinct: true,
      );
}
