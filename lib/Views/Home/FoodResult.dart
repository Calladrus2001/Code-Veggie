import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codeveggie/Models/FoodModel.dart';
import 'package:codeveggie/Models/RecipeModel.dart';
import 'package:codeveggie/Services/FoodService.dart';
import 'package:codeveggie/Services/GetFootprint.dart';
import 'package:codeveggie/Services/RecipeService.dart';
import 'package:codeveggie/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  List<String> recipes = [];
  int recipeIndex = 0;
  CollectionReference entries = FirebaseFirestore.instance
      .collection('Users')
      .doc("${FirebaseAuth.instance.currentUser!.email}")
      .collection("Recipes");

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
      for (int i = 0; i < _recipe.results!.length; i++) {
        recipes.add(CarbonFootprint().getRecipe(_recipe.results![i]));
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
          entries
              .add({
                "Recipe": recipes[recipeIndex],
                "User": FirebaseAuth.instance.currentUser!.email,
                "Timestamp": Timestamp.now(),
                "Name": _recipe.results![recipeIndex].title
              })
              .then((value) => print("Entry Added"))
              .catchError((error) => print("Failed to add entry: $error"));
          Get.snackbar("Code:Veggie", "Recipe added!");
        },
      ),
      backgroundColor: Colors.white,
      body: haveData
          ? PageView.builder(
              itemCount: min(chips.length, _recipe.results!.length),
              itemBuilder: (context, int index) {
                recipeIndex = index;
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
                        Positioned(
                            top: 250,
                            left: 5,
                            child: Chip(
                              backgroundColor:
                                  _recipe.results![index].healthScore! > 50
                                      ? clr1
                                      : Colors.red,
                              label: Text(
                                  _recipe.results![index].healthScore
                                      .toString(),
                                  style: TextStyle(color: Colors.white)),
                            ))
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Recipe: ",
                        style: TextStyle(
                            color: clr1,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: clr1)),
                        child: SingleChildScrollView(
                          child: Text(
                            recipes[index],
                            style: TextStyle(color: clr1, fontSize: 14),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              })
          : Center(child: CircularProgressIndicator(color: clr1)),
    );
  }
}
