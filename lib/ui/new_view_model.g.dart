// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_view_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NewViewModel> _$newViewModelSerializer =
    new _$NewViewModelSerializer();

class _$NewViewModelSerializer implements StructuredSerializer<NewViewModel> {
  @override
  final Iterable<Type> types = const [NewViewModel, _$NewViewModel];
  @override
  final String wireName = 'NewViewModel';

  @override
  Iterable<Object> serialize(Serializers serializers, NewViewModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(User)),
      'ethResponse',
      serializers.serialize(object.ethResponse,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  NewViewModel deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewViewModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
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

class _$NewViewModel extends NewViewModel {
  @override
  final User user;
  @override
  final String ethResponse;

  factory _$NewViewModel([void Function(NewViewModelBuilder) updates]) =>
      (new NewViewModelBuilder()..update(updates)).build();

  _$NewViewModel._({this.user, this.ethResponse}) : super._() {
    BuiltValueNullFieldError.checkNotNull(user, 'NewViewModel', 'user');
    BuiltValueNullFieldError.checkNotNull(
        ethResponse, 'NewViewModel', 'ethResponse');
  }

  @override
  NewViewModel rebuild(void Function(NewViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewViewModelBuilder toBuilder() => new NewViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewViewModel &&
        user == other.user &&
        ethResponse == other.ethResponse;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, user.hashCode), ethResponse.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewViewModel')
          ..add('user', user)
          ..add('ethResponse', ethResponse))
        .toString();
  }
}

class NewViewModelBuilder
    implements Builder<NewViewModel, NewViewModelBuilder> {
  _$NewViewModel _$v;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  String _ethResponse;
  String get ethResponse => _$this._ethResponse;
  set ethResponse(String ethResponse) => _$this._ethResponse = ethResponse;

  NewViewModelBuilder();

  NewViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user.toBuilder();
      _ethResponse = $v.ethResponse;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewViewModel;
  }

  @override
  void update(void Function(NewViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NewViewModel build() {
    _$NewViewModel _$result;
    try {
      _$result = _$v ??
          new _$NewViewModel._(
              user: user.build(),
              ethResponse: BuiltValueNullFieldError.checkNotNull(
                  ethResponse, 'NewViewModel', 'ethResponse'));
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NewViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
