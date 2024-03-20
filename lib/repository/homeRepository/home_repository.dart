import 'package:meal/data/network/network_api_services.dart';
import 'package:meal/res/app_url/app_url.dart';

import '../../models/search_by_name/search_by_name.dart';

class HomeRepository{
  final _apiService = NetworkApiServices();

  Future<MealList?> getSearchByName(String mealName)async{
    final searchUrl = Uri.parse("${AppUrl.baseUrl}${AppUrl.searchByName}").replace(queryParameters: {'s': mealName});

    dynamic response = await _apiService.getApi(searchUrl.toString());
    return MealList.fromJson(response);

    }
}