// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:siakad_app/data/datasources/schedule_remote_datasource.dart';

import '../../data/models/response/schedule_response_model.dart';

part 'schedule_bloc.freezed.dart';
part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleRemoteDatasource datasource;
  ScheduleBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_GetSchedule>((event, emit) async {
      emit(const _Loading());
      final response = await datasource.getSchedules();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data!)),
      );
    });
  }
}
