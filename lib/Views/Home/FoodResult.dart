import 'package:codeveggie/Models/FoodModel.dart';
import 'package:codeveggie/Services/FoodService.dart';
import 'package:codeveggie/Services/GetFootprint.dart';
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
  List<List<Widget>> chips = [];

  getData() async {
    String query = box.read("query");
    _food = (await FoodService().getFoodData(query))!;
    if (_food != null) {
      chips = await CarbonFootprint().buildChips(_food);
      if (chips != null) {
        setState(() {
          haveData = true;
        });
      }
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
              itemCount: chips.length,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),

                      /// item name
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Text(
                            "Ingredients: ",
                            style: TextStyle(
                                color: clr1,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 16),
                          Text("(with their CO2 eq.)",
                              style: TextStyle(color: Colors.grey))
                        ],
                      ),
                      SizedBox(height: 8),
                      Wrap(
                        children: chips[index],
                        spacing: 5,
                        runSpacing: -10,
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                );
              })
          : Center(child: CircularProgressIndicator(color: clr1)),
    );
  }
}
