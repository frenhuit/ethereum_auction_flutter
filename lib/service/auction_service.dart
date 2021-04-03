import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

import 'auction.dart';
import 'auction_factory.dart';

abstract class AuctionService {
  AuctionFactory get auctionFactoryInstance;

  Auction auctionAt(EthereumAddress contractAddress);

  Future<Credentials> getCredential(Web3Client ethClient, String privateKey);
}
