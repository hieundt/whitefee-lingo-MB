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

  Future<User> getUserById(String userId) async {
    final response = await Dio().get('$userApi/$userId');
    User result = User.fromJson(response.data);
    return result;
  }

  Future<User?> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    final response = await Dio().get('$userApi/login/$email/$password');
    User? result = User?.fromJson(response.data);
    return result;

    //? Another way of doing this shit
    //? This Map.fromIterable take 3 parameter:
    //? the Iterable<dynamic>, key and value, which are two function
    //? You can do whatever to return the key and value

    // final userList = await getAllUserData();
    // final userMap = Map.fromIterable(
    // userList,
    //   key: (user) => user.email,
    //   value: (user) => user,
    // );

    //? Or using the shortcut
    // final userMap = {for (var user in userList) user.email : user};
    // Which return the same shit

    //? We pass the key, which is email from user an get the value
    // final user = userMap[email];
    // if (user != null && user.password == password) {
    //   return user;
    // }
    // return null;
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
