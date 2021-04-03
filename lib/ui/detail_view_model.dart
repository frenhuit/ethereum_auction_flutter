import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_redux/flutter_redux.dart';

part 'detail_view_model.g.dart';

abstract class DetailViewModel
    implements Built<DetailViewModel, DetailViewModelBuilder> {
  static Serializer<DetailViewModel> get serializer =>
      _$detailViewModelSerializer;

  @nullable
  AuctionDetail get auctionDetail;

  User get user;

  String get ethResponse;

  DetailViewModel._();

  factory DetailViewModel([updates(DetailViewModelBuilder b)]) =
      _$DetailViewModel;

  static DetailViewModel initialize() => DetailViewModel((b) => b);

  static DetailViewModel of(BuildContext context) =>
      DetailViewModel((b) {
        var state = StoreProvider.of<AppState>(context).state;
        // print('state: $state');
        return b
          ..auctionDetail.replace(state.auctionDetail)
          ..user.replace(state.user)
          ..ethResponse = state.ethResponse;
      });
}
