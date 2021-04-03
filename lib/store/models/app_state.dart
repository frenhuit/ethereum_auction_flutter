import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ethereum_auction/config/app_config.dart';
import 'package:ethereum_auction/service/auction.dart';
import 'package:web3dart/web3dart.dart';

import '../../config/app_config.dart';
import '../../service/auction_factory.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  static Serializer<AppState> get serializer => _$appStateSerializer;

  BuiltList<AuctionSummary> get auctionSummaries;

  AuctionDetail get auctionDetail;

  User get user;

  String get ethResponse;

  AppConfig get appConfig;

  AppState._();

  factory AppState([updates(AppStateBuilder b)]) = _$AppState;

  static AppState initiatlize({EthNetwork network = EthNetwork.rinkeby}) =>
      AppState((b) {
        b.user.replace(User((b) => b));
        b.ethResponse = '';
        b.auctionDetail.replace(AuctionDetail((b) => b
          ..item = ''
          ..itemDescription = ''
          ..currentHighestBidding = BigInt.zero
          ..startPrice = BigInt.zero
          ..currentState = AuctionState.open
          ..shippingInfo = ''));
        b.appConfig.replace(AppConfig.initiatlize(network: network));
        // initializes AuctionFactory instance
        AuctionFactory.instance(
            contractAddress: b.appConfig.auctionFactoryAddress);
      });
}

abstract class AuctionSummary
    implements Built<AuctionSummary, AuctionSummaryBuilder> {
  static Serializer<AuctionSummary> get serializer =>
      _$auctionSummarySerializer;

  @nullable
  EthereumAddress get address;

  String get item;

  String get itemDescription;

  BigInt get startPrice;

  AuctionSummary._();

  factory AuctionSummary([updates(AuctionSummaryBuilder b)]) = _$AuctionSummary;

  static AuctionSummary initialize() => AuctionSummary((b) => b
    ..item = ''
    ..itemDescription = ''
    ..startPrice = BigInt.zero);
}

abstract class AuctionDetail
    implements Built<AuctionDetail, AuctionDetailBuilder> {
  static Serializer<AuctionDetail> get serializer => _$auctionDetailSerializer;

  @nullable
  EthereumAddress get ownerAddress;

  String get item;

  String get itemDescription;

  BigInt get currentHighestBidding;

  @nullable
  EthereumAddress get currentHighestBuyer;

  BigInt get startPrice;

  AuctionState get currentState;

  String get shippingInfo;

  @nullable
  DeployedContract get contract;

  AuctionDetail._();

  factory AuctionDetail([updates(AuctionDetailBuilder b)]) = _$AuctionDetail;

  static AuctionDetail initialize() => AuctionDetail((b) => b
    ..item = ''
    ..itemDescription = ''
    ..currentHighestBidding = BigInt.zero
    ..startPrice = BigInt.zero
    ..currentState = AuctionState.open
    ..shippingInfo = '');
}

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  @nullable
  Credentials get credential;

  // Save eth address separately to compare eth address in detail page
  @nullable
  EthereumAddress get ethAddress;

  User._();

  factory User([updates(UserBuilder b)]) = _$User;

  static User initialize() => User((b) => b);
}
