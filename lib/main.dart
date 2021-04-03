import 'package:ethereum_auction/store/middlewares/middlewares.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:ethereum_auction/store/reducers/reducers.dart';
import 'package:ethereum_auction/ui/detail.dart';
import 'package:ethereum_auction/ui/home.dart';
import 'package:ethereum_auction/ui/new.dart';
import 'package:ethereum_auction/ui/string_assets.dart';
import 'package:flutter/material.dart' hide ActionDispatcher;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'config/app_config.dart';

void main({String network = 'rinkeby'}) {
  EthNetwork selectedNetwork = networkMapping.containsKey(network)
      ? networkMapping[network]
      : EthNetwork.rinkeby;
  runApp(MyApp(
    network: selectedNetwork,
  ));
}

class MyApp extends StatelessWidget {
  final EthNetwork network;

  const MyApp({Key key, this.network}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Store<AppState>(
      appReducer,
      middleware: MiddlewareProvider.middlewares,
      initialState: AppState.initiatlize(network: network),
    );
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: StringAssets.flutterAppTitle,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/new': (context) => NewPage(
                title: StringAssets.newPageTitle,
              ),
          '/detail': (context) => DetailPage(
                title: StringAssets.detailPageTitle,
              )
        },
        home: MyHomePage(title: StringAssets.mainPageTitle),
      ),
    );
  }
}
