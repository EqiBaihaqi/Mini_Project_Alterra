// To parse this JSON data, do
//
//     final equipmentResponse = equipmentResponseFromJson(jsonString);

import 'dart:convert';

EquipmentResponse equipmentResponseFromJson(String str) => EquipmentResponse.fromJson(json.decode(str));

String equipmentResponseToJson(EquipmentResponse data) => json.encode(data.toJson());

class EquipmentResponse {
    List<Equipment>? equipment;

    EquipmentResponse({
        this.equipment,
    });

    factory EquipmentResponse.fromJson(Map<String, dynamic> json) => EquipmentResponse(
        equipment: json["equipment"] == null ? [] : List<Equipment>.from(json["equipment"]!.map((x) => Equipment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "equipment": equipment == null ? [] : List<dynamic>.from(equipment!.map((x) => x.toJson())),
    };
}

class Equipment {
    String? image;
    String? name;

    Equipment({
        this.image,
        this.name,
    });

    factory Equipment.fromJson(Map<String, dynamic> json) => Equipment(
        image: json["image"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
    };
}
