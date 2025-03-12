part of 'hadis_detail_cubit.dart';

@freezed
class HadisDetailState with _$HadisDetailState {
  const factory HadisDetailState.initial() = _Initial;
  const factory HadisDetailState.error(String message) = _Error;
  const factory HadisDetailState.success(HadisDetailModel? hadisDetail) =
      _Success;
}
