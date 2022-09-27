// To parse this JSON data, do
//
//     final stages = stagesFromMap(jsonString);

import 'dart:convert';

class Stages {
  Stages({
    required this.id,
    required this.stage,
  });

  int id;
  String stage;
  static List<Stages> stageFromJson(String str) =>
      List<Stages>.from(json.decode(str).map((x) => Stages.fromMap(x)));

  factory Stages.fromJson(String str) => Stages.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Stages.fromMap(Map<String, dynamic> json) => Stages(
    id: json["id"],
    stage: json["stage"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "stage": stage,
  };
}
