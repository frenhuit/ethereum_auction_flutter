import 'package:built_collection/built_collection.dart';
import 'package:ethereum_auction/store/actions/actions.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, BuiltList<AuctionSummary>>(_updateAuctionSummaries),
  TypedReducer<AppState, UpdateEthResponseAction>(_updateEthResponse),
  TypedReducer<AppState, UpdateUserCredentialAction>(_updateUserCredential),
  TypedReducer<AppState, ClearPreviousAuctionAction>(_clearAuctionDetail),
  TypedReducer<AppState, AuctionDetail>(_updateAuctionDetail),
]);

AppState _updateAuctionSummaries(
        AppState state, BuiltList<AuctionSummary> auctionSummaries) =>
    state.rebuild((b) => b.auctionSummaries.replace(auctionSummaries));

AppState _updateEthResponse(AppState state, UpdateEthResponseAction action) =>
    state.rebuild((b) => b.ethResponse = action.response);

AppState _updateUserCredential(
        AppState state, UpdateUserCredentialAction action) =>
    state.rebuild((b) => b.user
      ..credential = action.credential
      ..ethAddress = action.ethAddress);

AppState _clearAuctionDetail(
        AppState state, ClearPreviousAuctionAction action) =>
    state.rebuild((b) => b.auctionDetail.replace(AuctionDetail.initialize()));

AppState _updateAuctionDetail(AppState state, AuctionDetail auctionDetail) =>
    state.rebuild((b) => b.auctionDetail.replace(auctionDetail));
