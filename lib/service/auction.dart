import 'package:ethereum_auction/service/smart_contract.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:quiver/check.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

class Auction extends SmartContract {
  static final _name = 'Auction';

  Auction(EthereumAddress contractAddress) : super(_name, contractAddress) {
    checkArgument(contractAddress != null);
  }

  Future<AuctionDetail> getDetail(Web3Client ethClient) async {
    var auctionDetails = await query(ethClient, "getSummary", []);
    return AuctionDetail((b) => b
      ..ownerAddress = auctionDetails[0] as EthereumAddress
      ..item = auctionDetails[1] as String
      ..itemDescription = auctionDetails[2] as String
      ..currentHighestBidding = auctionDetails[3] as BigInt
      ..currentHighestBuyer = auctionDetails[4] as EthereumAddress
      ..startPrice = auctionDetails[5] as BigInt
      ..currentState = AuctionState.values[(auctionDetails[6]).toInt()]
      ..shippingInfo = auctionDetails[7] as String
      ..contract = contract);
  }

  Future<String> bid(
      Web3Client ethClient, Credentials credential, BigInt amount) async {
    return submit(ethClient, credential, 'bid', [], amount);
  }

  Future<String> revoke(Web3Client ethClient, Credentials credential) async {
    return submit(ethClient, credential, 'revoke', [], BigInt.zero);
  }

  Future<String> end(Web3Client ethClient, Credentials credential) async {
    return submit(ethClient, credential, 'end', [], BigInt.zero);
  }

  Future<String> cancel(Web3Client ethClient, Credentials credential) async {
    return submit(ethClient, credential, 'cancel', [], BigInt.zero);
  }

  Future<String> updateShippingInfo(
      Web3Client ethClient, Credentials credential, String shippingInfo) async {
    return submit(ethClient, credential, 'updateShippingInfo', [shippingInfo], BigInt.zero);
  }

  @override
  String toString() {
    return 'Auction{${super.toString()}}';
  }
}

enum AuctionState {
  open,
  confirmed,
  canceled,
  revoked,
  completed,
}
