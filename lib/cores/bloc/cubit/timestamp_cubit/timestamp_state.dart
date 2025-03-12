part of 'timestamp_cubit.dart';

@freezed
class TimestampState with _$TimestampState {
  const factory TimestampState.initial() = _Initial;
  const factory TimestampState.error(String message) = _Error;
  const factory TimestampState.success(TimestampModel? timestamp) = _Success;
}
