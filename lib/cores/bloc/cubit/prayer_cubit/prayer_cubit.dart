import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monggo_sholat/cores/repository/dashboard_repository.dart';
import 'package:monggo_sholat/models/prayer_time.dart';
import 'package:monggo_sholat/models/shollu_model/jadwal_sholat_model.dart';

part 'prayer_state.dart';
part 'prayer_cubit.freezed.dart';

class PrayerCubit extends Cubit<PrayerState> {
  final _repo = DashboardRepository();
  PrayerCubit() : super(PrayerState.initial());

  Future<PrayerModel?> getPrayer(BuildContext context) async {
    try {
      emit(const PrayerState.initial());
      final prayer = await _repo.getSchedule(context);
      emit(PrayerState.success(prayer!));
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(PrayerState.error(e.toString()));
    }
    return null;
  }
}
