import 'screens/training/tests_screen/test_topics_screen.dart';
import 'screens/training/units_screen/unit_topics_screen.dart';

class AppRoutes {
  static const unitTopicsScreen = '/unitTopicsScreen';
  static const testTopicsScreen = '/testTopicsScreen';
}

var appRoutes = {
  AppRoutes.unitTopicsScreen: (context) => const UnitTopicsScreen(),
  AppRoutes.testTopicsScreen: (context) => const TestTopicsScreen(),
};
