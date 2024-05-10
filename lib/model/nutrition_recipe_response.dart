// To parse this JSON data, do
//
//     final nutritionRecipeResponse = nutritionRecipeResponseFromJson(jsonString);

import 'dart:convert';

NutritionRecipeResponse nutritionRecipeResponseFromJson(String str) =>
    NutritionRecipeResponse.fromJson(json.decode(str));

String nutritionRecipeResponseToJson(NutritionRecipeResponse data) =>
    json.encode(data.toJson());

class NutritionRecipeResponse {
  String? calories;
  String? carbs;
  String? fat;
  String? protein;
  List<Bad>? bad;
  List<Bad>? good;
  List<Flavonoid>? nutrients;
  List<Flavonoid>? properties;
  List<Flavonoid>? flavonoids;
  List<Ingredient>? ingredients;
  CaloricBreakdown? caloricBreakdown;
  WeightPerServing? weightPerServing;
  int? expires;
  bool? isStale;

  NutritionRecipeResponse({
    this.calories,
    this.carbs,
    this.fat,
    this.protein,
    this.bad,
    this.good,
    this.nutrients,
    this.properties,
    this.flavonoids,
    this.ingredients,
    this.caloricBreakdown,
    this.weightPerServing,
    this.expires,
    this.isStale,
  });

  factory NutritionRecipeResponse.fromJson(Map<String, dynamic> json) =>
      NutritionRecipeResponse(
        calories: json["calories"],
        carbs: json["carbs"],
        fat: json["fat"],
        protein: json["protein"],
        bad: json["bad"] == null
            ? []
            : List<Bad>.from(json["bad"]!.map((x) => Bad.fromJson(x))),
        good: json["good"] == null
            ? []
            : List<Bad>.from(json["good"]!.map((x) => Bad.fromJson(x))),
        nutrients: json["nutrients"] == null
            ? []
            : List<Flavonoid>.from(
                json["nutrients"]!.map((x) => Flavonoid.fromJson(x))),
        properties: json["properties"] == null
            ? []
            : List<Flavonoid>.from(
                json["properties"]!.map((x) => Flavonoid.fromJson(x))),
        flavonoids: json["flavonoids"] == null
            ? []
            : List<Flavonoid>.from(
                json["flavonoids"]!.map((x) => Flavonoid.fromJson(x))),
        ingredients: json["ingredients"] == null
            ? []
            : List<Ingredient>.from(
                json["ingredients"]!.map((x) => Ingredient.fromJson(x))),
        caloricBreakdown: json["caloricBreakdown"] == null
            ? null
            : CaloricBreakdown.fromJson(json["caloricBreakdown"]),
        weightPerServing: json["weightPerServing"] == null
            ? null
            : WeightPerServing.fromJson(json["weightPerServing"]),
        expires: json["expires"],
        isStale: json["isStale"],
      );

  Map<String, dynamic> toJson() => {
        "calories": calories,
        "carbs": carbs,
        "fat": fat,
        "protein": protein,
        "bad":
            bad == null ? [] : List<dynamic>.from(bad!.map((x) => x.toJson())),
        "good": good == null
            ? []
            : List<dynamic>.from(good!.map((x) => x.toJson())),
        "nutrients": nutrients == null
            ? []
            : List<dynamic>.from(nutrients!.map((x) => x.toJson())),
        "properties": properties == null
            ? []
            : List<dynamic>.from(properties!.map((x) => x.toJson())),
        "flavonoids": flavonoids == null
            ? []
            : List<dynamic>.from(flavonoids!.map((x) => x.toJson())),
        "ingredients": ingredients == null
            ? []
            : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
        "caloricBreakdown": caloricBreakdown?.toJson(),
        "weightPerServing": weightPerServing?.toJson(),
        "expires": expires,
        "isStale": isStale,
      };
}

class Bad {
  String? amount;
  bool? indented;
  String? title;
  double? percentOfDailyNeeds;

  Bad({
    this.amount,
    this.indented,
    this.title,
    this.percentOfDailyNeeds,
  });

  factory Bad.fromJson(Map<String, dynamic> json) => Bad(
        amount: json["amount"],
        indented: json["indented"],
        title: json["title"],
        percentOfDailyNeeds: json["percentOfDailyNeeds"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "indented": indented,
        "title": title,
        "percentOfDailyNeeds": percentOfDailyNeeds,
      };
}

class CaloricBreakdown {
  double? percentFat;
  double? percentCarbs;
  double? percentProtein;

  CaloricBreakdown({
    this.percentFat,
    this.percentCarbs,
    this.percentProtein,
  });

  factory CaloricBreakdown.fromJson(Map<String, dynamic> json) =>
      CaloricBreakdown(
        percentFat: json["percentFat"]?.toDouble(),
        percentCarbs: json["percentCarbs"]?.toDouble(),
        percentProtein: json["percentProtein"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "percentFat": percentFat,
        "percentCarbs": percentCarbs,
        "percentProtein": percentProtein,
      };
}

class Flavonoid {
  String? name;
  double? amount;
  String? unit;
  double? percentOfDailyNeeds;

  Flavonoid({
    this.name,
    this.amount,
    this.unit,
    this.percentOfDailyNeeds,
  });

  factory Flavonoid.fromJson(Map<String, dynamic> json) => Flavonoid(
        name: json["name"],
        amount: json["amount"]?.toDouble(),
        unit: json["unit"],
        percentOfDailyNeeds: json["percentOfDailyNeeds"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "unit": unit,
        "percentOfDailyNeeds": percentOfDailyNeeds,
      };
}

class Ingredient {
  String? name;
  double? amount;
  String? unit;
  int? id;
  List<Flavonoid>? nutrients;

  Ingredient({
    this.name,
    this.amount,
    this.unit,
    this.id,
    this.nutrients,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        amount: json["amount"]?.toDouble(),
        unit: json["unit"],
        id: json["id"],
        nutrients: json["nutrients"] == null
            ? []
            : List<Flavonoid>.from(
                json["nutrients"]!.map((x) => Flavonoid.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "unit": unit,
        "id": id,
        "nutrients": nutrients == null
            ? []
            : List<dynamic>.from(nutrients!.map((x) => x.toJson())),
      };
}

class WeightPerServing {
  int? amount;
  String? unit;

  WeightPerServing({
    this.amount,
    this.unit,
  });

  factory WeightPerServing.fromJson(Map<String, dynamic> json) =>
      WeightPerServing(
        amount: json["amount"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "unit": unit,
      };
}
