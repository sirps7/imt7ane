import 'package:flutter/cupertino.dart';

class Subjects {
  static List<Subject> deffultsubjects = [];

  static void fromJson(List json) {
    if (deffultsubjects.isEmpty){
    for (var e in json) {
      deffultsubjects.add(
        Subject(
          id: e['subject']['id'],
          name: e['subject']['name'],
          quizCount: e['quiz_count'],
          stage: e['subject']['stage']['stages'],
          type: e['subject']['stage']['type'],
        ),
      );
    }
  }}
}

class Subject {
  Subject({
    required this.name,
    required this.id,
    required this.quizCount,
    required this.stage,
    required this.type,
  });
  String name;
  int id;
  int quizCount;
  String stage;
  String type;
}
