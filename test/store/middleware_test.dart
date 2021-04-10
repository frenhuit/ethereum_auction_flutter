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

  List<dynamic> filterMiddlewareActions(List<dynamic> actions) {
    return [actions.first, ...actions.sublist(2, actions.length - 1)];
  }

  List<dynamic> filterReducerActions(List<dynamic> actions) {
    return [...actions.sublist(1, actions.length - 2), actions.last];
  }

  void assertHandleAsyncAction(List<dynamic> middlewareDispatchedActions,
      List<dynamic> reducerDispatchedActions) {
    var middlewareActionsPrefix = middlewareDispatchedActions[1];
    var middlewareActionsSuffix = middlewareDispatchedActions.last;

    var reducerActionsPrefix = reducerDispatchedActions.first;
    var reducerActionsSuffix =
        reducerDispatchedActions[reducerDispatchedActions.length - 2];
    expect(middlewareActionsPrefix, TypeMatcher<UpdateLoadingStateAction>());
    expect(middlewareActionsSuffix, TypeMatcher<UpdateLoadingStateAction>());

    expect(reducerActionsPrefix, TypeMatcher<UpdateLoadingStateAction>());
    expect(reducerActionsSuffix, TypeMatcher<UpdateLoadingStateAction>());
  }

  test('getAuctionSummaries', () async {
    await store.dispatch(GetAuctionSummariesAction());
    await assertHandleAsyncAction(actionLoggingMiddleware.dispatchedActions,
        actionLoggingReducer.dispatchedActions);
    await expect(
        filterMiddlewareActions(actionLoggingMiddleware.dispatchedActions),
        orderedEquals([
          TypeMatcher<GetAuctionSummariesAction>(),
          TypeMatcher<BuiltList<AuctionSummary>>(),
        ]));
    await expect(
        filterReducerActions(actionLoggingReducer.dispatchedActions),
        orderedEquals([
          TypeMatcher<BuiltList<AuctionSummary>>(),
          TypeMatcher<GetAuctionSummariesAction>(),
        ]));
  });

  test('createAuction', () async {
    await store
        .dispatch(await CreateAuctionAction(TestData.user.credential, []));
    await assertHandleAsyncAction(actionLoggingMiddleware.dispatchedActions,
        actionLoggingReducer.dispatchedActions);
    await expect(
        filterMiddlewareActions(actionLoggingMiddleware.dispatchedActions),
        orderedEquals([
          TypeMatcher<CreateAuctionAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
        ]));
    await expect(
        filterReducerActions(actionLoggingReducer.dispatchedActions),
        orderedEquals([
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<CreateAuctionAction>(),
        ]));
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
    await assertHandleAsyncAction(actionLoggingMiddleware.dispatchedActions,
        actionLoggingReducer.dispatchedActions);
    await expect(
        filterMiddlewareActions(actionLoggingMiddleware.dispatchedActions),
        orderedEquals([
          TypeMatcher<GetUserCredentialAction>(),
          TypeMatcher<UpdateUserCredentialAction>(),
        ]));
    await expect(
        filterReducerActions(actionLoggingReducer.dispatchedActions),
        orderedEquals([
          TypeMatcher<UpdateUserCredentialAction>(),
          TypeMatcher<GetUserCredentialAction>(),
        ]));
  });

  test('getAuctionDetail', () async {
    await store.dispatch(GetAuctionDetailAction(TestData.auctionAddress));
    await assertHandleAsyncAction(actionLoggingMiddleware.dispatchedActions,
        actionLoggingReducer.dispatchedActions);
    await expect(
        filterMiddlewareActions(actionLoggingMiddleware.dispatchedActions),
        orderedEquals([
          TypeMatcher<GetAuctionDetailAction>(),
          TypeMatcher<ClearPreviousAuctionAction>(),
          TypeMatcher<AuctionDetail>(),
        ]));
    await expect(
        filterReducerActions(actionLoggingReducer.dispatchedActions),
        orderedEquals([
          TypeMatcher<ClearPreviousAuctionAction>(),
          TypeMatcher<AuctionDetail>(),
          TypeMatcher<GetAuctionDetailAction>(),
        ]));
  });

  test('bid', () async {
    await store.dispatch(BidAction(
        TestData.auctionAddress, TestData.user.credential, TestData.bidAmount));
    await assertHandleAsyncAction(actionLoggingMiddleware.dispatchedActions,
        actionLoggingReducer.dispatchedActions);
    await expect(
        filterMiddlewareActions(actionLoggingMiddleware.dispatchedActions),
        orderedEquals([
          TypeMatcher<BidAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
        ]));
    await expect(
        filterReducerActions(actionLoggingReducer.dispatchedActions),
        orderedEquals([
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<BidAction>(),
        ]));
  });

  test('revoke', () async {
    await store.dispatch(
        RevokeAction(TestData.auctionAddress, TestData.user.credential));
    await assertHandleAsyncAction(actionLoggingMiddleware.dispatchedActions,
        actionLoggingReducer.dispatchedActions);
    await expect(
        filterMiddlewareActions(actionLoggingMiddleware.dispatchedActions),
        orderedEquals([
          TypeMatcher<RevokeAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
        ]));
    await expect(
        filterReducerActions(actionLoggingReducer.dispatchedActions),
        orderedEquals([
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<RevokeAction>(),
        ]));
  });

  test('end', () async {
    await store
        .dispatch(EndAction(TestData.auctionAddress, TestData.user.credential));
    await assertHandleAsyncAction(actionLoggingMiddleware.dispatchedActions,
        actionLoggingReducer.dispatchedActions);
    await expect(
        filterMiddlewareActions(actionLoggingMiddleware.dispatchedActions),
        orderedEquals([
          TypeMatcher<EndAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
        ]));
    await expect(
        filterReducerActions(actionLoggingReducer.dispatchedActions),
        orderedEquals([
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<EndAction>(),
        ]));
  });

  test('cancel', () async {
    await store.dispatch(
        CancelAction(TestData.auctionAddress, TestData.user.credential));
    await assertHandleAsyncAction(actionLoggingMiddleware.dispatchedActions,
        actionLoggingReducer.dispatchedActions);
    await expect(
        filterMiddlewareActions(actionLoggingMiddleware.dispatchedActions),
        orderedEquals([
          TypeMatcher<CancelAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
        ]));
    await expect(
        filterReducerActions(actionLoggingReducer.dispatchedActions),
        orderedEquals([
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<CancelAction>(),
        ]));
  });

  test('updateShippingInfo', () async {
    await store.dispatch(UpdateShippingInfoAction(TestData.auctionAddress,
        TestData.user.credential, TestData.newShippingInfo));
    await assertHandleAsyncAction(actionLoggingMiddleware.dispatchedActions,
        actionLoggingReducer.dispatchedActions);
    await expect(
        filterMiddlewareActions(actionLoggingMiddleware.dispatchedActions),
        orderedEquals([
          TypeMatcher<UpdateShippingInfoAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<UpdateEthResponseAction>(),
        ]));
    await expect(
        filterReducerActions(actionLoggingReducer.dispatchedActions),
        orderedEquals([
          TypeMatcher<UpdateEthResponseAction>(),
          TypeMatcher<UpdateShippingInfoAction>(),
        ]));
  });
}
