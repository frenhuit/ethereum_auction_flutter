import 'package:built_collection/built_collection.dart';
import 'package:ethereum_auction/service/smart_contract.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:quiver/check.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

class AuctionFactory extends SmartContract {
  static final _name = 'AuctionFactory';
  static AuctionFactory _instance;

  AuctionFactory(EthereumAddress contractAddress)
      : super(_name, contractAddress) {
    checkArgument(contractAddress != null);
  }

  Future<BuiltList<AuctionSummary>> getSummaries(Web3Client ethClient) async {
    var results = await query(ethClient, "getAuctionSummaries", []);
    var auctionSummaries =
        BuiltList<AuctionSummary>.from((results[0]).map((auction) {
      var auctionAddress = auction[0] as EthereumAddress;
      var item = auction[1] as String;
      var itemDescription = auction[2] as String;
      var startPrice = auction[3] as BigInt;
      var result = AuctionSummary((b) => b
        ..address = auctionAddress
        ..item = item
        ..itemDescription = itemDescription
        ..startPrice = startPrice);
      return result;
    }));
    return auctionSummaries;
  }

  Future<String> createAuction(
      Web3Client ethClient, Credentials credential, List<dynamic> args) async {
    return submit(ethClient, credential, 'createAuction', args, BigInt.zero);
  }

  static AuctionFactory instance(
          {String contractAddress =
              '0x488c423d6b7fa42b539C3256CfD3c29009C89674'}) =>
      _instance ??
      (_instance = AuctionFactory(EthereumAddress.fromHex(contractAddress)));
}
