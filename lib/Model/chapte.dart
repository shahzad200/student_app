// To parse this JSON data, do
//
//     final chapterModel = chapterModelFromJson(jsonString);

import 'dart:convert';

List<ChapterModel> chapterModelFromJson(String str) => List<ChapterModel>.from(json.decode(str).map((x) => ChapterModel.fromJson(x)));

String chapterModelToJson(List<ChapterModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChapterModel {
  ChapterModel({
    required this.chapterId,
    required this.name,
    required this.subject,
  });

  int chapterId;
  String name;
  int subject;

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
    chapterId: json["chapter_id"],
    name: json["name"],
    subject: json["subject"],
  );

  Map<String, dynamic> toJson() => {
    "chapter_id": chapterId,
    "name": name,
    "subject": subject,
  };
}
