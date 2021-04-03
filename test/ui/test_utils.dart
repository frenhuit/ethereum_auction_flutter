import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:ethereum_auction/ui/string_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

StoreProvider buildWidgetWithState({AppState state, Widget widget}) {
  final store = Store<AppState>(
    (state, action) => state,
    middleware: [],
    initialState: state,
  );
  return StoreProvider<AppState>(
    store: store,
    child: MaterialApp(
      title: StringAssets.flutterAppTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: widget,
    ),
  );
}
