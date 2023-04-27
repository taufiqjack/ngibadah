// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'surah_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SurahModel _$SurahModelFromJson(Map<String, dynamic> json) {
  return _SurahModel.fromJson(json);
}

/// @nodoc
mixin _$SurahModel {
  @HiveField(0)
  int? get nomor => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get nama => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'nama_latin')
  String? get namaLatin => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'jumlah_ayat')
  int? get jumlahAyat => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'tempat_turun')
  String? get tempatTurun => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get arti => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get deskripsi => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get audio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurahModelCopyWith<SurahModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurahModelCopyWith<$Res> {
  factory $SurahModelCopyWith(
          SurahModel value, $Res Function(SurahModel) then) =
      _$SurahModelCopyWithImpl<$Res, SurahModel>;
  @useResult
  $Res call(
      {@HiveField(0) int? nomor,
      @HiveField(1) String? nama,
      @HiveField(2) @JsonKey(name: 'nama_latin') String? namaLatin,
      @HiveField(3) @JsonKey(name: 'jumlah_ayat') int? jumlahAyat,
      @HiveField(4) @JsonKey(name: 'tempat_turun') String? tempatTurun,
      @HiveField(5) String? arti,
      @HiveField(6) String? deskripsi,
      @HiveField(7) String? audio});
}

/// @nodoc
class _$SurahModelCopyWithImpl<$Res, $Val extends SurahModel>
    implements $SurahModelCopyWith<$Res> {
  _$SurahModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nomor = freezed,
    Object? nama = freezed,
    Object? namaLatin = freezed,
    Object? jumlahAyat = freezed,
    Object? tempatTurun = freezed,
    Object? arti = freezed,
    Object? deskripsi = freezed,
    Object? audio = freezed,
  }) {
    return _then(_value.copyWith(
      nomor: freezed == nomor
          ? _value.nomor
          : nomor // ignore: cast_nullable_to_non_nullable
              as int?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      namaLatin: freezed == namaLatin
          ? _value.namaLatin
          : namaLatin // ignore: cast_nullable_to_non_nullable
              as String?,
      jumlahAyat: freezed == jumlahAyat
          ? _value.jumlahAyat
          : jumlahAyat // ignore: cast_nullable_to_non_nullable
              as int?,
      tempatTurun: freezed == tempatTurun
          ? _value.tempatTurun
          : tempatTurun // ignore: cast_nullable_to_non_nullable
              as String?,
      arti: freezed == arti
          ? _value.arti
          : arti // ignore: cast_nullable_to_non_nullable
              as String?,
      deskripsi: freezed == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SurahModelCopyWith<$Res>
    implements $SurahModelCopyWith<$Res> {
  factory _$$_SurahModelCopyWith(
          _$_SurahModel value, $Res Function(_$_SurahModel) then) =
      __$$_SurahModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? nomor,
      @HiveField(1) String? nama,
      @HiveField(2) @JsonKey(name: 'nama_latin') String? namaLatin,
      @HiveField(3) @JsonKey(name: 'jumlah_ayat') int? jumlahAyat,
      @HiveField(4) @JsonKey(name: 'tempat_turun') String? tempatTurun,
      @HiveField(5) String? arti,
      @HiveField(6) String? deskripsi,
      @HiveField(7) String? audio});
}

/// @nodoc
class __$$_SurahModelCopyWithImpl<$Res>
    extends _$SurahModelCopyWithImpl<$Res, _$_SurahModel>
    implements _$$_SurahModelCopyWith<$Res> {
  __$$_SurahModelCopyWithImpl(
      _$_SurahModel _value, $Res Function(_$_SurahModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nomor = freezed,
    Object? nama = freezed,
    Object? namaLatin = freezed,
    Object? jumlahAyat = freezed,
    Object? tempatTurun = freezed,
    Object? arti = freezed,
    Object? deskripsi = freezed,
    Object? audio = freezed,
  }) {
    return _then(_$_SurahModel(
      nomor: freezed == nomor
          ? _value.nomor
          : nomor // ignore: cast_nullable_to_non_nullable
              as int?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      namaLatin: freezed == namaLatin
          ? _value.namaLatin
          : namaLatin // ignore: cast_nullable_to_non_nullable
              as String?,
      jumlahAyat: freezed == jumlahAyat
          ? _value.jumlahAyat
          : jumlahAyat // ignore: cast_nullable_to_non_nullable
              as int?,
      tempatTurun: freezed == tempatTurun
          ? _value.tempatTurun
          : tempatTurun // ignore: cast_nullable_to_non_nullable
              as String?,
      arti: freezed == arti
          ? _value.arti
          : arti // ignore: cast_nullable_to_non_nullable
              as String?,
      deskripsi: freezed == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SurahModel implements _SurahModel {
  const _$_SurahModel(
      {@HiveField(0) this.nomor,
      @HiveField(1) this.nama,
      @HiveField(2) @JsonKey(name: 'nama_latin') this.namaLatin,
      @HiveField(3) @JsonKey(name: 'jumlah_ayat') this.jumlahAyat,
      @HiveField(4) @JsonKey(name: 'tempat_turun') this.tempatTurun,
      @HiveField(5) this.arti,
      @HiveField(6) this.deskripsi,
      @HiveField(7) this.audio});

  factory _$_SurahModel.fromJson(Map<String, dynamic> json) =>
      _$$_SurahModelFromJson(json);

  @override
  @HiveField(0)
  final int? nomor;
  @override
  @HiveField(1)
  final String? nama;
  @override
  @HiveField(2)
  @JsonKey(name: 'nama_latin')
  final String? namaLatin;
  @override
  @HiveField(3)
  @JsonKey(name: 'jumlah_ayat')
  final int? jumlahAyat;
  @override
  @HiveField(4)
  @JsonKey(name: 'tempat_turun')
  final String? tempatTurun;
  @override
  @HiveField(5)
  final String? arti;
  @override
  @HiveField(6)
  final String? deskripsi;
  @override
  @HiveField(7)
  final String? audio;

  @override
  String toString() {
    return 'SurahModel(nomor: $nomor, nama: $nama, namaLatin: $namaLatin, jumlahAyat: $jumlahAyat, tempatTurun: $tempatTurun, arti: $arti, deskripsi: $deskripsi, audio: $audio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SurahModel &&
            (identical(other.nomor, nomor) || other.nomor == nomor) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.namaLatin, namaLatin) ||
                other.namaLatin == namaLatin) &&
            (identical(other.jumlahAyat, jumlahAyat) ||
                other.jumlahAyat == jumlahAyat) &&
            (identical(other.tempatTurun, tempatTurun) ||
                other.tempatTurun == tempatTurun) &&
            (identical(other.arti, arti) || other.arti == arti) &&
            (identical(other.deskripsi, deskripsi) ||
                other.deskripsi == deskripsi) &&
            (identical(other.audio, audio) || other.audio == audio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nomor, nama, namaLatin,
      jumlahAyat, tempatTurun, arti, deskripsi, audio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SurahModelCopyWith<_$_SurahModel> get copyWith =>
      __$$_SurahModelCopyWithImpl<_$_SurahModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurahModelToJson(
      this,
    );
  }
}

abstract class _SurahModel implements SurahModel {
  const factory _SurahModel(
      {@HiveField(0) final int? nomor,
      @HiveField(1) final String? nama,
      @HiveField(2) @JsonKey(name: 'nama_latin') final String? namaLatin,
      @HiveField(3) @JsonKey(name: 'jumlah_ayat') final int? jumlahAyat,
      @HiveField(4) @JsonKey(name: 'tempat_turun') final String? tempatTurun,
      @HiveField(5) final String? arti,
      @HiveField(6) final String? deskripsi,
      @HiveField(7) final String? audio}) = _$_SurahModel;

  factory _SurahModel.fromJson(Map<String, dynamic> json) =
      _$_SurahModel.fromJson;

  @override
  @HiveField(0)
  int? get nomor;
  @override
  @HiveField(1)
  String? get nama;
  @override
  @HiveField(2)
  @JsonKey(name: 'nama_latin')
  String? get namaLatin;
  @override
  @HiveField(3)
  @JsonKey(name: 'jumlah_ayat')
  int? get jumlahAyat;
  @override
  @HiveField(4)
  @JsonKey(name: 'tempat_turun')
  String? get tempatTurun;
  @override
  @HiveField(5)
  String? get arti;
  @override
  @HiveField(6)
  String? get deskripsi;
  @override
  @HiveField(7)
  String? get audio;
  @override
  @JsonKey(ignore: true)
  _$$_SurahModelCopyWith<_$_SurahModel> get copyWith =>
      throw _privateConstructorUsedError;
}
