import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_redux/flutter_redux.dart';

part 'home_view_model.g.dart';

abstract class HomeViewModel
    implements Built<HomeViewModel, HomeViewModelBuilder> {
  static Serializer<HomeViewModel> get serializer => _$homeViewModelSerializer;

  @nullable
  BuiltList<AuctionSummary> get auctionSummaries;

  HomeViewModel._();

  factory HomeViewModel([updates(HomeViewModelBuilder b)]) = _$HomeViewModel;

  static HomeViewModel initialize() => HomeViewModel((b) => b);

  static HomeViewModel of(BuildContext context) => HomeViewModel((b) {
        var state = StoreProvider.of<AppState>(context).state;
        return b..auctionSummaries.replace(state.auctionSummaries);
      });
}
