import 'package:ethereum_auction/store/actions/action_dispatcher.dart';
import 'package:ethereum_auction/store/actions/actions.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:redux/redux.dart';

import '../../test_data.dart';
import 'test_utils.dart';

void main() {
  final middleware = ActionLoggingMiddleware();

  Store<AppState> store;
  ActionDispatcher actionDispatcher;

  void setupWithInitState(AppState initState) {
    store = Store<AppState>((state, action) => state,
        initialState: initState, middleware: [middleware]);
    middleware.reset();
    actionDispatcher = ActionDispatcher(store);
  }

  setUp(() {
    setupWithInitState(AppState.initiatlize());
  });

  test('getAuctionSummaries', () {
    actionDispatcher.getAuctionSummaries();
    expect(middleware.dispatchedActions.single,
        TypeMatcher<GetAuctionSummariesAction>());
  });

  test('createAuction', () {
    actionDispatcher.createAuction(TestData.user.credential, []);
    expect(middleware.dispatchedActions.single,
        TypeMatcher<CreateAuctionAction>());
  });

  test('getUserCredential', () {
    actionDispatcher.getUserCredential(TestData.privateKey);
    expect(middleware.dispatchedActions.single,
        TypeMatcher<GetUserCredentialAction>());
  });

  test('getAuctionDetail', () {
    actionDispatcher.getAuctionDetail(TestData.auctionAddress);
    expect(middleware.dispatchedActions.single,
        TypeMatcher<GetAuctionDetailAction>());
  });

  test('bid', () {
    actionDispatcher.bid(TestData.auctionAddress, TestData.user.credential, TestData.bidAmount);
    expect(middleware.dispatchedActions.single,
        TypeMatcher<BidAction>());
  });

  test('revoke', () {
    actionDispatcher.revoke(TestData.auctionAddress, TestData.user.credential);
    expect(middleware.dispatchedActions.single,
        TypeMatcher<RevokeAction>());
  });

  test('end', () {
    actionDispatcher.end(TestData.auctionAddress, TestData.user.credential);
    expect(middleware.dispatchedActions.single,
        TypeMatcher<EndAction>());
  });

  test('cancel', () {
    actionDispatcher.cancel(TestData.auctionAddress, TestData.user.credential);
    expect(middleware.dispatchedActions.single,
        TypeMatcher<CancelAction>());
  });

  test('updateShippingInfo', () {
    actionDispatcher.updateShippingInfo(TestData.auctionAddress, TestData.user.credential, 'UPS: new shipping info');
    expect(middleware.dispatchedActions.single,
        TypeMatcher<UpdateShippingInfoAction>());
  });

}
