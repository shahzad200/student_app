// To parse this JSON data, do
//
//     final subjectModel = subjectModelFromJson(jsonString);

import 'dart:convert';

List<SubjectModel> subjectModelFromJson(String str) => List<SubjectModel>.from(json.decode(str).map((x) => SubjectModel.fromJson(x)));

String subjectModelToJson(List<SubjectModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubjectModel {
  SubjectModel({
    required this.subjectId,
    required this.name,
    required this.level,
  });

  int subjectId;
  String name;
  int level;

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
    subjectId: json["subject_id"],
    name: json["name"],
    level: json["level"],
  );

  Map<String, dynamic> toJson() => {
    "subject_id": subjectId,
    "name": name,
    "level": level,
  };
}
