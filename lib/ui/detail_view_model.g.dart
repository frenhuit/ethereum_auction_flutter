// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_view_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DetailViewModel> _$detailViewModelSerializer =
    new _$DetailViewModelSerializer();

class _$DetailViewModelSerializer
    implements StructuredSerializer<DetailViewModel> {
  @override
  final Iterable<Type> types = const [DetailViewModel, _$DetailViewModel];
  @override
  final String wireName = 'DetailViewModel';

  @override
  Iterable<Object> serialize(Serializers serializers, DetailViewModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(User)),
      'ethResponse',
      serializers.serialize(object.ethResponse,
          specifiedType: const FullType(String)),
    ];
    Object value;
    value = object.auctionDetail;
    if (value != null) {
      result
        ..add('auctionDetail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(AuctionDetail)));
    }
    return result;
  }

  @override
  DetailViewModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DetailViewModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
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
      }
    }

    return result.build();
  }
}

class _$DetailViewModel extends DetailViewModel {
  @override
  final AuctionDetail auctionDetail;
  @override
  final User user;
  @override
  final String ethResponse;

  factory _$DetailViewModel([void Function(DetailViewModelBuilder) updates]) =>
      (new DetailViewModelBuilder()..update(updates)).build();

  _$DetailViewModel._({this.auctionDetail, this.user, this.ethResponse})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(user, 'DetailViewModel', 'user');
    BuiltValueNullFieldError.checkNotNull(
        ethResponse, 'DetailViewModel', 'ethResponse');
  }

  @override
  DetailViewModel rebuild(void Function(DetailViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DetailViewModelBuilder toBuilder() =>
      new DetailViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DetailViewModel &&
        auctionDetail == other.auctionDetail &&
        user == other.user &&
        ethResponse == other.ethResponse;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, auctionDetail.hashCode), user.hashCode),
        ethResponse.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DetailViewModel')
          ..add('auctionDetail', auctionDetail)
          ..add('user', user)
          ..add('ethResponse', ethResponse))
        .toString();
  }
}

class DetailViewModelBuilder
    implements Builder<DetailViewModel, DetailViewModelBuilder> {
  _$DetailViewModel _$v;

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

  DetailViewModelBuilder();

  DetailViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _auctionDetail = $v.auctionDetail?.toBuilder();
      _user = $v.user.toBuilder();
      _ethResponse = $v.ethResponse;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DetailViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DetailViewModel;
  }

  @override
  void update(void Function(DetailViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DetailViewModel build() {
    _$DetailViewModel _$result;
    try {
      _$result = _$v ??
          new _$DetailViewModel._(
              auctionDetail: _auctionDetail?.build(),
              user: user.build(),
              ethResponse: BuiltValueNullFieldError.checkNotNull(
                  ethResponse, 'DetailViewModel', 'ethResponse'));
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'auctionDetail';
        _auctionDetail?.build();
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DetailViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
