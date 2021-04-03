import 'package:ethereum_auction/store/actions/action_dispatcher.dart';
import 'package:ethereum_auction/ui/string_assets.dart';
import 'package:flutter/material.dart' hide ActionDispatcher;
import 'package:flutter_redux/flutter_redux.dart';

import '../store/models/app_state.dart';

final _privateKeyFormKey = GlobalKey<FormState>();
final _privateKeyController = TextEditingController();

AppBar myAppBar(BuildContext context, String title) {
  return AppBar(
    leading: IconButton(
        icon: Icon(Icons.home),
        onPressed: () =>
            Navigator.of(context).popUntil(ModalRoute.withName('/'))),
    title: Text(
      title,
      key: Key('appBarTitle'),
    ),
  );
}

Widget privateKeyForm(BuildContext context) => Form(
      key: _privateKeyFormKey,
      child: TextFormField(
        decoration: InputDecoration(hintText: StringAssets.privateKeyInputText),
        validator: (value) =>
            value.isEmpty ? StringAssets.privateKeyInputText : null,
        controller: _privateKeyController,
      ),
    );

Widget userAccountNotFoundDialog(BuildContext context) => AlertDialog(
      title: Text(StringAssets.userAccountNotFoundTitle),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(StringAssets.userAccountNotFoundText),
            privateKeyForm(context),
            if (StoreProvider.of<AppState>(context)
                .state
                .ethResponse
                .isNotEmpty)
              errorCard(context,
                  StoreProvider.of<AppState>(context).state.ethResponse),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(StringAssets.userAccountNotFoundBackButtonText),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(StringAssets.userAccountNotFoundGetButtonText),
          onPressed: () {
            if (_privateKeyFormKey.currentState.validate()) {
              var privateKey = _privateKeyController.text;
              ActionDispatcher.of(context).getUserCredential(privateKey);
            }
          },
        ),
      ],
    );

Widget errorCard(BuildContext context, String errorInfo) => ListTile(
    title: Text(
      StringAssets.errorInfoTitle,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: Text(
      errorInfo,
      style: TextStyle(color: Theme.of(context).colorScheme.error),
    ));
