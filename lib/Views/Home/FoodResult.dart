import 'package:codeveggie/Models/FoodModel.dart';
import 'package:codeveggie/Models/RecipeModel.dart';
import 'package:codeveggie/Services/FoodService.dart';
import 'package:codeveggie/Services/GetFootprint.dart';
import 'package:codeveggie/Services/RecipeService.dart';
import 'package:codeveggie/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class FoodResult extends StatefulWidget {
  const FoodResult({Key? key}) : super(key: key);

  @override
  State<FoodResult> createState() => _FoodResultState();
}

late Food _food;
late Recipe _recipe;

class _FoodResultState extends State<FoodResult> {
  bool haveData = false;
  final box = GetStorage();
  List<List<Widget>> chips = [];

  getData() async {
    String query = box.read("query");
    _food = (await FoodService().getFoodData(query))!;

    if (_food != null) {
      chips = await CarbonFootprint().buildChips(_food);
      _recipe = (await RecipeService().getFoodData(query, chips.length))!;
      if (_recipe != null) {
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_alt_outlined, color: clr1),
        backgroundColor: Colors.white,
        onPressed: () {
          /// enter recipe to Firestore
        },
      ),
      backgroundColor: Colors.white,
      body: haveData
          ? PageView.builder(
              itemCount: chips.length,
              itemBuilder: (context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Container(
                            width: double.infinity,
                            constraints: BoxConstraints(maxHeight: 300),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)),
                              child: Image(
                                image: NetworkImage(
                                    "${_recipe.results![index].image}"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 250,
                            right: 10,
                            child: Chip(
                                label: Text(
                                    _recipe.results![index].title.toString()))),
                      ],
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
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
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Wrap(
                        children: chips[index],
                        spacing: 5,
                        runSpacing: -10,
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                );
              })
          : Center(child: CircularProgressIndicator(color: clr1)),
    );
  }
}
