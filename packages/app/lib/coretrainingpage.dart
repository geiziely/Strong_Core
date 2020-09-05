import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/classes/dependencies.dart';
import 'screen_exercicios.dart';

class CoreTrainingPage extends StatefulWidget {
  CoreTrainingPage({Key key, this.title, this.uid, this.semana})
      : super(key: key);
  String title;
  String uid;
  //String recebesemana;
  int semana;

  @override
  _CoreTrainingPageState createState() => _CoreTrainingPageState();
}

class _CoreTrainingPageState extends State<CoreTrainingPage> {
  FirebaseUser currentUser;

  //String semana;
  //String recebesemana;
  int semanaqta;
  int aux;
  int certo;
  Icon semana2ButtonIcon;
  Color semana2ButtonColor;

  Dependencies dependencies = Dependencies();

  initState() {
    widget.semana ??= 1; //se semana igual a null então semana recebe 1

    semana2ButtonIcon = Icon(Icons.lock);
    semana2ButtonColor = Colors.grey;

    super.initState();
  }

  /* Future navigateToSubPage(context) async { // chama outra pagina envia a semana e o uid do usuario, e retorna se ja foi os 5 dias da semana para avancar para a proxima
    semana = context;
    String message = await Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen(uid: currentUser.uid,semana:semana,)));
    if (message == proximasemana){
      print(message);
      //quero que acione o proximo botão qualsemana(message)
    }
  } */

  Widget build(BuildContext context) {
    //semanaqta = 2;

    return Scaffold(
        appBar: AppBar(title: Text('Core Training')),
        body: GridView.count(
            padding: EdgeInsets.all(30),
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScreenExercicios(semanaqta: 1)),
                  );
                }, //passa para a função a semana que é para conseguir acessar quais exercicios são
                color: Colors.orange,
                padding: EdgeInsets.all(15),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[Icon(Icons.lock_open), Text("Semana 1")],
                ),
              ),
              FlatButton(
                onPressed: () {
                  (widget.semana == 2)
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScreenExercicios(
                                    semanaqta: 2,
                                  )))
                      : null;
                },
                color: (widget.semana >= 2) ? Colors.orange : Colors.grey,
                padding: EdgeInsets.all(15),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon((widget.semana >= 2) ? Icons.lock_open : Icons.lock),
                    Text('Semana 2 ')
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  (widget.semana == 3)
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScreenExercicios(
                                    semanaqta: 3,
                                  )))
                      : null;
                },
                color: (widget.semana >= 3) ? Colors.orange : Colors.grey,
                padding: EdgeInsets.all(15),
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon((widget.semana == 3) ? Icons.lock_open : Icons.lock),
                    Text('Semana 3 ')
                  ],
                ),
              ),
            ]));
  }
}
