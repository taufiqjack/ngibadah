import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monggo_sholat/cores/repository/dashboard_repository.dart';
import 'package:monggo_sholat/models/surah/surah_model.dart';

part 'surah_state.dart';
part 'surah_cubit.freezed.dart';

class SurahCubit extends Cubit<SurahState> {
  final _repo = DashboardRepository();
  SurahCubit() : super(SurahState.initial());

  Future<List<SurahModel>?> getNotif(BuildContext context) async {
    try {
      emit(const SurahState.initial());
      final surah = await _repo.getSurah(context);
      emit(SurahState.success(surah!));
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(SurahState.error(e.toString()));
    }
    return null;
  }
}
