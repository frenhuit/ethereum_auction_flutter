import 'package:ethereum_auction/service/auction.dart';
import 'package:ethereum_auction/service/auction_factory.dart';
import 'package:ethereum_auction/service/auction_service.dart';
import 'package:ethereum_auction/service/fake_auction.dart';
import 'package:ethereum_auction/service/fake_auction_factory.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

class FakeAuctionServiceImpl implements AuctionService {
  @override
  Auction auctionAt(EthereumAddress contractAddress) =>
      FakeAuction(contractAddress);

  @override
  AuctionFactory get auctionFactoryInstance => FakeAuctionFactory.instance();

  @override
  Future<Credentials> getCredential(
      Web3Client ethClient, String privateKey) async {
    return EthPrivateKey.fromHex(
        '6ddd3ffa226646ff1e00aad4003f792b93069cc4bb4086c5fb68e84c8ad31508');
  }
}
