// To parse this JSON data, do
//
//     final levelModel = levelModelFromJson(jsonString);

// import 'dart:convert';

import 'dart:convert';

List<LevelModel> levelModelFromJson(String str) => List<LevelModel>.from(json.decode(str).map((x) => LevelModel.fromJson(x)));

String levelModelToJson(List<LevelModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LevelModel {
  LevelModel({
    required this.levelId,
    required this.name,
  });

  int levelId;
  String name;

  factory LevelModel.fromJson(Map<String, dynamic> json) => LevelModel(
    levelId: json["level_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "level_id": levelId,
    "name": name,
  };
}
