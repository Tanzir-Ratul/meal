import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal/view_models/controller/splash/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _controller = Get.put(SplashController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.startTime();
  }
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: Center(
        child: Text("Welcome"),
      ),
    ));
  }
}

