// To parse this JSON data, do
//
//     final food = foodFromJson(jsonString);

import 'dart:convert';

Recipe recipeFromJson(String str) => Recipe.fromJson(json.decode(str));

String foodToJson(Recipe data) => json.encode(data.toJson());

class Recipe {
  Recipe({
    this.results,
    this.offset,
    this.number,
    this.totalResults,
  });

  List<Result>? results;
  int? offset;
  int? number;
  int? totalResults;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        offset: json["offset"],
        number: json["number"],
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "offset": offset,
        "number": number,
        "totalResults": totalResults,
      };
}

class Result {
  Result({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.lowFodmap,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.healthScore,
    this.pricePerServing,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.openLicense,
    this.image,
    this.imageType,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.analyzedInstructions,
    this.sourceName,
    this.creditsText,
    this.spoonacularSourceUrl,
    this.license,
  });

  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  bool? veryPopular;
  bool? sustainable;
  bool? lowFodmap;
  int? weightWatcherSmartPoints;
  Gaps? gaps;
  int? preparationMinutes;
  int? cookingMinutes;
  int? aggregateLikes;
  int? healthScore;
  double? pricePerServing;
  int? id;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  int? openLicense;
  String? image;
  ImageType? imageType;
  String? summary;
  List<Cuisine>? cuisines;
  List<DishType>? dishTypes;
  List<String>? diets;
  List<String>? occasions;
  List<AnalyzedInstruction>? analyzedInstructions;
  String? sourceName;
  String? creditsText;
  String? spoonacularSourceUrl;
  String? license;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        vegetarian: json["vegetarian"],
        vegan: json["vegan"],
        glutenFree: json["glutenFree"],
        dairyFree: json["dairyFree"],
        veryHealthy: json["veryHealthy"],
        cheap: json["cheap"],
        veryPopular: json["veryPopular"],
        sustainable: json["sustainable"],
        lowFodmap: json["lowFodmap"],
        weightWatcherSmartPoints: json["weightWatcherSmartPoints"],
        gaps: gapsValues.map[json["gaps"]],
        preparationMinutes: json["preparationMinutes"],
        cookingMinutes: json["cookingMinutes"],
        aggregateLikes: json["aggregateLikes"],
        healthScore: json["healthScore"],
        pricePerServing: json["pricePerServing"].toDouble(),
        id: json["id"],
        title: json["title"],
        readyInMinutes: json["readyInMinutes"],
        servings: json["servings"],
        sourceUrl: json["sourceUrl"],
        openLicense: json["openLicense"],
        image: json["image"],
        imageType: imageTypeValues.map[json["imageType"]],
        summary: json["summary"],
        cuisines: List<Cuisine>.from(
            json["cuisines"].map((x) => cuisineValues.map[x])),
        dishTypes: List<DishType>.from(
            json["dishTypes"].map((x) => dishTypeValues.map[x])),
        diets: List<String>.from(json["diets"].map((x) => x)),
        occasions: List<String>.from(json["occasions"].map((x) => x)),
        analyzedInstructions: List<AnalyzedInstruction>.from(
            json["analyzedInstructions"]
                .map((x) => AnalyzedInstruction.fromJson(x))),
        sourceName: json["sourceName"] == null ? null : json["sourceName"],
        creditsText: json["creditsText"] == null ? null : json["creditsText"],
        spoonacularSourceUrl: json["spoonacularSourceUrl"],
        license: json["license"] == null ? null : json["license"],
      );

  Map<String, dynamic> toJson() => {
        "vegetarian": vegetarian,
        "vegan": vegan,
        "glutenFree": glutenFree,
        "dairyFree": dairyFree,
        "veryHealthy": veryHealthy,
        "cheap": cheap,
        "veryPopular": veryPopular,
        "sustainable": sustainable,
        "lowFodmap": lowFodmap,
        "weightWatcherSmartPoints": weightWatcherSmartPoints,
        "gaps": gapsValues.reverse[gaps],
        "preparationMinutes": preparationMinutes,
        "cookingMinutes": cookingMinutes,
        "aggregateLikes": aggregateLikes,
        "healthScore": healthScore,
        "pricePerServing": pricePerServing,
        "id": id,
        "title": title,
        "readyInMinutes": readyInMinutes,
        "servings": servings,
        "sourceUrl": sourceUrl,
        "openLicense": openLicense,
        "image": image,
        "imageType": imageTypeValues.reverse[imageType],
        "summary": summary,
        "cuisines":
            List<dynamic>.from(cuisines!.map((x) => cuisineValues.reverse[x])),
        "dishTypes": List<dynamic>.from(
            dishTypes!.map((x) => dishTypeValues.reverse[x])),
        "diets": List<dynamic>.from(diets!.map((x) => x)),
        "occasions": List<dynamic>.from(occasions!.map((x) => x)),
        "analyzedInstructions":
            List<dynamic>.from(analyzedInstructions!.map((x) => x.toJson())),
        "sourceName": sourceName == null ? null : sourceName,
        "creditsText": creditsText == null ? null : creditsText,
        "spoonacularSourceUrl": spoonacularSourceUrl,
        "license": license == null ? null : license,
      };
}

class AnalyzedInstruction {
  AnalyzedInstruction({
    this.name,
    this.steps,
  });

  Name? name;
  List<Step>? steps;

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) =>
      AnalyzedInstruction(
        name: nameValues.map[json["name"]],
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "steps": List<dynamic>.from(steps!.map((x) => x.toJson())),
      };
}

enum Name { EMPTY, BURGER_PATTIES, MEAT }

final nameValues = EnumValues(
    {"Burger patties": Name.BURGER_PATTIES, "": Name.EMPTY, "Meat": Name.MEAT});

class Step {
  Step({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
    this.length,
  });

  int? number;
  String? step;
  List<Ent>? ingredients;
  List<Ent>? equipment;
  Length? length;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        number: json["number"],
        step: json["step"],
        ingredients:
            List<Ent>.from(json["ingredients"].map((x) => Ent.fromJson(x))),
        equipment:
            List<Ent>.from(json["equipment"].map((x) => Ent.fromJson(x))),
        length: json["length"] == null ? null : Length.fromJson(json["length"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "step": step,
        "ingredients": List<dynamic>.from(ingredients!.map((x) => x.toJson())),
        "equipment": List<dynamic>.from(equipment!.map((x) => x.toJson())),
        "length": length == null ? null : length!.toJson(),
      };
}

class Ent {
  Ent({
    this.id,
    this.name,
    this.localizedName,
    this.image,
    this.temperature,
  });

  int? id;
  String? name;
  String? localizedName;
  String? image;
  Length? temperature;

  factory Ent.fromJson(Map<String, dynamic> json) => Ent(
        id: json["id"],
        name: json["name"],
        localizedName: json["localizedName"],
        image: json["image"],
        temperature: json["temperature"] == null
            ? null
            : Length.fromJson(json["temperature"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "localizedName": localizedName,
        "image": image,
        "temperature": temperature == null ? null : temperature!.toJson(),
      };
}

class Length {
  Length({
    required this.number,
    this.unit,
  });

  num number;
  Unit? unit;

  factory Length.fromJson(Map<String, dynamic> json) => Length(
        number: json["number"],
        unit: unitValues.map[json["unit"]],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "unit": unitValues.reverse[unit],
      };
}

enum Unit { FAHRENHEIT, MINUTES }

final unitValues =
    EnumValues({"Fahrenheit": Unit.FAHRENHEIT, "minutes": Unit.MINUTES});

enum Cuisine { MIDDLE_EASTERN, AMERICAN }

final cuisineValues = EnumValues(
    {"American": Cuisine.AMERICAN, "Middle Eastern": Cuisine.MIDDLE_EASTERN});

enum DishType { LUNCH, MAIN_COURSE, MAIN_DISH, DINNER }

final dishTypeValues = EnumValues({
  "dinner": DishType.DINNER,
  "lunch": DishType.LUNCH,
  "main course": DishType.MAIN_COURSE,
  "main dish": DishType.MAIN_DISH
});

enum Gaps { NO }

final gapsValues = EnumValues({"no": Gaps.NO});

enum ImageType { PNG, JPG }

final imageTypeValues =
    EnumValues({"jpg": ImageType.JPG, "png": ImageType.PNG});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
