import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monggo_sholat/cores/repository/dashboard_repository.dart';
import 'package:monggo_sholat/models/read_surah_model.dart';
import 'package:monggo_sholat/models/surah_detail_model.dart';

part 'detail_surah_state.dart';
part 'detail_surah_cubit.freezed.dart';

class DetailSurahCubit extends Cubit<DetailSurahState> {
  final _repo = DashboardRepository();
  DetailSurahCubit() : super(DetailSurahState.initial());

  Future<SurahDetailModel?> getSurahDetail(int id, BuildContext context) async {
    try {
      emit(const DetailSurahState.initial());
      final hadis = await _repo.getDetailSurah(id, context);
      emit(DetailSurahState.success(hadis));
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(DetailSurahState.error(e.toString()));
    }
    return null;
  }
}
