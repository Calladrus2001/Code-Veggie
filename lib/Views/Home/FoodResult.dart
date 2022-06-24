import 'package:codeveggie/Models/FoodModel.dart';
import 'package:codeveggie/Services/FoodService.dart';
import 'package:codeveggie/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class FoodResult extends StatefulWidget {
  const FoodResult({Key? key}) : super(key: key);

  @override
  State<FoodResult> createState() => _FoodResultState();
}

late Food _food;

class _FoodResultState extends State<FoodResult> {
  bool haveData = false;
  final box = GetStorage();
  getData() async {
    String query = box.read("query");
    _food = (await FoodService().getFoodData(query))!;
    if (_food != null) {
      setState(() {
        haveData = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: haveData
          ? PageView.builder(
              itemCount: _food.foodSearchCriteria!.pageSize,
              itemBuilder: (context, int index) {
                return Column(
                  children: [
                    SizedBox(height: 40),
                    Chip(
                      label: Text("${_food.foods![index].lowercaseDescription}",
                          style: TextStyle(color: Colors.white)),
                      backgroundColor: clr1,
                    )
                  ],
                );
              })
          : Center(child: CircularProgressIndicator(color: clr1)),
    );
  }
}
