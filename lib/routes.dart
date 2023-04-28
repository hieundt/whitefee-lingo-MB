import 'screens/training/tests_screen/tests_screen.dart';
import 'screens/training/units_screen/units_screen.dart';

class AppRoutes {
  static const unitsScreen = '/unitsScreen';
  static const testsScreen = '/testsScreen';
}

var appRoutes = {
  AppRoutes.unitsScreen: (context) => const UnitsScreen(),
  AppRoutes.testsScreen: (context) => const TestsScreen(),
};
