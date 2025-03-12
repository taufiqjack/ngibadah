import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monggo_sholat/cores/repository/dashboard_repository.dart';
import 'package:monggo_sholat/models/timestamp_model.dart';

part 'timestamp_state.dart';
part 'timestamp_cubit.freezed.dart';

class TimestampCubit extends Cubit<TimestampState> {
  final _repo = DashboardRepository();
  TimestampCubit() : super(TimestampState.initial());

  Future<TimestampModel?> getTimestamp(BuildContext context) async {
    try {
      emit(const TimestampState.initial());
      final time = await _repo.getTimestamp(context);
      emit(TimestampState.success(time!));
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(TimestampState.error(e.toString()));
    }
    return null;
  }
}
