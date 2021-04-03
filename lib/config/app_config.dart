import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_config.g.dart';

abstract class AppConfig implements Built<AppConfig, AppConfigBuilder> {
  static Serializer<AppConfig> get serializer => _$appConfigSerializer;

  String get rpcUrl;

  String get wsUrl;

  String get auctionFactoryAddress;

  AppConfig._();

  factory AppConfig([updates(AppConfigBuilder b)]) = _$AppConfig;

  static AppConfig initiatlize({EthNetwork network = EthNetwork.rinkeby}) =>
      AppConfig((b) {
        switch (network) {
          case EthNetwork.rinkeby:
            b.rpcUrl =
                'https://rinkeby.infura.io/v3/7042076252e84486934d1028f3a6b4d8';
            b.wsUrl =
                'wss://rinkeby.infura.io/ws/v3/7042076252e84486934d1028f3a6b4d8';
            b.auctionFactoryAddress =
                '0x8512C71ffB0e722EDD85585dDb981fAaf8Ea2487';
            break;
          case EthNetwork.ganache1:
            // use your LAN ip address instead of 127.0.0.1
            b.rpcUrl = 'http://127.0.0.1:7545';
            b.wsUrl = 'ws://127.0.0.1:7545';
            b.auctionFactoryAddress =
                '0xdf32267c4df8F133E23eB5Af1491011e9a8716eA';
            break;
          case EthNetwork.ganache2:
            b.rpcUrl = 'http://10.0.0.234:7545';
            b.wsUrl = 'ws://10.0.0.234:7545';
            b.auctionFactoryAddress =
                '0x1E609b271f8AF1647D852075A52882aeB4fF69Dd';
            break;
        }
      });
}

enum EthNetwork {
  rinkeby,
  ganache1,
  ganache2,
}

const networkMapping = <String, EthNetwork>{
  'rinkeby': EthNetwork.rinkeby,
  'ganache1': EthNetwork.ganache1,
  'ganache2': EthNetwork.ganache2
};
