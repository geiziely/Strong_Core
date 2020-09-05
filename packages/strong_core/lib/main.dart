import 'auth.dart';
import 'cadastro.dart';
import 'principal.dart';
import 'home.dart';
import 'login2.dart';
import 'register.dart';
import 'splash.dart';
import 'task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
//import'rascunho.dart';
import 'boneco.dart';
import 'package:app/screen/main_screen_portrait.dart';
import 'package:app/screen/main_screen_landscape.dart';
import 'package:app/classes/dependencies.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'corpo.dart';
import 'relatorio.dart';
import 'coretrainingpage.dart';
import 'screen_exercicios.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'balta.io',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: Relatorio(), //VideoPlayerScreen(),//Cadastro(),//SplashPage(),
        routes: <String, WidgetBuilder>{
          // '/TimerClock ': (BuildContext context) =>StopwatchHomePage(),
          '/cadastro': (BuildContext context) => Cadastro(),
          '/task': (BuildContext context) => TaskPage(title: 'Task'),
          '/home': (BuildContext context) => HomePage(title: 'Home'),
          '/login': (BuildContext context) => LoginPage(),
          '/register': (BuildContext context) => RegisterPage(),
        });
  }
}

/* class StopwatchHomePage extends StatelessWidget {
  final Dependencies dependencies = new Dependencies();

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return Scaffold(
        body: new Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20.0),
            child: mediaQueryData.orientation == Orientation.portrait
                ? MainScreenPortrait(dependencies: dependencies)
                : MainScreenLandscape(dependencies: dependencies)));
  }
} */
