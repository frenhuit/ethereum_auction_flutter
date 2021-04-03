// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppConfig> _$appConfigSerializer = new _$AppConfigSerializer();

class _$AppConfigSerializer implements StructuredSerializer<AppConfig> {
  @override
  final Iterable<Type> types = const [AppConfig, _$AppConfig];
  @override
  final String wireName = 'AppConfig';

  @override
  Iterable<Object> serialize(Serializers serializers, AppConfig object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'rpcUrl',
      serializers.serialize(object.rpcUrl,
          specifiedType: const FullType(String)),
      'wsUrl',
      serializers.serialize(object.wsUrl,
          specifiedType: const FullType(String)),
      'auctionFactoryAddress',
      serializers.serialize(object.auctionFactoryAddress,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AppConfig deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppConfigBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'rpcUrl':
          result.rpcUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wsUrl':
          result.wsUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'auctionFactoryAddress':
          result.auctionFactoryAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AppConfig extends AppConfig {
  @override
  final String rpcUrl;
  @override
  final String wsUrl;
  @override
  final String auctionFactoryAddress;

  factory _$AppConfig([void Function(AppConfigBuilder) updates]) =>
      (new AppConfigBuilder()..update(updates)).build();

  _$AppConfig._({this.rpcUrl, this.wsUrl, this.auctionFactoryAddress})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(rpcUrl, 'AppConfig', 'rpcUrl');
    BuiltValueNullFieldError.checkNotNull(wsUrl, 'AppConfig', 'wsUrl');
    BuiltValueNullFieldError.checkNotNull(
        auctionFactoryAddress, 'AppConfig', 'auctionFactoryAddress');
  }

  @override
  AppConfig rebuild(void Function(AppConfigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppConfigBuilder toBuilder() => new AppConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppConfig &&
        rpcUrl == other.rpcUrl &&
        wsUrl == other.wsUrl &&
        auctionFactoryAddress == other.auctionFactoryAddress;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, rpcUrl.hashCode), wsUrl.hashCode),
        auctionFactoryAddress.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppConfig')
          ..add('rpcUrl', rpcUrl)
          ..add('wsUrl', wsUrl)
          ..add('auctionFactoryAddress', auctionFactoryAddress))
        .toString();
  }
}

class AppConfigBuilder implements Builder<AppConfig, AppConfigBuilder> {
  _$AppConfig _$v;

  String _rpcUrl;
  String get rpcUrl => _$this._rpcUrl;
  set rpcUrl(String rpcUrl) => _$this._rpcUrl = rpcUrl;

  String _wsUrl;
  String get wsUrl => _$this._wsUrl;
  set wsUrl(String wsUrl) => _$this._wsUrl = wsUrl;

  String _auctionFactoryAddress;
  String get auctionFactoryAddress => _$this._auctionFactoryAddress;
  set auctionFactoryAddress(String auctionFactoryAddress) =>
      _$this._auctionFactoryAddress = auctionFactoryAddress;

  AppConfigBuilder();

  AppConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rpcUrl = $v.rpcUrl;
      _wsUrl = $v.wsUrl;
      _auctionFactoryAddress = $v.auctionFactoryAddress;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppConfig other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppConfig;
  }

  @override
  void update(void Function(AppConfigBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppConfig build() {
    final _$result = _$v ??
        new _$AppConfig._(
            rpcUrl: BuiltValueNullFieldError.checkNotNull(
                rpcUrl, 'AppConfig', 'rpcUrl'),
            wsUrl: BuiltValueNullFieldError.checkNotNull(
                wsUrl, 'AppConfig', 'wsUrl'),
            auctionFactoryAddress: BuiltValueNullFieldError.checkNotNull(
                auctionFactoryAddress, 'AppConfig', 'auctionFactoryAddress'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
