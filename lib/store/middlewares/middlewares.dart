import 'package:ethereum_auction/service/auction_service.dart';
import 'package:ethereum_auction/service/auction_service_impl.dart';
import 'package:ethereum_auction/store/actions/actions.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:web3dart/web3dart.dart';

class MiddlewareProvider {
  MiddlewareProvider._();

  static List<Middleware<AppState>> middlewares = <Middleware<AppState>>[
    TypedMiddleware<AppState, GetAuctionSummariesAction>(_getAuctionSummaries),
    TypedMiddleware<AppState, CreateAuctionAction>(_createAuction),
    TypedMiddleware<AppState, GetUserCredentialAction>(_getUserCredential),
    TypedMiddleware<AppState, UpdateEthResponseAction>(_filterEthResponse),
    TypedMiddleware<AppState, GetAuctionDetailAction>(_getAuctionDetail),
    TypedMiddleware<AppState, BidAction>(_bid),
    TypedMiddleware<AppState, RevokeAction>(_revoke),
    TypedMiddleware<AppState, EndAction>(_end),
    TypedMiddleware<AppState, CancelAction>(_cancel),
    TypedMiddleware<AppState, UpdateShippingInfoAction>(_updateShippingInfo),
  ];

  static AuctionService service = AuctionServiceImpl();

  static void _getAuctionSummaries(Store<AppState> store,
          GetAuctionSummariesAction action, NextDispatcher next) async =>
      store.dispatch(await service.auctionFactoryInstance
          .getSummaries(Web3Client(store.state.appConfig.rpcUrl, Client())));

  static void _createAuction(Store<AppState> store, CreateAuctionAction action,
          NextDispatcher next) async =>
      store.dispatch(UpdateEthResponseAction(
          await service.auctionFactoryInstance.createAuction(
              Web3Client(store.state.appConfig.rpcUrl, Client()),
              action.userCredential,
              action.args)));

  static void _filterEthResponse(Store<AppState> store,
      UpdateEthResponseAction action, NextDispatcher next) {
    if (action.response.contains(new RegExp(r'0x.*'))) {
      store.dispatch(UpdateEthResponseAction(''));
    } else {
      next(action);
    }
  }

  static void _getUserCredential(Store<AppState> store,
      GetUserCredentialAction action, NextDispatcher next) async {
    try {
      var ethClient = Web3Client(store.state.appConfig.rpcUrl, Client());
      var updateUserCredentialAction = UpdateUserCredentialAction(
          await service.getCredential(ethClient, action.privateKey));
      updateUserCredentialAction.ethAddress =
          await updateUserCredentialAction.credential.extractAddress();
      await store.dispatch(updateUserCredentialAction);
    } catch (e) {
      store.dispatch(UpdateEthResponseAction(e.toString()));
    }
  }

  static void _getAuctionDetail(Store<AppState> store,
      GetAuctionDetailAction action, NextDispatcher next) async {
    try {
      var ethClient = Web3Client(store.state.appConfig.rpcUrl, Client());
      store.dispatch(ClearPreviousAuctionAction());
      store.dispatch(
          await service.auctionAt(action.contractAddress).getDetail(ethClient));
    } catch (e) {
      store.dispatch(UpdateEthResponseAction(e.toString()));
    }
  }

  static void _bid(
          Store<AppState> store, BidAction action, NextDispatcher next) async =>
      store.dispatch(UpdateEthResponseAction(await service
          .auctionAt(action.contractAddress)
          .bid(Web3Client(store.state.appConfig.rpcUrl, Client()),
              action.credential, action.amount)));

  static void _revoke(Store<AppState> store, RevokeAction action,
          NextDispatcher next) async =>
      store.dispatch(UpdateEthResponseAction(await service
          .auctionAt(action.contractAddress)
          .revoke(Web3Client(store.state.appConfig.rpcUrl, Client()),
              action.credential)));

  static void _end(
          Store<AppState> store, EndAction action, NextDispatcher next) async =>
      store.dispatch(UpdateEthResponseAction(await service
          .auctionAt(action.contractAddress)
          .end(Web3Client(store.state.appConfig.rpcUrl, Client()),
              action.credential)));

  static void _cancel(Store<AppState> store, CancelAction action,
          NextDispatcher next) async =>
      store.dispatch(UpdateEthResponseAction(await service
          .auctionAt(action.contractAddress)
          .cancel(Web3Client(store.state.appConfig.rpcUrl, Client()),
              action.credential)));

  static void _updateShippingInfo(Store<AppState> store,
          UpdateShippingInfoAction action, NextDispatcher next) async =>
      store.dispatch(UpdateEthResponseAction(await service
          .auctionAt(action.contractAddress)
          .updateShippingInfo(
              Web3Client(store.state.appConfig.rpcUrl, Client()),
              action.credential,
              action.shippingInfo)));
}
