import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal/res/routes/routes.dart';
import 'package:meal/res/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      defaultTransition: Transition.leftToRight,
      getPages: AppPages.pages,
    );
  }
}

