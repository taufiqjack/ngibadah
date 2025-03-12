part of 'hadis_cubit.dart';

@freezed
class HadisState with _$HadisState {
  const factory HadisState.initial() = _Initial;
  const factory HadisState.error(String message) = _Error;
  const factory HadisState.success(HadisModel? haids) = _Success;
}
