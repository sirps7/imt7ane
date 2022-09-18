import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  static int givenMinutes = 05;
  static int givenHours = 00;
  static int givenSeconds = 00;
  Timer? timer;
  bool firstTime = true;

  static Duration duration = Duration(hours: givenHours, minutes: givenMinutes);
  static String towDigit(int n) => n.toString().padLeft(2, '0');
  RxString seconds = towDigit(givenSeconds).obs;
  RxString minutes = towDigit(givenMinutes).obs;
  RxString hours = towDigit(givenHours).obs;

  addTime() {
    const addenTime = 1;
    int secound = duration.inSeconds - addenTime;
    duration = Duration(seconds: secound);

    if (duration.inSeconds < 0) {
      timer!.cancel();
    } else {
      seconds.value = towDigit(duration.inSeconds.remainder(60));
      minutes.value = towDigit(duration.inMinutes.remainder(60));
      hours.value = towDigit(duration.inHours.remainder(60));
    }
  }

  startTimer() {
    if (firstTime) {
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        addTime();
        firstTime = false;
      });
    }
  }

  void stopTimer() {
    timer!.cancel();
    duration = Duration(hours: givenHours, minutes: givenMinutes);
    seconds = towDigit(givenSeconds).obs;
    minutes = towDigit(givenMinutes).obs;
    hours = towDigit(givenHours).obs;
  }
}
