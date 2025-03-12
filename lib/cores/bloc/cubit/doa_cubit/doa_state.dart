part of 'doa_cubit.dart';

@freezed
class DoaState with _$DoaState {
  const factory DoaState.initial() = _Initial;
  const factory DoaState.error(String message) = _Error;
  const factory DoaState.success(DoaModel? doa) = _Success;
}
