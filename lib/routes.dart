import 'screens/training/tests_screen/test_topics_screen.dart';
import 'screens/training/units_screen/units_topics_screen.dart';

class AppRoutes {
  static const unitsScreen = '/unitsScreen';
  static const testsScreen = '/testsScreen';
}

var appRoutes = {
  AppRoutes.unitsScreen: (context) => const UnitTopicsScreen(),
  AppRoutes.testsScreen: (context) => const TestTopicsScreen(),
};
