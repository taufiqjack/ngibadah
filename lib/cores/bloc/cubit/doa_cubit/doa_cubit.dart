import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monggo_sholat/cores/repository/dashboard_repository.dart';
import 'package:monggo_sholat/models/doa_model.dart';

part 'doa_state.dart';
part 'doa_cubit.freezed.dart';

class DoaCubit extends Cubit<DoaState> {
  final _repo = DashboardRepository();
  DoaCubit() : super(DoaState.initial());

  Future<DoaModel?> getDoa(BuildContext context) async {
    try {
      emit(const DoaState.initial());
      final hadis = await _repo.getDoa(context);
      emit(DoaState.success(hadis!));
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(DoaState.error(e.toString()));
    }
    return null;
  }
}
