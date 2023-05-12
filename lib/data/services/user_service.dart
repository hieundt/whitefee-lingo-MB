import 'package:dio/dio.dart';
import '../models/user_models/user_model.dart';

var api = 'https://backenddictionary-production.up.railway.app';

class UserService {
  var userApi = '$api/user';

  Future<User> getUserData() async {
    final response = await Dio().get(userApi);
    final result = User.fromJson(response.data[0]);
    return result;
  }

  Future<void> createAccount({
    required String email,
    required String password,
    required String userName,
    required DateTime dateOfBirth,
  }) async {
    await Dio().post(
      'https://backenddictionary-production.up.railway.app/vocabulary',
      data: {
        "email": email,
        "password": password,
        "userName": userName,
        "dateOfBirth": dateOfBirth,
      },
    );
  }
}
