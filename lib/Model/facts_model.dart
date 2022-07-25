// To parse this JSON data, do
//
//     final factsModel = factsModelFromJson(jsonString);

import 'dart:convert';

List<FactsModel> factsModelFromJson(String str) => List<FactsModel>.from(json.decode(str).map((x) => FactsModel.fromJson(x)));

String factsModelToJson(List<FactsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FactsModel {
  FactsModel({
    this.factId,
    this.text,
    this.chapter,
    this.diagram,
  });

  int? factId;
  String? text;
  int ?chapter;
  int? diagram;

  factory FactsModel.fromJson(Map<String, dynamic> json) => FactsModel(
    factId: json["fact_id"],
    text: json["text"],
    chapter: json["chapter"],
    diagram: json["diagram"],
  );

  Map<String, dynamic> toJson() => {
    "fact_id": factId,
    "text": text,
    "chapter": chapter,
    "diagram": diagram,
  };
}
