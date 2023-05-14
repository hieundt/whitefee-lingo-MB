import 'package:dictionary/screens/user/favorite_unit_screen.dart';
import 'package:dictionary/screens/user/favorite_vocabulary_screen.dart';
import 'package:dictionary/screens/user/test_history.dart';
import 'screens/training/tests_screen/test_topics_screen.dart';
import 'screens/training/units_screen/unit_topics_screen.dart';

class AppRoutes {
  static const unitTopics = '/unitTopics';
  static const testTopics = '/testTopics';

  static const favoriteUnit = '/favoriteUnit';
  static const favoriteVocabulary = '/favoriteVocabulary';

  static const testHistory = '/testHistory';
}

var appRoutes = {
  AppRoutes.unitTopics: (context) => const UnitTopicsScreen(),
  AppRoutes.testTopics: (context) => const TestTopicsScreen(),
  AppRoutes.favoriteUnit: (context) => const FavoriteUnitScreen(),
  AppRoutes.favoriteVocabulary: (context) => const FavoriteVocabularyScreen(),
  AppRoutes.testHistory: (context) => const TestHistoryScreen(),
};
