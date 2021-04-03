// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();
Serializer<AuctionSummary> _$auctionSummarySerializer =
    new _$AuctionSummarySerializer();
Serializer<AuctionDetail> _$auctionDetailSerializer =
    new _$AuctionDetailSerializer();
Serializer<User> _$userSerializer = new _$UserSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable<Object> serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'auctionSummaries',
      serializers.serialize(object.auctionSummaries,
          specifiedType: const FullType(
              BuiltList, const [const FullType(AuctionSummary)])),
      'auctionDetail',
      serializers.serialize(object.auctionDetail,
          specifiedType: const FullType(AuctionDetail)),
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(User)),
      'ethResponse',
      serializers.serialize(object.ethResponse,
          specifiedType: const FullType(String)),
      'appConfig',
      serializers.serialize(object.appConfig,
          specifiedType: const FullType(AppConfig)),
    ];

    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'auctionSummaries':
          result.auctionSummaries.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AuctionSummary)]))
              as BuiltList<Object>);
          break;
        case 'auctionDetail':
          result.auctionDetail.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuctionDetail)) as AuctionDetail);
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User)) as User);
          break;
        case 'ethResponse':
          result.ethResponse = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'appConfig':
          result.appConfig.replace(serializers.deserialize(value,
              specifiedType: const FullType(AppConfig)) as AppConfig);
          break;
      }
    }

    return result.build();
  }
}

class _$AuctionSummarySerializer
    implements StructuredSerializer<AuctionSummary> {
  @override
  final Iterable<Type> types = const [AuctionSummary, _$AuctionSummary];
  @override
  final String wireName = 'AuctionSummary';

  @override
  Iterable<Object> serialize(Serializers serializers, AuctionSummary object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'item',
      serializers.serialize(object.item, specifiedType: const FullType(String)),
      'itemDescription',
      serializers.serialize(object.itemDescription,
          specifiedType: const FullType(String)),
      'startPrice',
      serializers.serialize(object.startPrice,
          specifiedType: const FullType(BigInt)),
    ];
    Object value;
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(EthereumAddress)));
    }
    return result;
  }

  @override
  AuctionSummary deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuctionSummaryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'address':
          result.address = serializers.deserialize(value,
                  specifiedType: const FullType(EthereumAddress))
              as EthereumAddress;
          break;
        case 'item':
          result.item = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'itemDescription':
          result.itemDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'startPrice':
          result.startPrice = serializers.deserialize(value,
              specifiedType: const FullType(BigInt)) as BigInt;
          break;
      }
    }

    return result.build();
  }
}

class _$AuctionDetailSerializer implements StructuredSerializer<AuctionDetail> {
  @override
  final Iterable<Type> types = const [AuctionDetail, _$AuctionDetail];
  @override
  final String wireName = 'AuctionDetail';

  @override
  Iterable<Object> serialize(Serializers serializers, AuctionDetail object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'item',
      serializers.serialize(object.item, specifiedType: const FullType(String)),
      'itemDescription',
      serializers.serialize(object.itemDescription,
          specifiedType: const FullType(String)),
      'currentHighestBidding',
      serializers.serialize(object.currentHighestBidding,
          specifiedType: const FullType(BigInt)),
      'startPrice',
      serializers.serialize(object.startPrice,
          specifiedType: const FullType(BigInt)),
      'currentState',
      serializers.serialize(object.currentState,
          specifiedType: const FullType(AuctionState)),
      'shippingInfo',
      serializers.serialize(object.shippingInfo,
          specifiedType: const FullType(String)),
    ];
    Object value;
    value = object.ownerAddress;
    if (value != null) {
      result
        ..add('ownerAddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(EthereumAddress)));
    }
    value = object.currentHighestBuyer;
    if (value != null) {
      result
        ..add('currentHighestBuyer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(EthereumAddress)));
    }
    value = object.contract;
    if (value != null) {
      result
        ..add('contract')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DeployedContract)));
    }
    return result;
  }

  @override
  AuctionDetail deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuctionDetailBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'ownerAddress':
          result.ownerAddress = serializers.deserialize(value,
                  specifiedType: const FullType(EthereumAddress))
              as EthereumAddress;
          break;
        case 'item':
          result.item = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'itemDescription':
          result.itemDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'currentHighestBidding':
          result.currentHighestBidding = serializers.deserialize(value,
              specifiedType: const FullType(BigInt)) as BigInt;
          break;
        case 'currentHighestBuyer':
          result.currentHighestBuyer = serializers.deserialize(value,
                  specifiedType: const FullType(EthereumAddress))
              as EthereumAddress;
          break;
        case 'startPrice':
          result.startPrice = serializers.deserialize(value,
              specifiedType: const FullType(BigInt)) as BigInt;
          break;
        case 'currentState':
          result.currentState = serializers.deserialize(value,
              specifiedType: const FullType(AuctionState)) as AuctionState;
          break;
        case 'shippingInfo':
          result.shippingInfo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contract':
          result.contract = serializers.deserialize(value,
                  specifiedType: const FullType(DeployedContract))
              as DeployedContract;
          break;
      }
    }

    return result.build();
  }
}

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.credential;
    if (value != null) {
      result
        ..add('credential')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Credentials)));
    }
    value = object.ethAddress;
    if (value != null) {
      result
        ..add('ethAddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(EthereumAddress)));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'credential':
          result.credential = serializers.deserialize(value,
              specifiedType: const FullType(Credentials)) as Credentials;
          break;
        case 'ethAddress':
          result.ethAddress = serializers.deserialize(value,
                  specifiedType: const FullType(EthereumAddress))
              as EthereumAddress;
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final BuiltList<AuctionSummary> auctionSummaries;
  @override
  final AuctionDetail auctionDetail;
  @override
  final User user;
  @override
  final String ethResponse;
  @override
  final AppConfig appConfig;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.auctionSummaries,
      this.auctionDetail,
      this.user,
      this.ethResponse,
      this.appConfig})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        auctionSummaries, 'AppState', 'auctionSummaries');
    BuiltValueNullFieldError.checkNotNull(
        auctionDetail, 'AppState', 'auctionDetail');
    BuiltValueNullFieldError.checkNotNull(user, 'AppState', 'user');
    BuiltValueNullFieldError.checkNotNull(
        ethResponse, 'AppState', 'ethResponse');
    BuiltValueNullFieldError.checkNotNull(appConfig, 'AppState', 'appConfig');
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        auctionSummaries == other.auctionSummaries &&
        auctionDetail == other.auctionDetail &&
        user == other.user &&
        ethResponse == other.ethResponse &&
        appConfig == other.appConfig;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, auctionSummaries.hashCode), auctionDetail.hashCode),
                user.hashCode),
            ethResponse.hashCode),
        appConfig.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('auctionSummaries', auctionSummaries)
          ..add('auctionDetail', auctionDetail)
          ..add('user', user)
          ..add('ethResponse', ethResponse)
          ..add('appConfig', appConfig))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  ListBuilder<AuctionSummary> _auctionSummaries;
  ListBuilder<AuctionSummary> get auctionSummaries =>
      _$this._auctionSummaries ??= new ListBuilder<AuctionSummary>();
  set auctionSummaries(ListBuilder<AuctionSummary> auctionSummaries) =>
      _$this._auctionSummaries = auctionSummaries;

  AuctionDetailBuilder _auctionDetail;
  AuctionDetailBuilder get auctionDetail =>
      _$this._auctionDetail ??= new AuctionDetailBuilder();
  set auctionDetail(AuctionDetailBuilder auctionDetail) =>
      _$this._auctionDetail = auctionDetail;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  String _ethResponse;
  String get ethResponse => _$this._ethResponse;
  set ethResponse(String ethResponse) => _$this._ethResponse = ethResponse;

  AppConfigBuilder _appConfig;
  AppConfigBuilder get appConfig =>
      _$this._appConfig ??= new AppConfigBuilder();
  set appConfig(AppConfigBuilder appConfig) => _$this._appConfig = appConfig;

  AppStateBuilder();

  AppStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _auctionSummaries = $v.auctionSummaries.toBuilder();
      _auctionDetail = $v.auctionDetail.toBuilder();
      _user = $v.user.toBuilder();
      _ethResponse = $v.ethResponse;
      _appConfig = $v.appConfig.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              auctionSummaries: auctionSummaries.build(),
              auctionDetail: auctionDetail.build(),
              user: user.build(),
              ethResponse: BuiltValueNullFieldError.checkNotNull(
                  ethResponse, 'AppState', 'ethResponse'),
              appConfig: appConfig.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'auctionSummaries';
        auctionSummaries.build();
        _$failedField = 'auctionDetail';
        auctionDetail.build();
        _$failedField = 'user';
        user.build();

        _$failedField = 'appConfig';
        appConfig.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$AuctionSummary extends AuctionSummary {
  @override
  final EthereumAddress address;
  @override
  final String item;
  @override
  final String itemDescription;
  @override
  final BigInt startPrice;

  factory _$AuctionSummary([void Function(AuctionSummaryBuilder) updates]) =>
      (new AuctionSummaryBuilder()..update(updates)).build();

  _$AuctionSummary._(
      {this.address, this.item, this.itemDescription, this.startPrice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(item, 'AuctionSummary', 'item');
    BuiltValueNullFieldError.checkNotNull(
        itemDescription, 'AuctionSummary', 'itemDescription');
    BuiltValueNullFieldError.checkNotNull(
        startPrice, 'AuctionSummary', 'startPrice');
  }

  @override
  AuctionSummary rebuild(void Function(AuctionSummaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuctionSummaryBuilder toBuilder() =>
      new AuctionSummaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuctionSummary &&
        address == other.address &&
        item == other.item &&
        itemDescription == other.itemDescription &&
        startPrice == other.startPrice;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, address.hashCode), item.hashCode),
            itemDescription.hashCode),
        startPrice.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuctionSummary')
          ..add('address', address)
          ..add('item', item)
          ..add('itemDescription', itemDescription)
          ..add('startPrice', startPrice))
        .toString();
  }
}

class AuctionSummaryBuilder
    implements Builder<AuctionSummary, AuctionSummaryBuilder> {
  _$AuctionSummary _$v;

  EthereumAddress _address;
  EthereumAddress get address => _$this._address;
  set address(EthereumAddress address) => _$this._address = address;

  String _item;
  String get item => _$this._item;
  set item(String item) => _$this._item = item;

  String _itemDescription;
  String get itemDescription => _$this._itemDescription;
  set itemDescription(String itemDescription) =>
      _$this._itemDescription = itemDescription;

  BigInt _startPrice;
  BigInt get startPrice => _$this._startPrice;
  set startPrice(BigInt startPrice) => _$this._startPrice = startPrice;

  AuctionSummaryBuilder();

  AuctionSummaryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _item = $v.item;
      _itemDescription = $v.itemDescription;
      _startPrice = $v.startPrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuctionSummary other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuctionSummary;
  }

  @override
  void update(void Function(AuctionSummaryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuctionSummary build() {
    final _$result = _$v ??
        new _$AuctionSummary._(
            address: address,
            item: BuiltValueNullFieldError.checkNotNull(
                item, 'AuctionSummary', 'item'),
            itemDescription: BuiltValueNullFieldError.checkNotNull(
                itemDescription, 'AuctionSummary', 'itemDescription'),
            startPrice: BuiltValueNullFieldError.checkNotNull(
                startPrice, 'AuctionSummary', 'startPrice'));
    replace(_$result);
    return _$result;
  }
}

class _$AuctionDetail extends AuctionDetail {
  @override
  final EthereumAddress ownerAddress;
  @override
  final String item;
  @override
  final String itemDescription;
  @override
  final BigInt currentHighestBidding;
  @override
  final EthereumAddress currentHighestBuyer;
  @override
  final BigInt startPrice;
  @override
  final AuctionState currentState;
  @override
  final String shippingInfo;
  @override
  final DeployedContract contract;

  factory _$AuctionDetail([void Function(AuctionDetailBuilder) updates]) =>
      (new AuctionDetailBuilder()..update(updates)).build();

  _$AuctionDetail._(
      {this.ownerAddress,
      this.item,
      this.itemDescription,
      this.currentHighestBidding,
      this.currentHighestBuyer,
      this.startPrice,
      this.currentState,
      this.shippingInfo,
      this.contract})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(item, 'AuctionDetail', 'item');
    BuiltValueNullFieldError.checkNotNull(
        itemDescription, 'AuctionDetail', 'itemDescription');
    BuiltValueNullFieldError.checkNotNull(
        currentHighestBidding, 'AuctionDetail', 'currentHighestBidding');
    BuiltValueNullFieldError.checkNotNull(
        startPrice, 'AuctionDetail', 'startPrice');
    BuiltValueNullFieldError.checkNotNull(
        currentState, 'AuctionDetail', 'currentState');
    BuiltValueNullFieldError.checkNotNull(
        shippingInfo, 'AuctionDetail', 'shippingInfo');
  }

  @override
  AuctionDetail rebuild(void Function(AuctionDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuctionDetailBuilder toBuilder() => new AuctionDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuctionDetail &&
        ownerAddress == other.ownerAddress &&
        item == other.item &&
        itemDescription == other.itemDescription &&
        currentHighestBidding == other.currentHighestBidding &&
        currentHighestBuyer == other.currentHighestBuyer &&
        startPrice == other.startPrice &&
        currentState == other.currentState &&
        shippingInfo == other.shippingInfo &&
        contract == other.contract;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, ownerAddress.hashCode),
                                    item.hashCode),
                                itemDescription.hashCode),
                            currentHighestBidding.hashCode),
                        currentHighestBuyer.hashCode),
                    startPrice.hashCode),
                currentState.hashCode),
            shippingInfo.hashCode),
        contract.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuctionDetail')
          ..add('ownerAddress', ownerAddress)
          ..add('item', item)
          ..add('itemDescription', itemDescription)
          ..add('currentHighestBidding', currentHighestBidding)
          ..add('currentHighestBuyer', currentHighestBuyer)
          ..add('startPrice', startPrice)
          ..add('currentState', currentState)
          ..add('shippingInfo', shippingInfo)
          ..add('contract', contract))
        .toString();
  }
}

class AuctionDetailBuilder
    implements Builder<AuctionDetail, AuctionDetailBuilder> {
  _$AuctionDetail _$v;

  EthereumAddress _ownerAddress;
  EthereumAddress get ownerAddress => _$this._ownerAddress;
  set ownerAddress(EthereumAddress ownerAddress) =>
      _$this._ownerAddress = ownerAddress;

  String _item;
  String get item => _$this._item;
  set item(String item) => _$this._item = item;

  String _itemDescription;
  String get itemDescription => _$this._itemDescription;
  set itemDescription(String itemDescription) =>
      _$this._itemDescription = itemDescription;

  BigInt _currentHighestBidding;
  BigInt get currentHighestBidding => _$this._currentHighestBidding;
  set currentHighestBidding(BigInt currentHighestBidding) =>
      _$this._currentHighestBidding = currentHighestBidding;

  EthereumAddress _currentHighestBuyer;
  EthereumAddress get currentHighestBuyer => _$this._currentHighestBuyer;
  set currentHighestBuyer(EthereumAddress currentHighestBuyer) =>
      _$this._currentHighestBuyer = currentHighestBuyer;

  BigInt _startPrice;
  BigInt get startPrice => _$this._startPrice;
  set startPrice(BigInt startPrice) => _$this._startPrice = startPrice;

  AuctionState _currentState;
  AuctionState get currentState => _$this._currentState;
  set currentState(AuctionState currentState) =>
      _$this._currentState = currentState;

  String _shippingInfo;
  String get shippingInfo => _$this._shippingInfo;
  set shippingInfo(String shippingInfo) => _$this._shippingInfo = shippingInfo;

  DeployedContract _contract;
  DeployedContract get contract => _$this._contract;
  set contract(DeployedContract contract) => _$this._contract = contract;

  AuctionDetailBuilder();

  AuctionDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ownerAddress = $v.ownerAddress;
      _item = $v.item;
      _itemDescription = $v.itemDescription;
      _currentHighestBidding = $v.currentHighestBidding;
      _currentHighestBuyer = $v.currentHighestBuyer;
      _startPrice = $v.startPrice;
      _currentState = $v.currentState;
      _shippingInfo = $v.shippingInfo;
      _contract = $v.contract;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuctionDetail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuctionDetail;
  }

  @override
  void update(void Function(AuctionDetailBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuctionDetail build() {
    final _$result = _$v ??
        new _$AuctionDetail._(
            ownerAddress: ownerAddress,
            item: BuiltValueNullFieldError.checkNotNull(
                item, 'AuctionDetail', 'item'),
            itemDescription: BuiltValueNullFieldError.checkNotNull(
                itemDescription, 'AuctionDetail', 'itemDescription'),
            currentHighestBidding: BuiltValueNullFieldError.checkNotNull(
                currentHighestBidding,
                'AuctionDetail',
                'currentHighestBidding'),
            currentHighestBuyer: currentHighestBuyer,
            startPrice: BuiltValueNullFieldError.checkNotNull(
                startPrice, 'AuctionDetail', 'startPrice'),
            currentState: BuiltValueNullFieldError.checkNotNull(
                currentState, 'AuctionDetail', 'currentState'),
            shippingInfo: BuiltValueNullFieldError.checkNotNull(
                shippingInfo, 'AuctionDetail', 'shippingInfo'),
            contract: contract);
    replace(_$result);
    return _$result;
  }
}

class _$User extends User {
  @override
  final Credentials credential;
  @override
  final EthereumAddress ethAddress;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._({this.credential, this.ethAddress}) : super._();

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        credential == other.credential &&
        ethAddress == other.ethAddress;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, credential.hashCode), ethAddress.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('credential', credential)
          ..add('ethAddress', ethAddress))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  Credentials _credential;
  Credentials get credential => _$this._credential;
  set credential(Credentials credential) => _$this._credential = credential;

  EthereumAddress _ethAddress;
  EthereumAddress get ethAddress => _$this._ethAddress;
  set ethAddress(EthereumAddress ethAddress) => _$this._ethAddress = ethAddress;

  UserBuilder();

  UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _credential = $v.credential;
      _ethAddress = $v.ethAddress;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    final _$result =
        _$v ?? new _$User._(credential: credential, ethAddress: ethAddress);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
