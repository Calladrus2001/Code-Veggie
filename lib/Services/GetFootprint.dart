import 'package:codeveggie/Models/FoodModel.dart';
import 'package:codeveggie/constants.dart';
import 'package:flutter/material.dart';

class CarbonFootprint {
  List<List<String>> getFootprint(Food food) {
    List<List<String>> footprints = [];
    List<List<String>> finalList = [];
    List<String?> fp = [];

    for (int i = 0; i < food.foods!.length; i++) {
      if (food.foods![i].ingredients != null) {
        fp.add(food.foods![i].ingredients!.toLowerCase());
      }
    }
    for (int i = 0; i < fp.length; i++) {
      footprints.add(fp[i]!.split(", "));
    }
    for (int i = 0; i < footprints.length; i++) {
      List<String> aux = [];
      for (int j = 0; j < footprints[i].length; j++) {
        if (carbonfp[footprints[i][j]] != null) {
          aux.add(footprints[i][j]);
        }
      }
      finalList.add(aux);
      aux = [];
    }
    return finalList;
  }

  List<List<Widget>> buildChips(Food food) {
    List<List<String>> finalList = getFootprint(food);
    List<List<Widget>> chips = [];
    for (int i = 0; i < finalList.length; i++) {
      List<Widget> aux = [];
      for (int j = 0; j < finalList[i].length; j++) {
        aux.add(Chip(
          elevation: 4.0,
          label: Text("${finalList[i][j]} : ${carbonfp[finalList[i][j]]}",
              style: TextStyle(color: Colors.white)),
          backgroundColor: carbonfp[finalList[i][j]]! > 1
              ? Colors.redAccent
              : Colors.green.shade800,
        ));
      }
      chips.add(aux);
      aux = [];
    }
    return chips;
  }
}
