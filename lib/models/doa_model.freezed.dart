// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'doa_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DoaModel _$DoaModelFromJson(Map<String, dynamic> json) {
  return _DoaModel.fromJson(json);
}

/// @nodoc
mixin _$DoaModel {
  String? get id => throw _privateConstructorUsedError;
  String? get doa => throw _privateConstructorUsedError;
  String? get ayat => throw _privateConstructorUsedError;
  String? get latin => throw _privateConstructorUsedError;
  String? get artinya => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoaModelCopyWith<DoaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoaModelCopyWith<$Res> {
  factory $DoaModelCopyWith(DoaModel value, $Res Function(DoaModel) then) =
      _$DoaModelCopyWithImpl<$Res, DoaModel>;
  @useResult
  $Res call(
      {String? id, String? doa, String? ayat, String? latin, String? artinya});
}

/// @nodoc
class _$DoaModelCopyWithImpl<$Res, $Val extends DoaModel>
    implements $DoaModelCopyWith<$Res> {
  _$DoaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$_DoaModelCopyWith<$Res> implements $DoaModelCopyWith<$Res> {
  factory _$$_DoaModelCopyWith(
          _$_DoaModel value, $Res Function(_$_DoaModel) then) =
      __$$_DoaModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id, String? doa, String? ayat, String? latin, String? artinya});
}

/// @nodoc
class __$$_DoaModelCopyWithImpl<$Res>
    extends _$DoaModelCopyWithImpl<$Res, _$_DoaModel>
    implements _$$_DoaModelCopyWith<$Res> {
  __$$_DoaModelCopyWithImpl(
      _$_DoaModel _value, $Res Function(_$_DoaModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? doa = freezed,
    Object? ayat = freezed,
    Object? latin = freezed,
    Object? artinya = freezed,
  }) {
    return _then(_$_DoaModel(
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
class _$_DoaModel implements _DoaModel {
  const _$_DoaModel({this.id, this.doa, this.ayat, this.latin, this.artinya});

  factory _$_DoaModel.fromJson(Map<String, dynamic> json) =>
      _$$_DoaModelFromJson(json);

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
    return 'DoaModel(id: $id, doa: $doa, ayat: $ayat, latin: $latin, artinya: $artinya)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DoaModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.doa, doa) || other.doa == doa) &&
            (identical(other.ayat, ayat) || other.ayat == ayat) &&
            (identical(other.latin, latin) || other.latin == latin) &&
            (identical(other.artinya, artinya) || other.artinya == artinya));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, doa, ayat, latin, artinya);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DoaModelCopyWith<_$_DoaModel> get copyWith =>
      __$$_DoaModelCopyWithImpl<_$_DoaModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DoaModelToJson(
      this,
    );
  }
}

abstract class _DoaModel implements DoaModel {
  const factory _DoaModel(
      {final String? id,
      final String? doa,
      final String? ayat,
      final String? latin,
      final String? artinya}) = _$_DoaModel;

  factory _DoaModel.fromJson(Map<String, dynamic> json) = _$_DoaModel.fromJson;

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
  @override
  @JsonKey(ignore: true)
  _$$_DoaModelCopyWith<_$_DoaModel> get copyWith =>
      throw _privateConstructorUsedError;
}
