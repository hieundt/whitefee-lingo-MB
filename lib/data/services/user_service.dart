import 'package:dictionary/data/models/user_models/test_history_model.dart';
import 'package:dio/dio.dart';
import '../models/user_models/favorite_vocabulary_model.dart';
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

  Future<User?> getUserById(String? userId) async {
    final response = await Dio().get('$userApi/$userId');
    User? result = User.fromJson(response.data);
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

class UserHistoryService {
  var historyApi = '$api/testhistory';

  Future<List<TestHistory>> getTestHistoryOfUser(String userId) async {
    var historyOfUserApi = '$historyApi/$userId';
    final response = await Dio().get(historyOfUserApi);
    List<TestHistory> history =
        (response.data as List).map((e) => TestHistory.fromJson(e)).toList();
    return history;
  }

  Future<void> createTestHistory({
    required String? userId,
    required String? testId,
    required int? totalPoint,
    required String? testDate,
  }) async {
    await Dio().post(
      historyApi,
      data: {
        "userId": userId,
        "testId": testId,
        "totalPoint": totalPoint,
        "testDate": testDate,
      },
    );
  }
}

class UserFavoriteCollectionService {
  var favoritevocabularyApi = '$api/favoritevocabulary';

  Future<List<FavoriteVocabulary>> getFavoriteVocabulary(String userId) async {
    final response = await Dio().get('$favoritevocabularyApi/$userId');
    List<FavoriteVocabulary> result = (response.data as List)
        .map((e) => FavoriteVocabulary.fromJson(e))
        .toList();
    return result;
  }

  Future<bool> isFavoriteVocabulary({
    required String userId,
    required String vocabularyId,
  }) async {
    final favoriteList = await getFavoriteVocabulary(userId);
    final favoriteMap = {
      for (var element in favoriteList) element.vocabularyId: element
    };

    final isFavorite = favoriteMap[vocabularyId];
    if (isFavorite != null && isFavorite.vocabularyId == vocabularyId) {
      return true;
    }
    return false;
  }

  Future<void> markFavoriteVocabulary({
    required String userId,
    required String vocabularyId,
  }) async {
    await Dio().post(
      favoritevocabularyApi,
      data: {
        "userId": userId,
        "vocabularyId": vocabularyId,
      },
    );
  }

  Future<void> removeFavoriteVocabulary({
    required String userId,
    required String vocabularyId,
  }) async {
    await Dio().post(
      favoritevocabularyApi,
      data: {
        "userId": userId,
        "vocabularyId": vocabularyId,
      },
    );
  }
}
