// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doa_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListDoaModel _$ListDoaModelFromJson(Map<String, dynamic> json) {
  return _ListDoaModel.fromJson(json);
}

/// @nodoc
mixin _$ListDoaModel {
  String? get id => throw _privateConstructorUsedError;
  String? get doa => throw _privateConstructorUsedError;
  String? get ayat => throw _privateConstructorUsedError;
  String? get latin => throw _privateConstructorUsedError;
  String? get artinya => throw _privateConstructorUsedError;

  /// Serializes this ListDoaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListDoaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListDoaModelCopyWith<ListDoaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListDoaModelCopyWith<$Res> {
  factory $ListDoaModelCopyWith(
          ListDoaModel value, $Res Function(ListDoaModel) then) =
      _$ListDoaModelCopyWithImpl<$Res, ListDoaModel>;
  @useResult
  $Res call(
      {String? id, String? doa, String? ayat, String? latin, String? artinya});
}

/// @nodoc
class _$ListDoaModelCopyWithImpl<$Res, $Val extends ListDoaModel>
    implements $ListDoaModelCopyWith<$Res> {
  _$ListDoaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListDoaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? doa = freezed,
    Object? ayat = freezed,
    Object? latin = freezed,
    Object? artinya = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      doa: freezed == doa
          ? _value.doa
          : doa // ignore: cast_nullable_to_non_nullable
              as String?,
      ayat: freezed == ayat
          ? _value.ayat
          : ayat // ignore: cast_nullable_to_non_nullable
              as String?,
      latin: freezed == latin
          ? _value.latin
          : latin // ignore: cast_nullable_to_non_nullable
              as String?,
      artinya: freezed == artinya
          ? _value.artinya
          : artinya // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListDoaModelImplCopyWith<$Res>
    implements $ListDoaModelCopyWith<$Res> {
  factory _$$ListDoaModelImplCopyWith(
          _$ListDoaModelImpl value, $Res Function(_$ListDoaModelImpl) then) =
      __$$ListDoaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id, String? doa, String? ayat, String? latin, String? artinya});
}

/// @nodoc
class __$$ListDoaModelImplCopyWithImpl<$Res>
    extends _$ListDoaModelCopyWithImpl<$Res, _$ListDoaModelImpl>
    implements _$$ListDoaModelImplCopyWith<$Res> {
  __$$ListDoaModelImplCopyWithImpl(
      _$ListDoaModelImpl _value, $Res Function(_$ListDoaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListDoaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? doa = freezed,
    Object? ayat = freezed,
    Object? latin = freezed,
    Object? artinya = freezed,
  }) {
    return _then(_$ListDoaModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      doa: freezed == doa
          ? _value.doa
          : doa // ignore: cast_nullable_to_non_nullable
              as String?,
      ayat: freezed == ayat
          ? _value.ayat
          : ayat // ignore: cast_nullable_to_non_nullable
              as String?,
      latin: freezed == latin
          ? _value.latin
          : latin // ignore: cast_nullable_to_non_nullable
              as String?,
      artinya: freezed == artinya
          ? _value.artinya
          : artinya // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListDoaModelImpl implements _ListDoaModel {
  const _$ListDoaModelImpl(
      {this.id, this.doa, this.ayat, this.latin, this.artinya});

  factory _$ListDoaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListDoaModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? doa;
  @override
  final String? ayat;
  @override
  final String? latin;
  @override
  final String? artinya;

  @override
  String toString() {
    return 'ListDoaModel(id: $id, doa: $doa, ayat: $ayat, latin: $latin, artinya: $artinya)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListDoaModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.doa, doa) || other.doa == doa) &&
            (identical(other.ayat, ayat) || other.ayat == ayat) &&
            (identical(other.latin, latin) || other.latin == latin) &&
            (identical(other.artinya, artinya) || other.artinya == artinya));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, doa, ayat, latin, artinya);

  /// Create a copy of ListDoaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListDoaModelImplCopyWith<_$ListDoaModelImpl> get copyWith =>
      __$$ListDoaModelImplCopyWithImpl<_$ListDoaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListDoaModelImplToJson(
      this,
    );
  }
}

abstract class _ListDoaModel implements ListDoaModel {
  const factory _ListDoaModel(
      {final String? id,
      final String? doa,
      final String? ayat,
      final String? latin,
      final String? artinya}) = _$ListDoaModelImpl;

  factory _ListDoaModel.fromJson(Map<String, dynamic> json) =
      _$ListDoaModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get doa;
  @override
  String? get ayat;
  @override
  String? get latin;
  @override
  String? get artinya;

  /// Create a copy of ListDoaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListDoaModelImplCopyWith<_$ListDoaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
