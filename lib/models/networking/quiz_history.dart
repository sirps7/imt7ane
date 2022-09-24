import 'package:amti7ane_unicoding/models/quiz_history.dart';
import 'package:intl/intl.dart';

class History {
  static List<QuizHistory> historyList = [];

  static void fromJson(List json) {
    for (Map e in json) {
      historyList.add(
        QuizHistory(
          created: DateFormat('yy/MM/dd').format(DateTime.parse(e['created'])),
          subject: e['subject'],
          chapter: e['chapter'],
          score: e['score'],
        ),
      );
    }
  }
}
