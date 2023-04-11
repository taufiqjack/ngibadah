import 'package:freezed_annotation/freezed_annotation.dart';
part 'doa_model.freezed.dart';
part 'doa_model.g.dart';

@Freezed()
class DoaModel with _$DoaModel {
  const factory DoaModel({
    String? id,
    String? doa,
    String? ayat,
    String? latin,
    String? artinya,
  }) = _DoaModel;

  factory DoaModel.fromJson(Map<String, dynamic> json) =>
      _$DoaModelFromJson(json);
}
