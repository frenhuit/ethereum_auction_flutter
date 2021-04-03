import 'package:built_collection/built_collection.dart';
import 'package:ethereum_auction/service/auction_factory.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:web3dart/web3dart.dart';

class FakeAuctionFactory extends AuctionFactory {
  static AuctionFactory _instance;

  FakeAuctionFactory()
      : super(EthereumAddress.fromHex(
            '0x488c423d6b7fa42b539C3256CfD3c29009C89674'));

  @override
  static AuctionFactory instance() =>
      _instance ?? (_instance = FakeAuctionFactory());

  @override
  Future<BuiltList<AuctionSummary>> getSummaries(Web3Client ethClient) async {
    return BuiltList<AuctionSummary>.from([
      AuctionSummary((b) => b
        ..item = '1'
        ..itemDescription = '11'
        ..startPrice = BigInt.from(111)),
      AuctionSummary((b) => b
        ..item = '2'
        ..itemDescription = '22'
        ..startPrice = BigInt.from(222)),
      AuctionSummary((b) => b
        ..item = '3'
        ..itemDescription = '33'
        ..startPrice = BigInt.from(333)),
    ]);
  }

  @override
  Future<String> createAuction(Web3Client ethClient, Credentials credential, List args) async {
    return '0x1116003d6dbdb0fbf7a7ea8175934d0e338e0b703bfae40907e47fe313a22ee8';
  }
}
