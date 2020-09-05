import 'dart:async';
import 'dart:math';
import 'package:app/coretrainingpage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:app/classes/dependencies.dart';
import 'package:app/widgets/timer_clock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/corpo.dart';
import 'package:app/rascunho.dart';
import 'package:app/screen_exercicios.dart';

class MainScreenPortrait extends StatefulWidget {
  MainScreenPortrait(
      {Key key, this.dependencies, this.semanaqta, this.proximoExer, this.uid})
      : super(key: key); //variaveis que vai receber
  int proximoExer;
  //final String uid;
  int semanaqta;
  String uid;

  final Dependencies dependencies;

  MainScreenPortraitState createState() => MainScreenPortraitState();
}

class MainScreenPortraitState extends State<MainScreenPortrait> {
  Icon leftButtonIcon;
  //Icon rightButtonIcon;
  int repeticao = 0;
  Color leftButtonColor; //Color rightButtonColor;
  bool _canShowButton = false;
  bool _isButtonDisabled = false;
  bool canShowButtonSalvar = false;
  bool acabou = true;

  FirebaseUser currentUser;
  int semana;
  Timer timer;
  int exercicio;
  int proxSemana;
  int proximoExer = 0;
  int dia;
  String stream;
  String indextamanho;
  final dbRef = FirebaseDatabase.instance.reference().child(
      '/users/gmKjgCrUl7fYTvym0KAkgjCnc1z2/Relatorios/Semana 1/Dia/Exercicios');

  String stream1 =
      'https://archive.org/download/Damas_BB_28F8B535_D_406/DaMaS.mp4'; //mulheres
  String stream2 =
      'https://archive.org/download/cCloud_20151126/cCloud.mp4'; //diversos
  String stream3 = 'https://archive.org/download/mblbhs/mblbhs.mp4'; //celular
  String streamdefault = 'videos/butterfly.mp4';

  String exercicioNome;

  updateTime(Timer timer) {
    if (widget.dependencies.stopwatch.isRunning) {
      setState(() {});
    } else {
      timer.cancel();
    }
  }

  @override
  void initState() {
    widget.proximoExer ??= 0;
    if (widget.dependencies.stopwatch.isRunning) {
      timer = new Timer.periodic(new Duration(milliseconds: 20), updateTime);
      leftButtonIcon = Icon(Icons.pause);
      leftButtonColor = Colors.red;
    } else {
      leftButtonIcon = Icon(Icons.play_arrow);
      leftButtonColor = Colors.green;
      _canShowButton = false;
      _isButtonDisabled = false;
    }
    super.initState();
  }

  @override
  void dispose() {
    if (timer.isActive) {
      timer.cancel();
      timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Container(
          height: 260, //altura do container
          width: 370,
          //alignment: Alignment(0.2,0.230),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 60.0,
                    width: 100.0,
                    child: TimerClock(widget.dependencies),
                  ),

                  SizedBox(height: 20.0),

                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //children: <Widget>[
                  _canShowButton
                      ? RaisedButton(
                          child: Text('Próximo'),
                          onPressed: () {
                            print('semana q ta indo do main $semana');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScreenExercicios(
                                      stream: mudaVideo(),
                                      semanaqta: semana,
                                      proximoExer: proximoExer,
                                      canShowButtonSalvar:
                                          canShowButtonSalvar)),
                            );
                          })
                      : acabou
                          ? FloatingActionButton(
                              heroTag: null,
                              backgroundColor: leftButtonColor,
                              onPressed:
                                  _canShowButton ? null : startOrStopWatch,
                              child: leftButtonIcon)
                          : Icon(Icons.star, color: Colors.blue),

                  Container(
                    child: canShowButtonSalvar
                        ? RaisedButton(
                            child: Text('Salvar'),
                            onPressed: () {
                              print('semana q ta indo ${widget.semanaqta}');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder:
                                        (context) => //enviar semana e dia para o corpo
                                            Corpo(
                                                semana: semana,
                                                uid: widget.uid,
                                                dia: dia)),
                              );
                            })
                        : Container(
                            child: Text(""),
                          ),
                  ),

                  SizedBox(width: 20.0),
                ],
              ),

              SizedBox(height: 20.0),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.dependencies.savedTimeList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
                        dense: true,
                        title: Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            child: Text(
                              createListItemText(
                                  widget.dependencies.savedTimeList.length,
                                  index,
                                  widget.dependencies.savedTimeList
                                      .elementAt(index)),
                              style: TextStyle(fontSize: 20.0),
                            )),
                      );
                    }),
              ),
              //Text('$savedTimeList')
            ],
          )),
    ]));
  }

  startOrStopWatch() {
    if (widget.dependencies.stopwatch.isRunning) {
      print('semana q ta ${widget.semanaqta}');
      repeticao = repeticao + 1;
      leftButtonIcon = Icon(Icons.play_arrow);
      leftButtonColor = Colors.green;
      /* rightButtonIcon = Icon(Icons.refresh);
      rightButtonColor = Colors.blue; */
      widget.dependencies.stopwatch.stop();
      setState(() {
        if (repeticao <= 3) {
          widget.dependencies.savedTimeList.insert(
              0,
              widget.dependencies.transformMilliSecondsToString(
                  widget.dependencies.stopwatch.elapsedMilliseconds));
        }
        if (repeticao == 3) {
          _canShowButton = true; //desativa e ativa outro botao
          //semana = widget.semanaqta+2 ;
          proximoExer = widget.proximoExer + 1;
          repeticao = 0;
          print('proximoexerc no if $proximoExer');
          //guardatempo();

          if (proximoExer == 3) {
            //dia=dia+1;
            acabou = false;
            _canShowButton = false;

            mudaVideo();
            dia = 5;
            proximoExer = 0;
            semana = widget.semanaqta + 1;
            print('semana q ta no if  ${semana}');

            if (dia == 5) {
              dia = 0;
              canShowButtonSalvar = true;
            } else {
              print('dia');
            }
          }
        }
      });
      widget.dependencies.stopwatch.reset();
    } else {
      leftButtonIcon = Icon(Icons.pause);
      leftButtonColor = Colors.red;
      /*   rightButtonIcon = Icon(
        Icons.fiber_manual_record,
        color: Colors.red,
      ); */
      //rightButtonColor = Colors.white70;
      widget.dependencies.stopwatch.start();
      timer = new Timer.periodic(new Duration(milliseconds: 20), updateTime);
    }
  }

  mudaVideo() {
    semana = widget.semanaqta;
    if (semana == 1 || semana == 4) {
      switch (proximoExer) {
        case 1:
          stream = stream2;
          guardatempo('Prancha');

          break;
        case 2:
          stream = stream3;
          guardatempo('Abdominal');
          break;
        case 3:
          stream = stream2;
          guardatempo('flexoes');
          break;
      }
    } else if (semana == 2 || semana == 5) {
      switch (proximoExer) {
        case 1:
          stream = stream2;
          guardatempo('supino');
          break;
        case 2:
          stream = stream3;
          guardatempo('corrida');
          break;
        case 3:
          stream = stream2;
          guardatempo('salto');
          break;
      }
    } else if (semana == 3 || semana == 6) {
      switch (proximoExer) {
        case 1:
          stream = stream2;
          break;
        case 2:
          stream = stream3;
          break;
        case 3:
          stream = stream2;
          break;
      }
    } else {
      stream = streamdefault;
    }
    return stream;
  }

  String createListItemText(int listSize, int index, String time) {
    index = listSize - index;
    String indexText = index.toString().padLeft(2, '');
    //indextamanho = indexText;
    return 'Tempo $indexText =  $time';
  }

  /*  guardatempo(String exercicioNome) {
    print('$exercicioNome');
    Firestore.instance
        .collection('users')
        .document('gmKjgCrUl7fYTvym0KAkgjCnc1z2')
        .collection('Relatorios')
        .document('Semana 1')
        .collection('Dia')
        .document('Exercicios')
        .setData({
      '$exercicioNome': widget.dependencies.savedTimeList,
    }, merge: true); //merge é para nao limpar oq já ta escrito na pasta
    mostraexercicios();
  } */

  guardatempo(String exercicioNome) {
    print('$exercicioNome');

    Firestore.instance
        .collection('users')
        .document('gmKjgCrUl7fYTvym0KAkgjCnc1z2')
        .collection('Relatorios')
        .document('Semana 1')
        .collection('Dia')
        .document('Exercicios')
        .setData({
      'Exercicio $proximoExer': {
        'name': '$exercicioNome',
        'tempo 1': widget.dependencies.savedTimeList.elementAt(0),
        'tempo 2': widget.dependencies.savedTimeList.elementAt(1),
        'tempo 3': widget.dependencies.savedTimeList.elementAt(2),
      }
    }, merge: true);
    mostraexercicios();
  }

  mostraexercicios() {
    Firestore.instance
        .collection('users')
        .document('gmKjgCrUl7fYTvym0KAkgjCnc1z2')
        .collection('Relatorios')
        .document('Semana 1')
        .collection('Dia')
        .document('Exercicios')
        .get() //lê a informação que esta guardada
        .then((value) {
      print('oieeeeeee${value.data}');
      String ler = (value.data['Exercicio 1']);
      print('$ler');
      //final List<String> names = value.data;
      //print(names);
    });
  }
}
