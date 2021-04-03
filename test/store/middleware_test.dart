import 'package:built_collection/built_collection.dart';
import 'package:ethereum_auction/service/fake_auction_service_impl.dart';
import 'package:ethereum_auction/store/actions/actions.dart';
import 'package:ethereum_auction/store/middlewares/middlewares.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:redux/redux.dart';

import '../../test_data.dart';
import 'test_utils.dart';

void main() {
  final actionLoggingMiddleware = ActionLoggingMiddleware();
  final actionLoggingReducer = ActionLoggingReducer();
  MiddlewareProvider.service = FakeAuctionServiceImpl();
  final List<Middleware<AppState>> middleware = [
    actionLoggingMiddleware,
    ...MiddlewareProvider.middlewares
  ];

  Store<AppState> store;

  void setupWithInitState(AppState initState) {
    store = Store<AppState>(actionLoggingReducer,
        initialState: initState, middleware: middleware);
    actionLoggingMiddleware.reset();
    actionLoggingReducer.reset();
  }

  setUp(() {
    setupWithInitState(AppState.initiatlize());
  });

  test('getAuctionSummaries', () async {
    await store.dispatch(GetAuctionSummariesAction());
    await expect(
        actionLoggingMiddleware.dispatchedActions,
        orderedEquals([
          TypeMatcher<GetAuctionSummariesAction>(),
          TypeMatcher<BuiltList<AuctionSummary>>(),
        ]));
    await expect(actionLoggingReducer.dispatchedActions.single,
        TypeMatcher<BuiltList<AuctionSummary>>());
  });

  test('createAuction', () async {
    await store
        .dispatch(await CreateAuctionAction(TestData.user.credential, []));
    await expect(
        actionLoggingMiddleware.dispatchedActions,
        orderedEquals([
          TypeMatcher<CreateAuctionAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
        ]));
    await expect(actionLoggingReducer.dispatchedActions.single,
        TypeMatcher<UpdateEthResponseAction>());
  });

  test('filterEthResponse', () async {
    await store.dispatch(UpdateEthResponseAction(TestData.ethResponse));
    await expect(actionLoggingMiddleware.dispatchedActions,
        orderedEquals([TypeMatcher<UpdateEthResponseAction>()]));
    await expect(actionLoggingReducer.dispatchedActions.single,
        TypeMatcher<UpdateEthResponseAction>());
  });

  test('getUserCredential', () async {
    await store.dispatch(GetUserCredentialAction(TestData.privateKey));
    await Future.delayed(Duration(seconds: 1));
    await expect(
        actionLoggingMiddleware.dispatchedActions,
        orderedEquals([
          TypeMatcher<GetUserCredentialAction>(),
          TypeMatcher<UpdateUserCredentialAction>(),
        ]));
    await expect(actionLoggingReducer.dispatchedActions.single,
        TypeMatcher<UpdateUserCredentialAction>());
  });

  test('getAuctionDetail', () async {
    await store.dispatch(GetAuctionDetailAction(TestData.auctionAddress));
    await expect(
        actionLoggingMiddleware.dispatchedActions,
        orderedEquals([
          TypeMatcher<GetAuctionDetailAction>(),
          TypeMatcher<ClearPreviousAuctionAction>(),
          TypeMatcher<AuctionDetail>(),
        ]));
    await expect(
        actionLoggingReducer.dispatchedActions,
        orderedEquals([
          TypeMatcher<ClearPreviousAuctionAction>(),
          TypeMatcher<AuctionDetail>(),
        ]));
  });

  test('bid', () async {
    await store.dispatch(BidAction(
        TestData.auctionAddress, TestData.user.credential, TestData.bidAmount));
    await expect(
        actionLoggingMiddleware.dispatchedActions,
        orderedEquals([
          TypeMatcher<BidAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
        ]));
    await expect(actionLoggingReducer.dispatchedActions.single,
        TypeMatcher<UpdateEthResponseAction>());
  });

  test('revoke', () async {
    await store.dispatch(RevokeAction(
        TestData.auctionAddress, TestData.user.credential));
    await expect(
        actionLoggingMiddleware.dispatchedActions,
        orderedEquals([
          TypeMatcher<RevokeAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
        ]));
    await expect(actionLoggingReducer.dispatchedActions.single,
        TypeMatcher<UpdateEthResponseAction>());
  });

  test('end', () async {
    await store.dispatch(EndAction(
        TestData.auctionAddress, TestData.user.credential));
    await expect(
        actionLoggingMiddleware.dispatchedActions,
        orderedEquals([
          TypeMatcher<EndAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
        ]));
    await expect(actionLoggingReducer.dispatchedActions.single,
        TypeMatcher<UpdateEthResponseAction>());
  });

  test('cancel', () async {
    await store.dispatch(CancelAction(
        TestData.auctionAddress, TestData.user.credential));
    await expect(
        actionLoggingMiddleware.dispatchedActions,
        orderedEquals([
          TypeMatcher<CancelAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
        ]));
    await expect(actionLoggingReducer.dispatchedActions.single,
        TypeMatcher<UpdateEthResponseAction>());
  });

  test('updateShippingInfo', () async {
    await store.dispatch(UpdateShippingInfoAction(
        TestData.auctionAddress, TestData.user.credential, TestData.newShippingInfo));
    await expect(
        actionLoggingMiddleware.dispatchedActions,
        orderedEquals([
          TypeMatcher<UpdateShippingInfoAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
        ]));
    await expect(actionLoggingReducer.dispatchedActions.single,
        TypeMatcher<UpdateEthResponseAction>());
  });
}
