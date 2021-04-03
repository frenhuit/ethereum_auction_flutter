// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HomeViewModel> _$homeViewModelSerializer =
    new _$HomeViewModelSerializer();

class _$HomeViewModelSerializer implements StructuredSerializer<HomeViewModel> {
  @override
  final Iterable<Type> types = const [HomeViewModel, _$HomeViewModel];
  @override
  final String wireName = 'HomeViewModel';

  @override
  Iterable<Object> serialize(Serializers serializers, HomeViewModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.auctionSummaries;
    if (value != null) {
      result
        ..add('auctionSummaries')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(AuctionSummary)])));
    }
    return result;
  }

  @override
  HomeViewModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HomeViewModelBuilder();

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
      }
    }

    return result.build();
  }
}

class _$HomeViewModel extends HomeViewModel {
  @override
  final BuiltList<AuctionSummary> auctionSummaries;

  factory _$HomeViewModel([void Function(HomeViewModelBuilder) updates]) =>
      (new HomeViewModelBuilder()..update(updates)).build();

  _$HomeViewModel._({this.auctionSummaries}) : super._();

  @override
  HomeViewModel rebuild(void Function(HomeViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeViewModelBuilder toBuilder() => new HomeViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeViewModel && auctionSummaries == other.auctionSummaries;
  }

  @override
  int get hashCode {
    return $jf($jc(0, auctionSummaries.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HomeViewModel')
          ..add('auctionSummaries', auctionSummaries))
        .toString();
  }
}

class HomeViewModelBuilder
    implements Builder<HomeViewModel, HomeViewModelBuilder> {
  _$HomeViewModel _$v;

  ListBuilder<AuctionSummary> _auctionSummaries;
  ListBuilder<AuctionSummary> get auctionSummaries =>
      _$this._auctionSummaries ??= new ListBuilder<AuctionSummary>();
  set auctionSummaries(ListBuilder<AuctionSummary> auctionSummaries) =>
      _$this._auctionSummaries = auctionSummaries;

  HomeViewModelBuilder();

  HomeViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _auctionSummaries = $v.auctionSummaries?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HomeViewModel;
  }

  @override
  void update(void Function(HomeViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HomeViewModel build() {
    _$HomeViewModel _$result;
    try {
      _$result = _$v ??
          new _$HomeViewModel._(auctionSummaries: _auctionSummaries?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'auctionSummaries';
        _auctionSummaries?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HomeViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
