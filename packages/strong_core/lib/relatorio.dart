import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:app/rascunho.dart';

class Relatorio extends StatefulWidget {
  Relatorio(
      {Key key, this.dia, this.uid, this.semana, this.relatorio, this.usuario})
      : super(key: key);
  final Usuarios usuario;
  int dia;
  String uid;
  //recebesemana;
  int semana;
  final Usuarios relatorio;

  @override
  _RelatorioState createState() => _RelatorioState();
}

class _RelatorioState extends State<Relatorio> {
  FirebaseUser currentUser;
  final dbRef = FirebaseDatabase.instance.reference().child("Semana 1");
  String nome1,nome2,nome3,tempo1exer1,tempo2exer1,tempo3exer1,tempo1exer2,tempo2exer2,tempo3exer2,tempo3exer3,tempo2exer3,tempo1exer3;
final List<String> entries = <String>['A', 'B', 'C'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Relatório de Treino"),

        ),
        body: Padding(
            // espaçamento de fora como se fosse a borda
            padding: EdgeInsets.all(5), // o tamanho do espaçamento
            child: ListView(children: <Widget>[
              Column(
                children: relatorio(),
              ),
            ])));
  }

    /* List<Widget> cabecalho() {
    return [
      Container(
          //padding: EdgeInsets.all(20),
          child: Row(children: <Widget>[
            CircleAvatar(
                backgroundImage: AssetImage('assets/logo2.jpg'), radius: 50),
            Container(
                padding: EdgeInsets.all(20),
                child: Column(
                    children: <Widget>[Text('Semana 1'), Text('Dia 1')])),
            Container(
                padding: EdgeInsets.all(20),
                child: Column(children: <Widget>[
                  Text('data'),
                  Icon(Icons.calendar_today)
                ]))
          ]))
    ];
  }  */

  List<Widget> relatorio() {
    return [
      Container( 
       
              height: 200.0,
              width:250,
  child: ListView(
    scrollDirection: Axis.vertical,
    children: <Widget>[
      RaisedButton(
        onPressed: null,
        child: Text("Facebook"),
      ),
      
      RaisedButton(
        onPressed: null,
        child: Text("Google"),
      )
    ],
  ),
          )
        
    ];
  } //TODO pegar a lista de dores do firebase e fazer com que apareça aqui.

  /* mostraexercicios(int x) {
    
    Firestore.instance
        .collection('users')
        .document('gmKjgCrUl7fYTvym0KAkgjCnc1z2')
        .collection('Relatorios')
        .document('Semana 1')
        .collection('Dia')
        .document('Exercicios')
        .get() //lê a informação que esta guardada
        .then((value) {
      nome1 = (value.data['Exercicio 1']['name']);
      nome2 = (value.data['Exercicio 2']['name']);
      nome3 = (value.data['Exercicio 3']['name']);
      

      tempo1exer1 = (value.data['Exercicio 1']['tempo 1']);
      tempo2exer1 = (value.data['Exercicio 1']['tempo 2']);
      tempo3exer1 = (value.data['Exercicio 1']['tempo 3']);

      tempo1exer2 = (value.data['Exercicio 2']['tempo 1']);
      tempo2exer2 = (value.data['Exercicio 2']['tempo 2']);
      tempo3exer2 = (value.data['Exercicio 2']['tempo 3']);

      tempo1exer3 = (value.data['Exercicio 3']['tempo 1']);
      tempo2exer3 = (value.data['Exercicio 3']['tempo 2']);
      tempo3exer3 = (value.data['Exercicio 3']['tempo 3']);
      
      
    });
    if( x == 1) {return '$nome1';}
    if( x == 2) {return '$nome2';}
    if( x == 3) {return '$nome3';}
    if( x == 4) {return '$tempo1exer1';}
    if( x == 5) {return '$tempo2exer1';}
    if( x == 6) {return '$tempo3exer1';}
    if( x == 7) {return '$tempo1exer2';}
    if( x == 8) {return '$tempo2exer2';}
    if( x == 9) {return '$tempo3exer2';}
    if( x == 10) {return '$tempo1exer3';}
    if( x == 11) {return '$tempo2exer3';}
    if( x == 12) {return '$tempo3exer3';}   
      
  } */
  // TODO fazer melhor esta parte, uma classe só para pegar os dados da nuvem
}

// fazer aparecer na tabela o relatorio
