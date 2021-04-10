import 'package:ethereum_auction/store/actions/actions.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:ethereum_auction/store/reducers/reducers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import '../../test_data.dart';

void main() {
  Store<AppState> store;

  void setupWithInitState(AppState initState) {
    store = Store<AppState>(appReducer, initialState: initState);
  }

  setUp(() {
    setupWithInitState(AppState.initiatlize());
  });

  test('updateAuctionSummaries', () {
    store.dispatch(TestData.auctionSummaries);
    expect(store.state.auctionSummaries, equals(TestData.auctionSummaries));
  });

  test('updateEthResponse', () {
    store.dispatch(UpdateEthResponseAction(TestData.ethResponse));
    expect(store.state.ethResponse, equals(TestData.ethResponse));
  });

  test('updateUserCredential', () {
    var userCredentialAction =
        UpdateUserCredentialAction(TestData.user.credential);
    userCredentialAction.ethAddress = TestData.user.ethAddress;
    store.dispatch(userCredentialAction);
    expect(store.state.user, equals(TestData.user));
  });

  test('clearAuctionDetail', () {
    store.dispatch(ClearPreviousAuctionAction());
    expect(store.state.auctionDetail, equals(AuctionDetail.initialize()));
  });

  test('updateAuctionDetail', () {
    store.dispatch(TestData.auctionDetail);
    expect(store.state.auctionDetail, equals(TestData.auctionDetail));
  });

  test('updateLoadingState', () {
    store.dispatch(UpdateLoadingStateAction(true));
    expect(store.state.isLoading, true);
  });
}
