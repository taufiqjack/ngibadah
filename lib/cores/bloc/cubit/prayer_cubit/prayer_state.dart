part of 'prayer_cubit.dart';

@freezed
class PrayerState with _$PrayerState {
  const factory PrayerState.initial() = _Initial;
  const factory PrayerState.error(String message) = _Error;
  const factory PrayerState.success(SholluModel? prayer) = _Success;
}
