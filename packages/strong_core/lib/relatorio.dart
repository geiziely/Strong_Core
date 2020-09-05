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
  //String recebesemana;
  int semana;
  final Usuarios relatorio;

  @override
  _RelatorioState createState() => _RelatorioState();
}

class _RelatorioState extends State<Relatorio> {
  FirebaseUser currentUser;
  final dbRef = FirebaseDatabase.instance.reference().child("Semana 1");

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

  /*    List<Widget> cabecalho() {
    return [
      Container(
          padding: EdgeInsets.all(20),
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
  } */

  List<Widget> relatorio() {
    return [
      Container(
          padding: EdgeInsets.all(20),
          child: Row(children: <Widget>[
            Container(
                child: DataTable(rows: [
              DataRow(
                cells: [
                  DataCell(Text(widget.usuario.nome)),
                  DataCell(Text('oi2')),
                  //DataCell(Text("oi3")),
                ],
              ),
            ], columns: [
              DataColumn(
                label: Text("Exercicios"),
              ),
              DataColumn(
                label: Text("Duração dos Exercicios"),
              ),
            ]))
          ]))
    ];
  }

 /*  List<Widget> relatorio() {
    final dbRef = FirebaseDatabase.instance.reference().child("pets");
    return [
      FutureBuilder(
          future: dbRef.once(),
          builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
            if (snapshot.hasData) {
              lists.clear();
              Map<dynamic, dynamic> values = snapshot.data.value;
              values.forEach((key, values) {
                lists.add(values);
              });
              return new ListView.builder(
                  shrinkWrap: true,
                  itemCount: lists.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Name: " + lists[index]["name"]),
                          Text("Age: " + lists[index]["age"]),
                          Text("Type: " + lists[index]["type"]),
                        ],
                      ),
                    );
                  });
            }
            return CircularProgressIndicator();
          })
    ];
  } */

  /*  class ExerciciosView extends StatelessWidget {
  final List<String> exercicios;

  ExerciciosView(this.exercicios);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List<Widget>();
    exercicios.forEach((item) {
      children.add(
        new Row(
          children: <Widget>[
            new Text(item),
          ],
        ),
      );
      // Add spacing between the lines:
      children.add(
        new SizedBox(
          height: 5.0,
        ),
      );
    });
    return ListView(
      padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 75.0),
      children: children,
    );
  }
  }  */

  mostraexercicios() {
    Firestore.instance
        .collection("users")
        .document('gmKjgCrUl7fYTvym0KAkgjCnc1z2')
        .collection('Relatorios')
        .document('Semana 1')
        .collection('Dia')
        .document('Exercicios')
        .get() //lê a informação que esta guardada
        .then((value) {
      String nome = (value.data["Exercicio 1"]["name"]);
      print("$nome");
      return '$nome';
    });
    //return '$nome';
  }
}

// fazer aparecer na tabela o relatorio
