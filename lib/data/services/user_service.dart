import 'package:dio/dio.dart';
import '../models/user_models/user_model.dart';

var api = 'https://backenddictionary-production.up.railway.app';

class UserService {
  var userApi = '$api/user';

  Future<List<User>> getAllUserData() async {
    final response = await Dio().get(userApi);
    List<User> result =
        (response.data as List).map((e) => User.fromJson(e)).toList();

    return result;
  }

  Future<User?> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    //Chua lam
    final response = await Dio().get('userApi/$email');
    final user = User.fromJson(response.data);
    if (user.password == password) {
      return user; // Return the user object if login is successful
    } else {
      return null; // Return null if password does not match
    }
  }

  Future<void> createAccount({
    required String email,
    required String password,
    required String userName,
    required String dateOfBirth,
  }) async {
    await Dio().post(
      userApi,
      data: {
        "email": email,
        "password": password,
        "userName": userName,
        "dateOfBirth": dateOfBirth,
      },
    );
  }
}
