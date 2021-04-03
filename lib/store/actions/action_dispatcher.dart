import 'package:ethereum_auction/store/actions/actions.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:web3dart/credentials.dart';

typedef Dispatcher = void Function(dynamic action);

class ActionDispatcher {
  final Store<AppState> _store;

  static ActionDispatcher of(BuildContext context) =>
      ActionDispatcher(StoreProvider.of<AppState>(context));

  const ActionDispatcher(this._store);

  void getAuctionSummaries() {
    _store.dispatch(GetAuctionSummariesAction());
  }

  void createAuction(Credentials userCredential, List<dynamic> args) {
    _store.dispatch(CreateAuctionAction(userCredential, args));
  }

  void getUserCredential(String privateKey) {
    _store.dispatch(GetUserCredentialAction(privateKey));
  }

  void getAuctionDetail(EthereumAddress auctionAddress) {
    _store.dispatch(GetAuctionDetailAction(auctionAddress));
  }

  void bid(
      EthereumAddress contractAddress, Credentials credential, BigInt amount) {
    _store.dispatch(BidAction(contractAddress, credential, amount));
  }

  void revoke(EthereumAddress contractAddress, Credentials credential) {
    _store.dispatch(RevokeAction(contractAddress, credential));
  }

  void end(EthereumAddress contractAddress, Credentials credential) {
    _store.dispatch(EndAction(contractAddress, credential));
  }

  void cancel(EthereumAddress contractAddress, Credentials credential) {
    _store.dispatch(CancelAction(contractAddress, credential));
  }

  void updateShippingInfo(EthereumAddress contractAddress,
      Credentials credential, String shippingInfo) {
    _store.dispatch(
        UpdateShippingInfoAction(contractAddress, credential, shippingInfo));
  }
}
