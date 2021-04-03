import 'package:built_collection/built_collection.dart';
import 'package:ethereum_auction/service/auction.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:web3dart/credentials.dart';

class TestData {
  static User user = User((b) => b
    ..credential = EthPrivateKey.fromHex(
        '6ddd3ffa226646ff1e00aad4003f792b93069cc4bb4086c5fb68e84c8ad31508')
    ..ethAddress =
        EthereumAddress.fromHex('0xDe496f06859d9d0dADf4bC3184c9B51c047D43dd'));

  static String privateKey =
      '6ddd3ffa226646ff1e00aad4003f792b93069cc4bb4086c5fb68e84c8ad31508';

  static BuiltList<AuctionSummary> auctionSummaries = BuiltList.from([
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

  static AuctionDetail auctionDetail = AuctionDetail((b) => b
    ..ownerAddress =
        EthereumAddress.fromHex('0x488c423d6b7fa42b539C3256CfD3c29009C89674')
    ..item = 'iPhone 12 Pro Max'
    ..itemDescription =
        '5G goes Pro. Buy now. Special Verizon offer available at apple.com. 5G。A14 Bionic chip。'
    ..startPrice = BigInt.from(1111)
    ..currentHighestBidding = BigInt.from(2222)
    ..currentHighestBuyer =
        EthereumAddress.fromHex('0xDe496f06859d9d0dADf4bC3184c9B51c047D43dd')
    ..currentState = AuctionState.open
    ..shippingInfo = 'UPS: 1Z9999999999999999');

  static EthereumAddress auctionAddress =
      EthereumAddress.fromHex('0x4e2792a7f0b1f0d0023a3f7fcb825a7d29089001');
  static BigInt bidAmount = BigInt.from(1000);
  static String newShippingInfo = 'FEDEX: 1Z9999999999999999';

  static String transactionHash =
      '0x1116003d6dbdb0fbf7a7ea8175934d0e338e0b703bfae40907e47fe313a22ee8';
  static String ethResponse = 'eth response';

  static String ganachePrivateKey1 =
      'aeeeb09fad3d1a1dbd7907ea786bb6fd8fa751d1adad9c024ab8debdc1a3329a';
  static String ganachePrivateKey2 =
      '8a6f8ddfc478e4cec108e4de6bd7efd097077a083b8cf1188794c997efdd745b';
}
