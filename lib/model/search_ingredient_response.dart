// To parse this JSON data, do
//
//     final searchIngredientResponse = searchIngredientResponseFromJson(jsonString);

import 'dart:convert';

SearchIngredientResponse searchIngredientResponseFromJson(String str) =>
    SearchIngredientResponse.fromJson(json.decode(str));

String searchIngredientResponseToJson(SearchIngredientResponse data) =>
    json.encode(data.toJson());

class SearchIngredientResponse {
  List<SearchIngredientResult>? results;
  int? offset;
  int? number;
  int? totalResults;

  SearchIngredientResponse({
    this.results,
    this.offset,
    this.number,
    this.totalResults,
  });

  factory SearchIngredientResponse.fromJson(Map<String, dynamic> json) {
  return SearchIngredientResponse(
    results: (json["results"] as List<dynamic>?)
        ?.map((result) => SearchIngredientResult.fromJson(result))
        .toList(),
    offset: json["offset"],
    number: json["number"],
    totalResults: json["totalResults"],
  );
}


  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "offset": offset,
        "number": number,
        "totalResults": totalResults,
      };
}

class SearchIngredientResult {
  int? id;
  String? name;
  String? image;

  SearchIngredientResult({
    this.id,
    this.name,
    this.image,
  });

  factory SearchIngredientResult.fromJson(Map<String, dynamic> json) =>
      SearchIngredientResult(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
