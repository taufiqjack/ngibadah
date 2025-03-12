part of 'surah_cubit.dart';

@freezed
class SurahState with _$SurahState {
  const factory SurahState.initial() = _Initial;
  const factory SurahState.error(String message) = _Error;
  const factory SurahState.success(List<SurahModel>? surah) = _Success;
}
