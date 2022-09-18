class Quizes {
  static List<Quiz> deffultQuizes = [];
  static late Quiz finalQuiz;
  static void fromJson(List json) {
    finalQuiz = Quiz(
      name: json[0]['name'],
      questionNo: json[0]['q_num'],
      time: int.parse(json[0]['timer']),
      id: json[0]['id'],
    );
    for (int i = 1; i < json.length; i++) {
      deffultQuizes.add(
        Quiz(
          name: json[i]['name'],
          questionNo: json[i]['q_num'],
          time: int.parse(json[i]['timer']),
          id: json[i]['id'],
          chapterName: json[i]['chapter'][0]['name'],
        ),
      );
    }
  }
}

class Quiz {
  Quiz({
    required this.name,
    this.chapterName,
    required this.questionNo,
    required this.time,
    required this.id,
  });
  String name;
  String? chapterName;
  int questionNo;
  int time;
  int id;
}
