import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monggo_sholat/cores/repository/dashboard_repository.dart';
import 'package:monggo_sholat/models/hadis_model.dart';

part 'hadis_state.dart';
part 'hadis_cubit.freezed.dart';

class HadisCubit extends Cubit<HadisState> {
  final _repo = DashboardRepository();
  HadisCubit() : super(HadisState.initial());

  Future<HadisModel?> getHadis(BuildContext context) async {
    try {
      emit(const HadisState.initial());
      final hadis = await _repo.getHadis(context);
      emit(HadisState.success(hadis));
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(HadisState.error(e.toString()));
    }
    return null;
  }
}
