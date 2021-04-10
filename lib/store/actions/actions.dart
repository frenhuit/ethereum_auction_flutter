import 'package:quiver/check.dart';
import 'package:web3dart/credentials.dart';

class GetAuctionSummariesAction extends AsyncAction {
  GetAuctionSummariesAction();
}

class CreateAuctionAction extends AsyncAction {
  Credentials _userCredential;
  List<dynamic> _args;

  Credentials get userCredential => _userCredential;

  CreateAuctionAction(Credentials userCredential, List<dynamic> args) {
    checkArgument(userCredential != null);
    _userCredential = userCredential;
    _args = args ?? [];
  }

  List<dynamic> get args => _args;
}

class UpdateEthResponseAction {
  String _response;

  UpdateEthResponseAction(String response) {
    _response = response ?? '';
  }

  String get response => _response;
}

class GetUserCredentialAction extends AsyncAction {
  String _privateKey;

  GetUserCredentialAction(String privateKey) {
    _privateKey = privateKey ?? '';
  }

  String get privateKey => _privateKey;
}

class UpdateUserCredentialAction {
  Credentials _credential;
  EthereumAddress _ethAddress;

  UpdateUserCredentialAction(Credentials credential) {
    checkArgument(credential != null);
    _credential = credential;
  }

  set ethAddress(EthereumAddress value) {
    _ethAddress = value;
  }

  EthereumAddress get ethAddress => _ethAddress;

  Credentials get credential => _credential;
}

class GetAuctionDetailAction extends AsyncAction {
  EthereumAddress _contractAddress;

  EthereumAddress get contractAddress => _contractAddress;

  GetAuctionDetailAction(EthereumAddress contractAddress) {
    checkArgument(contractAddress != null);
    _contractAddress = contractAddress;
  }
}

class ClearPreviousAuctionAction {
  ClearPreviousAuctionAction();
}

class BidAction extends AsyncAction {
  EthereumAddress _contractAddress;
  Credentials _credential;
  BigInt _amount;

  BidAction(
      EthereumAddress contractAddress, Credentials credential, BigInt amount) {
    checkArgument(contractAddress != null);
    checkArgument(credential != null);
    _contractAddress = contractAddress;
    _credential = credential;
    _amount = amount ?? BigInt.zero;
  }

  EthereumAddress get contractAddress => _contractAddress;

  Credentials get credential => _credential;

  BigInt get amount => _amount;
}

class RevokeAction extends AsyncAction {
  EthereumAddress _contractAddress;
  Credentials _credential;

  RevokeAction(EthereumAddress contractAddress, Credentials credential) {
    checkArgument(contractAddress != null);
    checkArgument(credential != null);
    _contractAddress = contractAddress;
    _credential = credential;
  }

  EthereumAddress get contractAddress => _contractAddress;

  Credentials get credential => _credential;
}

class EndAction extends AsyncAction {
  EthereumAddress _contractAddress;
  Credentials _credential;

  EndAction(EthereumAddress contractAddress, Credentials credential) {
    checkArgument(contractAddress != null);
    checkArgument(credential != null);
    _contractAddress = contractAddress;
    _credential = credential;
  }

  Credentials get credential => _credential;

  EthereumAddress get contractAddress => _contractAddress;
}

class CancelAction extends AsyncAction {
  EthereumAddress _contractAddress;
  Credentials _credential;

  CancelAction(EthereumAddress contractAddress, Credentials credential) {
    checkArgument(contractAddress != null);
    checkArgument(credential != null);
    _contractAddress = contractAddress;
    _credential = credential;
  }

  EthereumAddress get contractAddress => _contractAddress;

  Credentials get credential => _credential;
}

class UpdateShippingInfoAction extends AsyncAction {
  EthereumAddress _contractAddress;
  Credentials _credential;
  String _shippingInfo;

  UpdateShippingInfoAction(EthereumAddress contractAddress,
      Credentials credential, String shippingInfo) {
    checkArgument(contractAddress != null);
    checkArgument(credential != null);
    _contractAddress = contractAddress;
    _credential = credential;
    _shippingInfo = shippingInfo ?? '';
  }

  String get shippingInfo => _shippingInfo;

  Credentials get credential => _credential;

  EthereumAddress get contractAddress => _contractAddress;
}

class UpdateLoadingStateAction {
  final bool loadingState;

  const UpdateLoadingStateAction(this.loadingState);
}

class AsyncAction {}
