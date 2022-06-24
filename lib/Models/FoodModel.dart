// To parse this JSON data, do
//
//     final food = foodFromJson(jsonString);

import 'dart:convert';

Food foodFromJson(String str) => Food.fromJson(json.decode(str));

String foodToJson(Food data) => json.encode(data.toJson());

class Food {
  Food({
    this.totalHits,
    this.currentPage,
    this.totalPages,
    this.pageList,
    this.foodSearchCriteria,
    this.foods,
    this.aggregations,
  });

  int? totalHits;
  int? currentPage;
  int? totalPages;
  List<int>? pageList;
  FoodSearchCriteria? foodSearchCriteria;
  List<FoodElement>? foods;
  Aggregations? aggregations;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        totalHits: json["totalHits"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        pageList: List<int>.from(json["pageList"].map((x) => x)),
        foodSearchCriteria:
            FoodSearchCriteria.fromJson(json["foodSearchCriteria"]),
        foods: List<FoodElement>.from(
            json["foods"].map((x) => FoodElement.fromJson(x))),
        aggregations: Aggregations.fromJson(json["aggregations"]),
      );

  Map<String, dynamic> toJson() => {
        "totalHits": totalHits,
        "currentPage": currentPage,
        "totalPages": totalPages,
        "pageList": List<dynamic>.from(pageList!.map((x) => x)),
        "foodSearchCriteria": foodSearchCriteria!.toJson(),
        "foods": List<dynamic>.from(foods!.map((x) => x.toJson())),
        "aggregations": aggregations!.toJson(),
      };
}

class Aggregations {
  Aggregations({
    this.dataType,
    this.nutrients,
  });

  DataType? dataType;
  Nutrients? nutrients;

  factory Aggregations.fromJson(Map<String, dynamic> json) => Aggregations(
        dataType: DataType.fromJson(json["dataType"]),
        nutrients: Nutrients.fromJson(json["nutrients"]),
      );

  Map<String, dynamic> toJson() => {
        "dataType": dataType!.toJson(),
        "nutrients": nutrients!.toJson(),
      };
}

class DataType {
  DataType({
    this.branded,
    this.surveyFndds,
    this.srLegacy,
  });

  int? branded;
  int? surveyFndds;
  int? srLegacy;

  factory DataType.fromJson(Map<String, dynamic> json) => DataType(
        branded: json["Branded"],
        surveyFndds: json["Survey (FNDDS)"],
        srLegacy: json["SR Legacy"],
      );

  Map<String, dynamic> toJson() => {
        "Branded": branded,
        "Survey (FNDDS)": surveyFndds,
        "SR Legacy": srLegacy,
      };
}

class Nutrients {
  Nutrients();

  factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients();

  Map<String, dynamic> toJson() => {};
}

class FoodSearchCriteria {
  FoodSearchCriteria({
    this.query,
    this.generalSearchInput,
    this.pageNumber,
    this.numberOfResultsPerPage,
    this.pageSize,
    this.requireAllWords,
  });

  String? query;
  String? generalSearchInput;
  int? pageNumber;
  int? numberOfResultsPerPage;
  int? pageSize;
  bool? requireAllWords;

  factory FoodSearchCriteria.fromJson(Map<String, dynamic> json) =>
      FoodSearchCriteria(
        query: json["query"],
        generalSearchInput: json["generalSearchInput"],
        pageNumber: json["pageNumber"],
        numberOfResultsPerPage: json["numberOfResultsPerPage"],
        pageSize: json["pageSize"],
        requireAllWords: json["requireAllWords"],
      );

  Map<String, dynamic> toJson() => {
        "query": query,
        "generalSearchInput": generalSearchInput,
        "pageNumber": pageNumber,
        "numberOfResultsPerPage": numberOfResultsPerPage,
        "pageSize": pageSize,
        "requireAllWords": requireAllWords,
      };
}

class FoodElement {
  FoodElement({
    this.fdcId,
    this.description,
    this.lowercaseDescription,
    this.dataType,
    this.gtinUpc,
    this.publishedDate,
    this.brandOwner,
    this.brandName,
    this.ingredients,
    this.marketCountry,
    this.foodCategory,
    this.modifiedDate,
    this.dataSource,
    this.packageWeight,
    this.servingSizeUnit,
    this.servingSize,
    this.allHighlightFields,
    this.score,
    this.foodNutrients,
    this.finalFoodInputFoods,
    this.foodMeasures,
    this.foodAttributes,
    this.foodAttributeTypes,
    this.foodVersionIds,
    this.subbrandName,
  });

  int? fdcId;
  String? description;
  String? lowercaseDescription;
  String? dataType;
  String? gtinUpc;
  DateTime? publishedDate;
  String? brandOwner;
  String? brandName;
  String? ingredients;
  String? marketCountry;
  String? foodCategory;
  DateTime? modifiedDate;
  String? dataSource;
  String? packageWeight;
  String? servingSizeUnit;
  double? servingSize;
  String? allHighlightFields;
  double? score;
  List<FoodNutrient>? foodNutrients;
  List<dynamic>? finalFoodInputFoods;
  List<dynamic>? foodMeasures;
  List<dynamic>? foodAttributes;
  List<dynamic>? foodAttributeTypes;
  List<dynamic>? foodVersionIds;
  String? subbrandName;

  factory FoodElement.fromJson(Map<String, dynamic> json) => FoodElement(
        fdcId: json["fdcId"],
        description: json["description"],
        lowercaseDescription: json["lowercaseDescription"],
        dataType: json["dataType"],
        gtinUpc: json["gtinUpc"],
        publishedDate: DateTime.parse(json["publishedDate"]),
        brandOwner: json["brandOwner"],
        brandName: json["brandName"],
        ingredients: json["ingredients"],
        marketCountry: json["marketCountry"],
        foodCategory: json["foodCategory"],
        modifiedDate: json["modifiedDate"] == null
            ? DateTime.now()
            : DateTime.parse(json["modifiedDate"]),
        dataSource: json["dataSource"],
        packageWeight: json["packageWeight"],
        servingSizeUnit: json["servingSizeUnit"],
        servingSize: json["servingSize"],
        allHighlightFields: json["allHighlightFields"],
        score: json["score"].toDouble(),
        foodNutrients: List<FoodNutrient>.from(
            json["foodNutrients"].map((x) => FoodNutrient.fromJson(x))),
        finalFoodInputFoods:
            List<dynamic>.from(json["finalFoodInputFoods"].map((x) => x)),
        foodMeasures: List<dynamic>.from(json["foodMeasures"].map((x) => x)),
        foodAttributes:
            List<dynamic>.from(json["foodAttributes"].map((x) => x)),
        foodAttributeTypes:
            List<dynamic>.from(json["foodAttributeTypes"].map((x) => x)),
        foodVersionIds:
            List<dynamic>.from(json["foodVersionIds"].map((x) => x)),
        subbrandName:
            json["subbrandName"] == null ? null : json["subbrandName"],
      );

  Map<String, dynamic> toJson() => {
        "fdcId": fdcId,
        "description": description,
        "lowercaseDescription": lowercaseDescription,
        "dataType": dataType,
        "gtinUpc": gtinUpc,
        "publishedDate":
            "${publishedDate!.year.toString().padLeft(4, '0')}-${publishedDate!.month.toString().padLeft(2, '0')}-${publishedDate!.day.toString().padLeft(2, '0')}",
        "brandOwner": brandOwner,
        "brandName": brandName,
        "ingredients": ingredients,
        "marketCountry": marketCountry,
        "foodCategory": foodCategory,
        "modifiedDate":
            "${modifiedDate!.year.toString().padLeft(4, '0')}-${modifiedDate!.month.toString().padLeft(2, '0')}-${modifiedDate!.day.toString().padLeft(2, '0')}",
        "dataSource": dataSource,
        "packageWeight": packageWeight,
        "servingSizeUnit": servingSizeUnit,
        "servingSize": servingSize,
        "allHighlightFields": allHighlightFields,
        "score": score,
        "foodNutrients":
            List<dynamic>.from(foodNutrients!.map((x) => x.toJson())),
        "finalFoodInputFoods":
            List<dynamic>.from(finalFoodInputFoods!.map((x) => x)),
        "foodMeasures": List<dynamic>.from(foodMeasures!.map((x) => x)),
        "foodAttributes": List<dynamic>.from(foodAttributes!.map((x) => x)),
        "foodAttributeTypes":
            List<dynamic>.from(foodAttributeTypes!.map((x) => x)),
        "foodVersionIds": List<dynamic>.from(foodVersionIds!.map((x) => x)),
        "subbrandName": subbrandName == null ? null : subbrandName,
      };
}

class FoodNutrient {
  FoodNutrient({
    this.nutrientId,
    this.nutrientName,
    this.nutrientNumber,
    this.unitName,
    this.derivationCode,
    this.derivationDescription,
    this.derivationId,
    this.value,
    this.foodNutrientSourceId,
    this.foodNutrientSourceCode,
    this.foodNutrientSourceDescription,
    this.rank,
    this.indentLevel,
    this.foodNutrientId,
    this.percentDailyValue,
  });

  int? nutrientId;
  String? nutrientName;
  String? nutrientNumber;
  UnitName? unitName;
  DerivationCode? derivationCode;
  String? derivationDescription;
  int? derivationId;
  double? value;
  int? foodNutrientSourceId;
  String? foodNutrientSourceCode;
  FoodNutrientSourceDescription? foodNutrientSourceDescription;
  int? rank;
  int? indentLevel;
  int? foodNutrientId;
  num? percentDailyValue;

  factory FoodNutrient.fromJson(Map<String, dynamic> json) => FoodNutrient(
        nutrientId: json["nutrientId"],
        nutrientName: json["nutrientName"],
        nutrientNumber: json["nutrientNumber"],
        unitName: unitNameValues.map[json["unitName"]],
        derivationCode: derivationCodeValues.map[json["derivationCode"]],
        derivationDescription: json["derivationDescription"],
        derivationId: json["derivationId"],
        value: json["value"].toDouble(),
        foodNutrientSourceId: json["foodNutrientSourceId"],
        foodNutrientSourceCode: json["foodNutrientSourceCode"],
        foodNutrientSourceDescription: foodNutrientSourceDescriptionValues
            .map[json["foodNutrientSourceDescription"]],
        rank: json["rank"],
        indentLevel: json["indentLevel"],
        foodNutrientId: json["foodNutrientId"],
        percentDailyValue: json["percentDailyValue"] == null
            ? null
            : json["percentDailyValue"],
      );

  Map<String, dynamic> toJson() => {
        "nutrientId": nutrientId,
        "nutrientName": nutrientName,
        "nutrientNumber": nutrientNumber,
        "unitName": unitNameValues.reverse[unitName],
        "derivationCode": derivationCodeValues.reverse[derivationCode],
        "derivationDescription": derivationDescription,
        "derivationId": derivationId,
        "value": value,
        "foodNutrientSourceId": foodNutrientSourceId,
        "foodNutrientSourceCode": foodNutrientSourceCode,
        "foodNutrientSourceDescription": foodNutrientSourceDescriptionValues
            .reverse[foodNutrientSourceDescription],
        "rank": rank,
        "indentLevel": indentLevel,
        "foodNutrientId": foodNutrientId,
        "percentDailyValue":
            percentDailyValue == null ? null : percentDailyValue,
      };
}

enum DerivationCode { LCCS, LCCD, LCSL }

final derivationCodeValues = EnumValues({
  "LCCD": DerivationCode.LCCD,
  "LCCS": DerivationCode.LCCS,
  "LCSL": DerivationCode.LCSL
});

enum FoodNutrientSourceDescription {
  MANUFACTURER_S_ANALYTICAL_PARTIAL_DOCUMENTATION
}

final foodNutrientSourceDescriptionValues = EnumValues({
  "Manufacturer's analytical; partial documentation":
      FoodNutrientSourceDescription
          .MANUFACTURER_S_ANALYTICAL_PARTIAL_DOCUMENTATION
});

enum UnitName { G, KCAL, MG, IU }

final unitNameValues = EnumValues({
  "G": UnitName.G,
  "IU": UnitName.IU,
  "KCAL": UnitName.KCAL,
  "MG": UnitName.MG
});

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
