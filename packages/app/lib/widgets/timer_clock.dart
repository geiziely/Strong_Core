import 'package:flutter/material.dart';
import 'package:app/classes/curent_time.dart';
import 'package:app/classes/dependencies.dart';
import 'package:app/classes/clock_painter.dart';

class TimerClock extends StatefulWidget {
  final Dependencies dependencies;

  TimerClock(this.dependencies, {Key key}) : super(key: key);

  TimerClockState createState() => TimerClockState();
}

class TimerClockState extends State<TimerClock> {
  CurrentTime currentTime;

  Paint paint;

  @override
  void initState() {
    paint = new Paint();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    currentTime = widget.dependencies.transformMilliSecondsToTime(
        widget.dependencies.stopwatch.elapsedMilliseconds);

    return CustomPaint(
      /* painter: ClockPainter(
          lineColor: Colors.lightBlueAccent,
          completeColor: Colors.blueAccent,
          hundreds: currentTime.hundreds,
          seconds: currentTime.seconds,
          minutes: currentTime.minutes,
          hours: currentTime.hours,
          width: 4.0,
          linePaint: paint), */
      child: Container(
        alignment: Alignment.center,
        width:60,
        height: 30,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        /*     Text(
              currentTime.hours.toString().padLeft(2, '0'),
              style: TextStyle(fontSize: 36.0),
            ), */
            Text(
              '${currentTime.minutes.toString().padLeft(2, '0')} : ${currentTime.seconds.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 20.0), //mostra na tela em tempo real o tempo
            ),
           /*  Text(
              currentTime.hundreds.toString().padLeft(2, '0'),
              style: TextStyle(fontSize: 24.0),
            ) */
          ],
        ),
      ),
    );
  }
}
