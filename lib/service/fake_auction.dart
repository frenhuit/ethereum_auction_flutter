import 'package:ethereum_auction/service/auction.dart';
import 'package:ethereum_auction/store/models/app_state.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

class FakeAuction extends Auction {
  FakeAuction(EthereumAddress contractAddress)
      : super(EthereumAddress.fromHex(
            '0x488c423d6b7fa42b539C3256CfD3c29009C89674'));

  @override
  Future<AuctionDetail> getDetail(Web3Client ethClient) async {
    return AuctionDetail((b) => b
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
  }

  @override
  Future<String> bid(
      Web3Client ethClient, Credentials credential, BigInt amount) async {
    return '0x1116003d6dbdb0fbf7a7ea8175934d0e338e0b703bfae40907e47fe313a22ee8';
  }

  @override
  Future<String> revoke(Web3Client ethClient, Credentials credential) async {
    return '0x1116003d6dbdb0fbf7a7ea8175934d0e338e0b703bfae40907e47fe313a22ee8';
  }

  @override
  Future<String> end(Web3Client ethClient, Credentials credential) async {
    return '0x1116003d6dbdb0fbf7a7ea8175934d0e338e0b703bfae40907e47fe313a22ee8';
  }

  @override
  Future<String> cancel(Web3Client ethClient, Credentials credential) async {
    return '0x1116003d6dbdb0fbf7a7ea8175934d0e338e0b703bfae40907e47fe313a22ee8';
  }

  @override
  Future<String> updateShippingInfo(
      Web3Client ethClient, Credentials credential, String shippingInfo) async {
    return '0x1116003d6dbdb0fbf7a7ea8175934d0e338e0b703bfae40907e47fe313a22ee8';
  }
}
