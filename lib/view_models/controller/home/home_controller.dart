import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meal/data/response/status.dart';
import 'package:meal/models/search_by_name/search_by_name.dart';
import 'package:meal/repository/homeRepository/home_repository.dart';

class HomeController extends GetxController {
  final _repository = HomeRepository();
  final TextEditingController searchController = TextEditingController();
  final rxRequestStatus = Status.LOADING.obs;
  final mealList = MealList().obs;
  RxString error = "".obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setMealList(MealList value) {
    mealList.value = value;
    print("in set${mealList.value}");
  }

  void setError(String value) => error.value = value;

  void getSearchByNameApi({String searchedName = ""}) {
    print("in api call $mealList");
    setRxRequestStatus(Status.LOADING);
    _repository.getSearchByName(searchedName).then((mealList) {
      setRxRequestStatus(Status.COMPLETED);
      setMealList(mealList ?? MealList());
      // print("mealList response ${mealList}) }");
    }).onError((error, stackTrace) {
      setError(error.toString());
      print("in viewmodel${error.toString()}");
      setRxRequestStatus(Status.ERROR);
    });
  }
}
