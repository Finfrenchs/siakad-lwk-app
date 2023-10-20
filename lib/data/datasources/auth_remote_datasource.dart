import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:siakad_app/common/constants/variables.dart';
import 'package:siakad_app/data/models/request/auth_request_model.dart';
import 'package:siakad_app/data/models/response/auth_response_model.dart';
import 'package:http/http.dart' as http;

import 'auth_local_datasource.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      AuthRequestModel model) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      headers: headers,
      body: model.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      final errMessage = jsonDecode(response.body);
      return Left(
          //'Email and password are not available or are not the same. Check again!'
          errMessage['message']);
    }
  }

  Future<Either<String, String>> logout() async {
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/logout'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return const Right('logout success');
    } else {
      return const Left('Server error');
    }
  }
}
