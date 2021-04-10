import 'package:ethereum_auction/store/actions/action_dispatcher.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:ethereum_auction/ui/common.dart';
import 'package:ethereum_auction/ui/home_view_model.dart';
import 'package:flutter/material.dart' hide ActionDispatcher;
import 'package:flutter_redux/flutter_redux.dart';

import '../store/models/app_state.dart';
import 'common.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  var index = 1;

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, HomeViewModel>(
        onInit: (store) => ActionDispatcher.of(context).getAuctionSummaries(),
        converter: (_) => HomeViewModel.of(context),
        builder: (context, viewModel) => Scaffold(
          appBar: myAppBar(context, title),
          body: Stack(
            children: [
              ListView(
                children: viewModel.auctionSummaries
                    .map(
                      (auctionSummary) => Card(
                        child: ListTile(
                          leading: Icon(Icons.store),
                          title: Text(
                            auctionSummary.item,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(auctionSummary.address.toString()),
                              Divider(),
                              Text(auctionSummary.itemDescription),
                            ],
                          ),
                          onTap: () {
                            ActionDispatcher.of(context)
                                .getAuctionDetail(auctionSummary.address);
                            Navigator.pushNamed(context, '/detail');
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
              Center(child: loadingIndicator()),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, "/new"),
            tooltip: 'Create Auction',
            child: Icon(Icons.add),
          ),
        ),
        distinct: true,
      );
}
