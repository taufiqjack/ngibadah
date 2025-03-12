part of 'prayer_location_cubit.dart';

@freezed
class PrayerLocationState with _$PrayerLocationState {
  const factory PrayerLocationState.initial() = _Initial;
  const factory PrayerLocationState.error(String message) = _Error;
  const factory PrayerLocationState.success(PrayerTimeModel? prayertime) =
      _Success;
}
