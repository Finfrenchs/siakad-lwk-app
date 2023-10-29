// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:siakad_app/data/datasources/khs_remote_datasource.dart';

import '../../data/models/response/khs_response_model.dart';

part 'khs_bloc.freezed.dart';
part 'khs_event.dart';
part 'khs_state.dart';

class KhsBloc extends Bloc<KhsEvent, KhsState> {
  KhsRemoteDatasource datasource;
  KhsBloc(
    this.datasource,
  ) : super(const _Initial()) {
    on<_GetKhs>((event, emit) async {
      emit(const _Loading());
      final response = await datasource.getKhs();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.data)),
      );
    });
  }
}
