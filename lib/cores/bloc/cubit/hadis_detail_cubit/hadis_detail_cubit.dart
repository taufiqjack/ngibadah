import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monggo_sholat/cores/repository/dashboard_repository.dart';
import 'package:monggo_sholat/models/hadis_detail_model.dart';

part 'hadis_detail_state.dart';
part 'hadis_detail_cubit.freezed.dart';

class HadisDetailCubit extends Cubit<HadisDetailState> {
  final _repo = DashboardRepository();
  HadisDetailCubit() : super(HadisDetailState.initial());

  Future<HadisDetailModel?> getHadisDetail(int id, BuildContext context) async {
    try {
      emit(const HadisDetailState.initial());
      final hadis = await _repo.getDetailHadis(id, context);
      emit(HadisDetailState.success(hadis));
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(HadisDetailState.error(e.toString()));
    }
    return null;
  }
}
