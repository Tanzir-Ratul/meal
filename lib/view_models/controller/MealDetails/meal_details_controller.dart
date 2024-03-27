import 'package:get/get.dart';
import 'package:meal/models/dbModels/meals_details_db_model.dart';
import 'package:meal/repository/mealRepositoryDB/meal_repository_db.dart';

class MealDetailsController extends GetxService {
  final MealRepository repository = MealRepository();

  RxList<MealsDetails> mealsDetailsList = <MealsDetails>[].obs;
  Future<bool> addMeals(MealsDetails mealsDetails) async {
    try {
      return await repository.insertMealDetails(mealsDetails);
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<MealsDetails>?> getAllMealDetails() async {
    try {
      mealsDetailsList.value =  (await repository.getAllMealDetails())!;
      return mealsDetailsList;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
