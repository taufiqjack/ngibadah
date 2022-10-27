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
  int? get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<Data>? get data => throw _privateConstructorUsedError;

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
  $Res call({int? code, String? message, List<Data>? data});
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
    Object? code = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>?,
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
  $Res call({int? code, String? message, List<Data>? data});
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
    Object? code = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_DoaModel(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Data>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DoaModel implements _DoaModel {
  const _$_DoaModel({this.code, this.message, final List<Data>? data})
      : _data = data;

  factory _$_DoaModel.fromJson(Map<String, dynamic> json) =>
      _$$_DoaModelFromJson(json);

  @override
  final int? code;
  @override
  final String? message;
  final List<Data>? _data;
  @override
  List<Data>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DoaModel(code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DoaModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, message, const DeepCollectionEquality().hash(_data));

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
      {final int? code,
      final String? message,
      final List<Data>? data}) = _$_DoaModel;

  factory _DoaModel.fromJson(Map<String, dynamic> json) = _$_DoaModel.fromJson;

  @override
  int? get code;
  @override
  String? get message;
  @override
  List<Data>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_DoaModelCopyWith<_$_DoaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  String? get idDoa => throw _privateConstructorUsedError;
  String? get nama => throw _privateConstructorUsedError;
  String? get lafal => throw _privateConstructorUsedError;
  String? get transliterasi => throw _privateConstructorUsedError;
  String? get arti => throw _privateConstructorUsedError;
  String? get riwayat => throw _privateConstructorUsedError;
  String? get keterangan => throw _privateConstructorUsedError;
  List<String>? get kataKunci => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {String? idDoa,
      String? nama,
      String? lafal,
      String? transliterasi,
      String? arti,
      String? riwayat,
      String? keterangan,
      List<String>? kataKunci});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDoa = freezed,
    Object? nama = freezed,
    Object? lafal = freezed,
    Object? transliterasi = freezed,
    Object? arti = freezed,
    Object? riwayat = freezed,
    Object? keterangan = freezed,
    Object? kataKunci = freezed,
  }) {
    return _then(_value.copyWith(
      idDoa: freezed == idDoa
          ? _value.idDoa
          : idDoa // ignore: cast_nullable_to_non_nullable
              as String?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      lafal: freezed == lafal
          ? _value.lafal
          : lafal // ignore: cast_nullable_to_non_nullable
              as String?,
      transliterasi: freezed == transliterasi
          ? _value.transliterasi
          : transliterasi // ignore: cast_nullable_to_non_nullable
              as String?,
      arti: freezed == arti
          ? _value.arti
          : arti // ignore: cast_nullable_to_non_nullable
              as String?,
      riwayat: freezed == riwayat
          ? _value.riwayat
          : riwayat // ignore: cast_nullable_to_non_nullable
              as String?,
      keterangan: freezed == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String?,
      kataKunci: freezed == kataKunci
          ? _value.kataKunci
          : kataKunci // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? idDoa,
      String? nama,
      String? lafal,
      String? transliterasi,
      String? arti,
      String? riwayat,
      String? keterangan,
      List<String>? kataKunci});
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDoa = freezed,
    Object? nama = freezed,
    Object? lafal = freezed,
    Object? transliterasi = freezed,
    Object? arti = freezed,
    Object? riwayat = freezed,
    Object? keterangan = freezed,
    Object? kataKunci = freezed,
  }) {
    return _then(_$_Data(
      idDoa: freezed == idDoa
          ? _value.idDoa
          : idDoa // ignore: cast_nullable_to_non_nullable
              as String?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      lafal: freezed == lafal
          ? _value.lafal
          : lafal // ignore: cast_nullable_to_non_nullable
              as String?,
      transliterasi: freezed == transliterasi
          ? _value.transliterasi
          : transliterasi // ignore: cast_nullable_to_non_nullable
              as String?,
      arti: freezed == arti
          ? _value.arti
          : arti // ignore: cast_nullable_to_non_nullable
              as String?,
      riwayat: freezed == riwayat
          ? _value.riwayat
          : riwayat // ignore: cast_nullable_to_non_nullable
              as String?,
      keterangan: freezed == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String?,
      kataKunci: freezed == kataKunci
          ? _value._kataKunci
          : kataKunci // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data(
      {this.idDoa,
      this.nama,
      this.lafal,
      this.transliterasi,
      this.arti,
      this.riwayat,
      this.keterangan,
      final List<String>? kataKunci})
      : _kataKunci = kataKunci;

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final String? idDoa;
  @override
  final String? nama;
  @override
  final String? lafal;
  @override
  final String? transliterasi;
  @override
  final String? arti;
  @override
  final String? riwayat;
  @override
  final String? keterangan;
  final List<String>? _kataKunci;
  @override
  List<String>? get kataKunci {
    final value = _kataKunci;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Data(idDoa: $idDoa, nama: $nama, lafal: $lafal, transliterasi: $transliterasi, arti: $arti, riwayat: $riwayat, keterangan: $keterangan, kataKunci: $kataKunci)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.idDoa, idDoa) || other.idDoa == idDoa) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.lafal, lafal) || other.lafal == lafal) &&
            (identical(other.transliterasi, transliterasi) ||
                other.transliterasi == transliterasi) &&
            (identical(other.arti, arti) || other.arti == arti) &&
            (identical(other.riwayat, riwayat) || other.riwayat == riwayat) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan) &&
            const DeepCollectionEquality()
                .equals(other._kataKunci, _kataKunci));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idDoa,
      nama,
      lafal,
      transliterasi,
      arti,
      riwayat,
      keterangan,
      const DeepCollectionEquality().hash(_kataKunci));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {final String? idDoa,
      final String? nama,
      final String? lafal,
      final String? transliterasi,
      final String? arti,
      final String? riwayat,
      final String? keterangan,
      final List<String>? kataKunci}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  String? get idDoa;
  @override
  String? get nama;
  @override
  String? get lafal;
  @override
  String? get transliterasi;
  @override
  String? get arti;
  @override
  String? get riwayat;
  @override
  String? get keterangan;
  @override
  List<String>? get kataKunci;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}
