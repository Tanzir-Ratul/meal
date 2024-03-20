import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal/data/response/status.dart';
import 'package:meal/res/routes/routes_name.dart';
import 'package:meal/view_models/controller/home/home_controller.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<StatefulWidget> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  final _controller = Get.put(HomeController());

  final TextEditingController _searchController = TextEditingController();
  final double textFieldHeight = AppBar().preferredSize.height * 0.8; // Adjust the factor as needed

  @override
  void initState() {
    super.initState();
    _controller.getSearchByNameApi(searchedName: "");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title:SizedBox(
                height: textFieldHeight,
                child: TextField(
                    controller: _searchController,
                    decoration:  InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      hintText: 'Search...',
                      alignLabelWithHint: true,
                      hintStyle: const TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Colors.amber,
                              width: 1
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Colors.amber,
                              width: 1
                          )
                      ),

                    ),

                  style: const TextStyle(color: Colors.black),
                ),
              ),
              backgroundColor: Colors.blueAccent,
              actions: [
                IconButton(onPressed: () {// Close the keyboard
                  FocusScope.of(context).unfocus();
                  if(_searchController.text.isNotEmpty){
                    _controller.getSearchByNameApi(searchedName: _searchController.text);
                  }
                }, icon: const Icon(Icons.search))
              ],
            ),
            body: Obx(() {
              switch (_controller.rxRequestStatus.value) {
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());

                case Status.ERROR:
                  return const Text("Something went wrong");
                case Status.COMPLETED:
                  return (_controller.mealList.value.meals?.isEmpty == true)
                      ? const Center(
                          child: Text("No data Found"),
                        )
                      : ListView.builder(
                          itemCount:
                              _controller.mealList.value.meals?.length ?? 0,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(Routes.mealDetails,
                                    arguments: _controller.mealList.value);
                              },
                              child: Card(
                                  child: ListTile(
                                title: _controller.mealList.value.meals?[index]
                                            ?.strMealThumb !=
                                        null
                                    ? Expanded(
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                              _controller.mealList.value
                                                  .meals![index]!.strMealThumb
                                                  .toString(),
                                              fit: BoxFit.contain,
                                              errorBuilder:
                                                  (context, url, error) =>
                                                      const Placeholder(),
                                            )),
                                      )
                                    : const Placeholder(),
                                subtitle: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Origin: ${_controller.mealList.value.meals?[index]?.strArea ?? ""} ",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                            );
                          },
                        );
              }
            })));
  }
}
