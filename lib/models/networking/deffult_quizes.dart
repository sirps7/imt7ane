class Quizes {
  static List<Quiz> quizesList = [];
  static late Quiz finalQuiz;
  static void fromJson(List json) {
    for (int i = 0; i < json.length; i++) {
      if (json[i]['name'] == "شامل") {
        finalQuiz = Quiz(
          name: json[i]['name'],
          questionNo: json[i]['q_num'],
          time: int.parse(json[i]['timer']),
          id: json[i]['id'],
        );
      } else {
        quizesList.add(
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
