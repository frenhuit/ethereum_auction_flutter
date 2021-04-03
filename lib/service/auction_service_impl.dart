import 'package:ethereum_auction/service/auction.dart';
import 'package:ethereum_auction/service/auction_factory.dart';
import 'package:ethereum_auction/service/auction_service.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

class AuctionServiceImpl implements AuctionService {
  @override
  Auction auctionAt(EthereumAddress contractAddress) {
    return Auction(contractAddress);
  }

  @override
  AuctionFactory get auctionFactoryInstance => AuctionFactory.instance();

  @override
  Future<Credentials> getCredential(
      Web3Client ethClient, String privateKey) async {
    return ethClient.credentialsFromPrivateKey(privateKey);
  }
}
