import 'package:siakad_app/data/models/response/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  Future<bool> saveAuthData(AuthResponseModel data) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.setString('auth', data.toJson());
    return result;
  }

  Future<bool> removeAuthData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final result = await pref.remove('auth');
    return result;
  }

  Future<String> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    if (authJson.isEmpty) {
      return '';
    }
    final authModel = AuthResponseModel.fromJson(authJson);
    return authModel.jwtToken;
  }

  Future<bool> isLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    return authJson.isNotEmpty;
  }

  Future<User> getUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authModel = AuthResponseModel.fromJson(authJson);
    return authModel.user;
  }

  Future<String> getUserRole() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authModel = AuthResponseModel.fromJson(authJson);
    return authModel.user.roles;
  }
}
