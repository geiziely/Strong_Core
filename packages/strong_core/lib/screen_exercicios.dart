import 'package:flutter/material.dart';
import 'package:app/screen/main_screen_portrait.dart';
import 'package:app/classes/dependencies.dart';
import 'principal.dart';

class ScreenExercicios extends StatefulWidget {
  ScreenExercicios(
      {Key key,
      this.stream,
      this.semanaqta,
      this.proximoExer,
      this.canShowButtonSalvar})
      : super(key: key);
  //String uid;
  bool canShowButtonSalvar;
  int semanaqta;
  int proximoExer;
  String stream;

  @override
  _ScreenExerciciosState createState() => _ScreenExerciciosState();
}

class _ScreenExerciciosState extends State<ScreenExercicios> {
  Dependencies dependencies = Dependencies();
  String streamdefault = 'videos/butterfly.mp4';

  void initState() {
    widget.canShowButtonSalvar ??= false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(children: <Widget>[
      Container(
          width: 400,
          height: 310,
          child: VideoPlayerScreen(stream: widget.stream)),
      Container(
        width: 400,
        height: 270,
        child: MainScreenPortrait(
            dependencies: dependencies,
            semanaqta: widget.semanaqta,
            proximoExer: widget.proximoExer),
      ),
    ])));
  }
}
