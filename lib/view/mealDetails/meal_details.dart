import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal/models/search_by_name/search_by_name.dart';

class MealDetails extends StatelessWidget {
  MealDetails({super.key});

  Meals? meal;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // Retrieve the passed argument
    meal = Get.arguments as Meals;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
          backgroundColor: Colors.blueGrey,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.fromLTRB(8, 8, 8, screenHeight * .1),

            child: Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textSpan(
                        firstStr: "Meal Name: ", lastStr: "${meal?.strMeal}"),
                     SizedBox(
                      height: screenHeight * .01,
                    ),
                    textSpan(
                        firstStr: "Ingredients and Measurements: ",
                        lastStr: "${concatIngredients()}"),
                    const SizedBox(
                      height: 5,
                    ),
                    textSpan(
                        firstStr: "Instructions: ",
                        lastStr: "${meal?.strInstructions}"),
                     SizedBox(
                      height: screenHeight * .01,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.blueGrey,
            icon: const Icon(Icons.add),
            label: const Text("Save to database"),
            onPressed: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
      ),
    );
  }

  String? concatIngredients() {
    return addIngredientsList();
  }

  RichText textSpan({required String? firstStr, required String? lastStr}) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: firstStr,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black)),
      TextSpan(
          text:"\n${lastStr}",
          style: const TextStyle(
              fontStyle: FontStyle.italic, color: Colors.black)),
    ]));
  }

  String? addIngredientsList() {
    List<String?> ingredientsList = [
      meal?.strIngredient1,
      meal?.strIngredient2,
      meal?.strIngredient3,
      meal?.strIngredient4,
      meal?.strIngredient5,
      meal?.strIngredient6,
      meal?.strIngredient7,
      meal?.strIngredient8,
      meal?.strIngredient9,
      meal?.strIngredient10,
      meal?.strIngredient11,
      meal?.strIngredient12,
      meal?.strIngredient13,
      meal?.strIngredient14,
      meal?.strIngredient15,
      meal?.strIngredient16,
      meal?.strIngredient17,
      meal?.strIngredient18,
      meal?.strIngredient19,
      meal?.strIngredient20,
    ];

    List<String?> measureItemList = [
      meal?.strMeasure1,
      meal?.strMeasure2,
      meal?.strMeasure3,
      meal?.strMeasure4,
      meal?.strMeasure5,
      meal?.strMeasure6,
      meal?.strMeasure7,
      meal?.strMeasure8,
      meal?.strMeasure9,
      meal?.strMeasure10,
      meal?.strMeasure11,
      meal?.strMeasure12,
      meal?.strMeasure13,
      meal?.strMeasure14,
      meal?.strMeasure15,
      meal?.strMeasure16,
      meal?.strMeasure17,
      meal?.strMeasure18,
      meal?.strMeasure19,
      meal?.strMeasure20,
    ];

    // Remove null or empty elements
    ingredientsList.removeWhere(
        (ingredient) => ingredient == null || ingredient.trim().isEmpty);
    measureItemList
        .removeWhere((element) => element == null || element.trim().isEmpty);
    print("ingredientsList  $ingredientsList");
    print("measureItemList  $measureItemList");
    String? concatAll = "";
    for (int i = 0; i < ingredientsList.length; i++) {
      if (ingredientsList[i] != null && measureItemList[i] != null) {
        if (concatAll?.isNotEmpty == true) {
          concatAll =
              "$concatAll\n"; // Add newline separator between ingredients
        }
        concatAll =
            "$concatAll${i + 1}. ${ingredientsList[i]} (${measureItemList[i]})";
      }
    }
    print("fellow  $concatAll");
    return concatAll;
  }
}
