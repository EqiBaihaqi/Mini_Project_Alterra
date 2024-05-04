// To parse this JSON data, do
//
//     final searchRecipesResponse = searchRecipesResponseFromJson(jsonString);

import 'dart:convert';

SearchRecipesResponse searchRecipesResponseFromJson(String str) => SearchRecipesResponse.fromJson(json.decode(str));

String searchRecipesResponseToJson(SearchRecipesResponse data) => json.encode(data.toJson());

class SearchRecipesResponse {
    List<Result>? results;
    int? offset;
    int? number;
    int? totalResults;

    SearchRecipesResponse({
        this.results,
        this.offset,
        this.number,
        this.totalResults,
    });

    factory SearchRecipesResponse.fromJson(Map<String, dynamic> json) => SearchRecipesResponse(
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
        offset: json["offset"],
        number: json["number"],
        totalResults: json["totalResults"],
    );

    Map<String, dynamic> toJson() => {
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
        "offset": offset,
        "number": number,
        "totalResults": totalResults,
    };
}

class Result {
    int? id;
    String? title;
    String? image;
    String? imageType;

    Result({
        this.id,
        this.title,
        this.image,
        this.imageType,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        imageType: json["imageType"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "imageType": imageType,
    };
}
