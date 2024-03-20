import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal/models/search_by_name/search_by_name.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key});


  @override
  Widget build(BuildContext context) {
    // Retrieve the passed argument
    final MealList meal = Get.arguments as MealList;
    return SafeArea(child: Scaffold());
  }
}
