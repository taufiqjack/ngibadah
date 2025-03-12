import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monggo_sholat/cores/repository/dashboard_repository.dart';
import 'package:monggo_sholat/models/prayer_time_model.dart';

part 'prayer_location_state.dart';
part 'prayer_location_cubit.freezed.dart';

class PrayerLocationCubit extends Cubit<PrayerLocationState> {
  final _repo = DashboardRepository();
  PrayerLocationCubit() : super(PrayerLocationState.initial());

  Future<PrayerTimeModel?> getPrayerLoca(
      String latitude, String longitude, BuildContext context) async {
    try {
      emit(const PrayerLocationState.initial());
      final prayer =
          await _repo.getPrayerLocation(latitude, longitude, context);
      emit(PrayerLocationState.success(prayer!));
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(PrayerLocationState.error(e.toString()));
    }
    return null;
  }
}
