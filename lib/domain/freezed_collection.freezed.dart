// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'freezed_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UnionTearOff {
  const _$UnionTearOff();

  Data call([int? value]) {
    return Data(
      value,
    );
  }

  Loading loading() {
    return const Loading();
  }

  ErrorDetails error(String name) {
    return ErrorDetails(
      name,
    );
  }

  City city(String name, int population) {
    return City(
      name,
      population,
    );
  }
}

/// @nodoc
const $Union = _$UnionTearOff();

/// @nodoc
mixin _$Union {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int? value) $default, {
    required TResult Function() loading,
    required TResult Function(String name) error,
    required TResult Function(String name, int population) city,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(int? value)? $default, {
    TResult Function()? loading,
    TResult Function(String name)? error,
    TResult Function(String name, int population)? city,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int? value)? $default, {
    TResult Function()? loading,
    TResult Function(String name)? error,
    TResult Function(String name, int population)? city,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Data value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(ErrorDetails value) error,
    required TResult Function(City value) city,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(Data value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    TResult Function(City value)? city,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Data value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    TResult Function(City value)? city,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnionCopyWith<$Res> {
  factory $UnionCopyWith(Union value, $Res Function(Union) then) =
      _$UnionCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnionCopyWithImpl<$Res> implements $UnionCopyWith<$Res> {
  _$UnionCopyWithImpl(this._value, this._then);

  final Union _value;
  // ignore: unused_field
  final $Res Function(Union) _then;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res>;
  $Res call({int? value});
}

/// @nodoc
class _$DataCopyWithImpl<$Res> extends _$UnionCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(Data _value, $Res Function(Data) _then)
      : super(_value, (v) => _then(v as Data));

  @override
  Data get _value => super._value as Data;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(Data(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$Data with DiagnosticableTreeMixin implements Data {
  const _$Data([this.value]);

  @override
  final int? value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Union(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Union'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Data &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  $DataCopyWith<Data> get copyWith =>
      _$DataCopyWithImpl<Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int? value) $default, {
    required TResult Function() loading,
    required TResult Function(String name) error,
    required TResult Function(String name, int population) city,
  }) {
    return $default(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(int? value)? $default, {
    TResult Function()? loading,
    TResult Function(String name)? error,
    TResult Function(String name, int population)? city,
  }) {
    return $default?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int? value)? $default, {
    TResult Function()? loading,
    TResult Function(String name)? error,
    TResult Function(String name, int population)? city,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Data value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(ErrorDetails value) error,
    required TResult Function(City value) city,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(Data value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    TResult Function(City value)? city,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Data value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    TResult Function(City value)? city,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class Data implements Union {
  const factory Data([int? value]) = _$Data;

  int? get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$UnionCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc

class _$Loading with DiagnosticableTreeMixin implements Loading {
  const _$Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Union.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'Union.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int? value) $default, {
    required TResult Function() loading,
    required TResult Function(String name) error,
    required TResult Function(String name, int population) city,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(int? value)? $default, {
    TResult Function()? loading,
    TResult Function(String name)? error,
    TResult Function(String name, int population)? city,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int? value)? $default, {
    TResult Function()? loading,
    TResult Function(String name)? error,
    TResult Function(String name, int population)? city,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Data value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(ErrorDetails value) error,
    required TResult Function(City value) city,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(Data value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    TResult Function(City value)? city,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Data value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    TResult Function(City value)? city,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements Union {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $ErrorDetailsCopyWith<$Res> {
  factory $ErrorDetailsCopyWith(
          ErrorDetails value, $Res Function(ErrorDetails) then) =
      _$ErrorDetailsCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$ErrorDetailsCopyWithImpl<$Res> extends _$UnionCopyWithImpl<$Res>
    implements $ErrorDetailsCopyWith<$Res> {
  _$ErrorDetailsCopyWithImpl(
      ErrorDetails _value, $Res Function(ErrorDetails) _then)
      : super(_value, (v) => _then(v as ErrorDetails));

  @override
  ErrorDetails get _value => super._value as ErrorDetails;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(ErrorDetails(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorDetails with DiagnosticableTreeMixin implements ErrorDetails {
  const _$ErrorDetails(this.name);

  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Union.error(name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Union.error'))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorDetails &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  $ErrorDetailsCopyWith<ErrorDetails> get copyWith =>
      _$ErrorDetailsCopyWithImpl<ErrorDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int? value) $default, {
    required TResult Function() loading,
    required TResult Function(String name) error,
    required TResult Function(String name, int population) city,
  }) {
    return error(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(int? value)? $default, {
    TResult Function()? loading,
    TResult Function(String name)? error,
    TResult Function(String name, int population)? city,
  }) {
    return error?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int? value)? $default, {
    TResult Function()? loading,
    TResult Function(String name)? error,
    TResult Function(String name, int population)? city,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Data value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(ErrorDetails value) error,
    required TResult Function(City value) city,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(Data value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    TResult Function(City value)? city,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Data value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    TResult Function(City value)? city,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorDetails implements Union {
  const factory ErrorDetails(String name) = _$ErrorDetails;

  String get name => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorDetailsCopyWith<ErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityCopyWith<$Res> {
  factory $CityCopyWith(City value, $Res Function(City) then) =
      _$CityCopyWithImpl<$Res>;
  $Res call({String name, int population});
}

/// @nodoc
class _$CityCopyWithImpl<$Res> extends _$UnionCopyWithImpl<$Res>
    implements $CityCopyWith<$Res> {
  _$CityCopyWithImpl(City _value, $Res Function(City) _then)
      : super(_value, (v) => _then(v as City));

  @override
  City get _value => super._value as City;

  @override
  $Res call({
    Object? name = freezed,
    Object? population = freezed,
  }) {
    return _then(City(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      population == freezed
          ? _value.population
          : population // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$City with DiagnosticableTreeMixin implements City {
  const _$City(this.name, this.population);

  @override
  final String name;
  @override
  final int population;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Union.city(name: $name, population: $population)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Union.city'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('population', population));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is City &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.population, population) ||
                const DeepCollectionEquality()
                    .equals(other.population, population)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(population);

  @JsonKey(ignore: true)
  @override
  $CityCopyWith<City> get copyWith =>
      _$CityCopyWithImpl<City>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int? value) $default, {
    required TResult Function() loading,
    required TResult Function(String name) error,
    required TResult Function(String name, int population) city,
  }) {
    return city(name, population);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(int? value)? $default, {
    TResult Function()? loading,
    TResult Function(String name)? error,
    TResult Function(String name, int population)? city,
  }) {
    return city?.call(name, population);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int? value)? $default, {
    TResult Function()? loading,
    TResult Function(String name)? error,
    TResult Function(String name, int population)? city,
    required TResult orElse(),
  }) {
    if (city != null) {
      return city(name, population);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Data value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(ErrorDetails value) error,
    required TResult Function(City value) city,
  }) {
    return city(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(Data value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    TResult Function(City value)? city,
  }) {
    return city?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Data value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    TResult Function(City value)? city,
    required TResult orElse(),
  }) {
    if (city != null) {
      return city(this);
    }
    return orElse();
  }
}

abstract class City implements Union {
  const factory City(String name, int population) = _$City;

  String get name => throw _privateConstructorUsedError;
  int get population => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityCopyWith<City> get copyWith => throw _privateConstructorUsedError;
}
