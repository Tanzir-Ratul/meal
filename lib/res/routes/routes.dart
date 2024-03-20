import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:meal/res/routes/routes_name.dart';
import 'package:meal/view/home/HomeFragment.dart';
import 'package:meal/view/mealDetails/meal_details.dart';
import 'package:meal/view/splash/splash.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.initial, page: () => const SplashScreen()),
    GetPage(name: Routes.home, page: () => const HomeFragment()),
    GetPage(name: Routes.mealDetails, page: () => const MealDetails()),
  ];
}
