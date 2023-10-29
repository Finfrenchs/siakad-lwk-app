import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:siakad_app/common/constants/variables.dart';

import '../models/response/schedule_response_model.dart';
import 'auth_local_datasource.dart';

class ScheduleRemoteDatasource {
  Future<Either<String, ScheduleResponseModel>> getSchedules() async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/schedules'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return Right(ScheduleResponseModel.fromJson(response.body));
    } else {
      return const Left('Server error');
    }
  }
}
