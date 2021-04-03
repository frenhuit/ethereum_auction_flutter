import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_redux/flutter_redux.dart';

part 'new_view_model.g.dart';

abstract class NewViewModel
    implements Built<NewViewModel, NewViewModelBuilder> {
  static Serializer<NewViewModel> get serializer => _$newViewModelSerializer;

  User get user;

  String get ethResponse;

  NewViewModel._();

  factory NewViewModel([updates(NewViewModelBuilder b)]) = _$NewViewModel;

  static NewViewModel initialize() => NewViewModel((b) => b);

  static NewViewModel of(BuildContext context) => NewViewModel((b) {
        var state = StoreProvider.of<AppState>(context).state;
        // print('state: $state');
        return b
          ..user.replace(state.user)
          ..ethResponse = state.ethResponse;
      });
}
