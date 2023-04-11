import 'package:freezed_annotation/freezed_annotation.dart';

part 'doa_list_model.freezed.dart';
part 'doa_list_model.g.dart';

@Freezed()
class ListDoaModel with _$ListDoaModel {
  const factory ListDoaModel({
    String? id,
    String? doa,
    String? ayat,
    String? latin,
    String? artinya,
  }) = _ListDoaModel;

  factory ListDoaModel.fromJson(Map<String, dynamic> json) =>
      _$ListDoaModelFromJson(json);
}
