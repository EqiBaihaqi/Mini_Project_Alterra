// To parse this JSON data, do
//
//     final detailRecipeResponse = detailRecipeResponseFromJson(jsonString);

import 'dart:convert';

DetailRecipeResponse detailRecipeResponseFromJson(String str) =>
    DetailRecipeResponse.fromJson(json.decode(str));

String detailRecipeResponseToJson(DetailRecipeResponse data) =>
    json.encode(data.toJson());

class DetailRecipeResponse {
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
  String? gaps;
  int? preparationMinutes;
  int? cookingMinutes;
  int? aggregateLikes;
  int? healthScore;
  String? creditsText;
  String? license;
  String? sourceName;
  double? pricePerServing;
  List<ExtendedIngredient>? extendedIngredients;
  int? id;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  String? image;
  String? imageType;
  Taste? taste;
  String? summary;
  List<dynamic>? cuisines;
  List<String>? dishTypes;
  List<dynamic>? diets;
  List<dynamic>? occasions;
  WinePairing? winePairing;
  String? instructions;
  List<dynamic>? analyzedInstructions;
  dynamic originalId;
  double? spoonacularScore;
  String? spoonacularSourceUrl;

  DetailRecipeResponse({
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
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.taste,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.winePairing,
    this.instructions,
    this.analyzedInstructions,
    this.originalId,
    this.spoonacularScore,
    this.spoonacularSourceUrl,
  });

  factory DetailRecipeResponse.fromJson(Map<String, dynamic> json) =>
      DetailRecipeResponse(
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
        gaps: json["gaps"],
        preparationMinutes: json["preparationMinutes"],
        cookingMinutes: json["cookingMinutes"],
        aggregateLikes: json["aggregateLikes"],
        healthScore: json["healthScore"],
        creditsText: json["creditsText"],
        license: json["license"],
        sourceName: json["sourceName"],
        pricePerServing: json["pricePerServing"]?.toDouble(),
        extendedIngredients: json["extendedIngredients"] == null
            ? []
            : List<ExtendedIngredient>.from(json["extendedIngredients"]!
                .map((x) => ExtendedIngredient.fromJson(x))),
        id: json["id"],
        title: json["title"],
        readyInMinutes: json["readyInMinutes"],
        servings: json["servings"],
        sourceUrl: json["sourceUrl"],
        image: json["image"],
        imageType: json["imageType"],
        taste: json["taste"] == null ? null : Taste.fromJson(json["taste"]),
        summary: json["summary"],
        cuisines: json["cuisines"] == null
            ? []
            : List<dynamic>.from(json["cuisines"]!.map((x) => x)),
        dishTypes: json["dishTypes"] == null
            ? []
            : List<String>.from(json["dishTypes"]!.map((x) => x)),
        diets: json["diets"] == null
            ? []
            : List<dynamic>.from(json["diets"]!.map((x) => x)),
        occasions: json["occasions"] == null
            ? []
            : List<dynamic>.from(json["occasions"]!.map((x) => x)),
        winePairing: json["winePairing"] == null
            ? null
            : WinePairing.fromJson(json["winePairing"]),
        instructions: json["instructions"],
        analyzedInstructions: json["analyzedInstructions"] == null
            ? []
            : List<dynamic>.from(json["analyzedInstructions"]!.map((x) => x)),
        originalId: json["originalId"],
        spoonacularScore: json["spoonacularScore"]?.toDouble(),
        spoonacularSourceUrl: json["spoonacularSourceUrl"],
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
        "gaps": gaps,
        "preparationMinutes": preparationMinutes,
        "cookingMinutes": cookingMinutes,
        "aggregateLikes": aggregateLikes,
        "healthScore": healthScore,
        "creditsText": creditsText,
        "license": license,
        "sourceName": sourceName,
        "pricePerServing": pricePerServing,
        "extendedIngredients": extendedIngredients == null
            ? []
            : List<dynamic>.from(extendedIngredients!.map((x) => x.toJson())),
        "id": id,
        "title": title,
        "readyInMinutes": readyInMinutes,
        "servings": servings,
        "sourceUrl": sourceUrl,
        "image": image,
        "imageType": imageType,
        "taste": taste?.toJson(),
        "summary": summary,
        "cuisines":
            cuisines == null ? [] : List<dynamic>.from(cuisines!.map((x) => x)),
        "dishTypes": dishTypes == null
            ? []
            : List<dynamic>.from(dishTypes!.map((x) => x)),
        "diets": diets == null ? [] : List<dynamic>.from(diets!.map((x) => x)),
        "occasions": occasions == null
            ? []
            : List<dynamic>.from(occasions!.map((x) => x)),
        "winePairing": winePairing?.toJson(),
        "instructions": instructions,
        "analyzedInstructions": analyzedInstructions == null
            ? []
            : List<dynamic>.from(analyzedInstructions!.map((x) => x)),
        "originalId": originalId,
        "spoonacularScore": spoonacularScore,
        "spoonacularSourceUrl": spoonacularSourceUrl,
      };
}

class ExtendedIngredient {
  int? id;
  String? aisle;
  String? image;
  String? consistency;
  String? name;
  String? nameClean;
  String? original;
  String? originalName;
  double? amount;
  String? unit;
  List<String>? meta;
  Measures? measures;

  ExtendedIngredient({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.nameClean,
    this.original,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.measures,
  });

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) =>
      ExtendedIngredient(
        id: json["id"],
        aisle: json["aisle"],
        image: json["image"],
        consistency: json["consistency"],
        name: json["name"],
        nameClean: json["nameClean"],
        original: json["original"],
        originalName: json["originalName"],
        amount: json["amount"]?.toDouble(),
        unit: json["unit"],
        meta: json["meta"] == null
            ? []
            : List<String>.from(json["meta"]!.map((x) => x)),
        measures: json["measures"] == null
            ? null
            : Measures.fromJson(json["measures"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "aisle": aisle,
        "image": image,
        "consistency": consistency,
        "name": name,
        "nameClean": nameClean,
        "original": original,
        "originalName": originalName,
        "amount": amount,
        "unit": unit,
        "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
        "measures": measures?.toJson(),
      };
}

class Measures {
  Metric? us;
  Metric? metric;

  Measures({
    this.us,
    this.metric,
  });

  factory Measures.fromJson(Map<String, dynamic> json) => Measures(
        us: json["us"] == null ? null : Metric.fromJson(json["us"]),
        metric: json["metric"] == null ? null : Metric.fromJson(json["metric"]),
      );

  Map<String, dynamic> toJson() => {
        "us": us?.toJson(),
        "metric": metric?.toJson(),
      };
}

class Metric {
  double? amount;
  String? unitShort;
  String? unitLong;

  Metric({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
        amount: json["amount"]?.toDouble(),
        unitShort: json["unitShort"],
        unitLong: json["unitLong"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "unitShort": unitShort,
        "unitLong": unitLong,
      };
}

class Taste {
  double? sweetness;
  double? saltiness;
  double? sourness;
  int? bitterness;
  double? savoriness;
  double? fattiness;
  int? spiciness;

  Taste({
    this.sweetness,
    this.saltiness,
    this.sourness,
    this.bitterness,
    this.savoriness,
    this.fattiness,
    this.spiciness,
  });

  factory Taste.fromJson(Map<String, dynamic> json) => Taste(
        sweetness: json["sweetness"]?.toDouble(),
        saltiness: json["saltiness"]?.toDouble(),
        sourness: json["sourness"]?.toDouble(),
        bitterness:
            json["bitterness"]?.toInt(), // Parse as double and then cast to int
        savoriness: json["savoriness"]?.toDouble(),
        fattiness: json["fattiness"]?.toDouble(),
        spiciness:
            json["spiciness"]?.toInt(), // Parse as double and then cast to int
      );

  Map<String, dynamic> toJson() => {
        "sweetness": sweetness,
        "saltiness": saltiness,
        "sourness": sourness,
        "bitterness": bitterness,
        "savoriness": savoriness,
        "fattiness": fattiness,
        "spiciness": spiciness,
      };
}

class WinePairing {
  List<dynamic>? pairedWines;
  String? pairingText;
  List<dynamic>? productMatches;

  WinePairing({
    this.pairedWines,
    this.pairingText,
    this.productMatches,
  });

  factory WinePairing.fromJson(Map<String, dynamic> json) => WinePairing(
        pairedWines: json["pairedWines"] == null
            ? []
            : List<dynamic>.from(json["pairedWines"]!.map((x) => x)),
        pairingText: json["pairingText"],
        productMatches: json["productMatches"] == null
            ? []
            : List<dynamic>.from(json["productMatches"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "pairedWines": pairedWines == null
            ? []
            : List<dynamic>.from(pairedWines!.map((x) => x)),
        "pairingText": pairingText,
        "productMatches": productMatches == null
            ? []
            : List<dynamic>.from(productMatches!.map((x) => x)),
      };
}
