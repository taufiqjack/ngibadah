part of 'detail_surah_cubit.dart';

@freezed
class DetailSurahState with _$DetailSurahState {
  const factory DetailSurahState.initial() = _Initial;
  const factory DetailSurahState.error(String message) = _Error;
  const factory DetailSurahState.success(ReadSurahModel? detailSurah) =
      _Success;
}
