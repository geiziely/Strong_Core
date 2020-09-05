import 'package:app/classes/curent_time.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class Dependencies {
  final Stopwatch stopwatch = new Stopwatch();

  final List<String> savedTimeList = List<String>();
  //final List<String> saveButtonList = List<FlatButton>();

  transformMilliSecondsToString(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    //int hours = (minutes / 60).truncate();

    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    //String hoursStr = (hours % 60).toString().padLeft(2, '0');

    if (minutes == 0) {
      return '$secondsStr s'; //aqui q vai salvar?
    } else {
      return '$minutesStr : $secondsStr';
    }
  }

  transformMilliSecondsToTime(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    //int hours = (minutes / 60).truncate();

    return CurrentTime(
        hundreds: hundreds % 100, seconds: seconds % 60, minutes: minutes % 60);
    //hours: hours % 24);
  }
}
