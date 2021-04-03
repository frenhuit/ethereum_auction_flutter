import 'package:ethereum_auction/config/constant_value.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/web3dart.dart';

class SmartContract {
  final String name;
  final EthereumAddress address;
  DeployedContract contract;

  SmartContract(this.name, this.address);

  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString("assets/$name.json");
    contract = await DeployedContract(ContractAbi.fromJson(abi, name), address);
    return contract;
  }

  @override
  String toString() {
    return 'SmartContract{name: $name, address: '
        '$address, contract: $contract}';
  }

  Future<List<dynamic>> query(
      Web3Client ethClient, String functionName, List<dynamic> args) async {
    if (contract == null) {
      await loadContract();
    }
    final function = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: function, params: args);
    return result;
  }

  Future<String> submit(Web3Client ethClient, Credentials credential,
      String functionName, List<dynamic> args, BigInt amount) async {
    if (contract == null) {
      await loadContract();
    }
    final function = contract.function(functionName);
    String result = '';
    try {
      final response = await ethClient.sendTransaction(
          credential,
          Transaction.callContract(
              contract: contract,
              function: function,
              parameters: args,
              gasPrice: ConstantValue.gasPrice,
              maxGas: ConstantValue.maxGas,
              value: EtherAmount.fromUnitAndValue(EtherUnit.wei, amount)),
          fetchChainIdFromNetworkId: true);

      result = response;

      if (response.contains(new RegExp(r'0x.*'))) {
        // Response is transaction hash
        // Checks if transaction is success
        TransactionReceipt receipt;
        while (receipt == null) {
          receipt = await ethClient.getTransactionReceipt(result);
        }
        if (!receipt.status) {
          final info = await ethClient.getTransactionByHash(response);
          result = await ethClient.callRaw(
              sender: info.from, contract: info.to, data: info.input);
        }
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }
}
