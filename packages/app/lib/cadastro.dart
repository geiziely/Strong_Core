import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'commonComponents/customCard.dart';
import 'package:date_format/date_format.dart';
import 'home.dart';
import 'cadastro_1.dart';

class Cadastro extends StatefulWidget {
  Cadastro({Key key, this.title, this.uid, this.estado})
      : super(key: key); //update this to include the uid in the constructor
  final String title;
  final String uid;
  final String estado; //include this

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController nameInputController;
  TextEditingController pesoInputController;
  TextEditingController estaturaInputController;

  FirebaseUser currentUser;
  Cidades est = new Cidades();

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  var selectedvalue = 'sexo';
  List<String> users = ['sexo', 'feminino', 'masculino'];

  var selectedprof = 'Selecione';
  List<String> prof = ['Selecione', 'Bombeiro Militar', 'Policia Militar'];

  var selectedgrad = 'Selecione';
  List<String> graduacao = [
    'Selecione',
    'Soldado 2ª classe',
    'Cadete',
    'Soldado 1ª classe'
  ];

  var selectedlotado = 'Selecione';
  List<String> lot = ['Selecione', 'Cargo Administrativo', 'Cargo Operacional'];

  var selectedestado = 'Selecione';
  List<String> estado = [
    'Selecione',
    'acre',
    'alagoas',
    'Amapá',
    'Amazonas',
    'Bahia',
    'Ceará',
    'Distrito Federal',
    'Espírito Santo',
    'Goiás',
    'Maranhão',
    'Mato Grosso',
    'Mato Grosso do Sul',
    'Minas Gerais',
    'Pará',
    'Paraíba',
    'Paraná',
    'Pernambuco',
    'Piauí',
    'Rio de Janeiro',
    'Rio Grande do Norte',
    'Rio Grande do Sul',
    'Rondônia',
    'Roraima',
    'Santa Catarina',
    'São Paulo',
    'Sergipe',
    'Tocantins'
  ]; ////problemas

  var selectedcidade = 'Selecione';
  List<String> cidade = [
    'Selecione',
    'Cargo Administrativo',
    'Cargo Operacional'
  ]; ////problemas

  var selectedprimeiro = 'Selecione';
  List<String> primeiro = [
    'Selecione',
    'Não pratico',
    'Uma vez por semana',
    'Duas vezes por semana',
    'Três vezes por semana',
    'Quatro dias por semana',
    'Cinco vezes por semana ou mais'
  ];
  var selectedsegundo = 'Selecione';
  List<String> segundo = [
    'Selecione',
    'Nenhum dia',
    'Um dia',
    'Dois dias',
    'Três dias',
    'Quatro dias',
    'Cinco dias',
    'Seis dias',
    'Sete dias ou mais'
  ];
  var selectedterceiro = 'Selecione';
  List<String> terceiro = [
    'Selecione',
    'Não recebo, e considero desnecessária essa informação para o meu trabalho',
    'Não recebo, mas considero essa informação importante para meu trabalho',
    'Recebo, mas considero desnecessária essa informação para o meu trabalho',
    'Recebo, e considero essa informação importante para meu trabalho',
    'Recebo, mas as informações passadas não auxiliam no meu trabalho'
  ];

  DateTime selecteddata = DateTime.now();
  DateTime selecteddataadmissao = DateTime.now();

  List<String> retorno;

  @override
  initState() {
    nameInputController = TextEditingController();

    this.getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    currentUser = await FirebaseAuth.instance.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro'),
          actions: <Widget>[
            FlatButton(
              child: Text("Log Out"),
              textColor: Colors.white,
              onPressed: () {
                FirebaseAuth.instance
                    .signOut()
                    .then((result) =>
                        Navigator.pushReplacementNamed(context, "/login"))
                    .catchError((err) => print(err));
              },
            )
          ],
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Form(
                    key: _registerFormKey,
                    child: Column(children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'First Name*', hintText: "John"),
                        controller: nameInputController,
                        validator: (value) {
                          if (value.length < 3) {
                            return 'Inserir nome valido.';
                          }
                        },
                      ),
                      DropdownButton(
                          hint: Text('Selecione'),
                          onChanged: (String changedValue) {
                            selectedvalue = changedValue;
                            setState(() {
                              selectedvalue;
                              print(selectedvalue);
                            });
                          },
                          value: selectedvalue,
                          items: users.map((String user) {
                            return new DropdownMenuItem<String>(
                              value: user,
                              child: new Text(user),
                            );
                          }).toList()),
                      Container(
                        child: InputDecorator(
                          child: FlatButton(
                              child: new Row(children: <Widget>[
                                new Text(
                                  '${formatDate(selecteddata, [
                                    dd,
                                    '/',
                                    mm,
                                    '/',
                                    yyyy
                                  ])}',
                                  //style:new TextStyle(color: Colors.black,fontSize: 20),
                                ),
                                new Icon(Icons.calendar_today),
                              ]),
                              onPressed: () async {
                                final dtPick = await showDatePicker(
                                    context: context,
                                    initialDate: new DateTime.now(),
                                    firstDate: new DateTime(1900),
                                    lastDate: new DateTime(2100));
                                if (dtPick != null && dtPick != selecteddata) {
                                  setState(() {
                                    selecteddata = dtPick;
                                  });
                                }
                              }),
                          decoration: new InputDecoration(
                            labelText: "Data de nascimento",
                            //labelStyle: TextStyle(color:Colors.black,fontSize:30)
                          ),
                        ),
                      ),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          //style: new TextStyle(color:Colors.black, fontSize:20),
                          decoration: InputDecoration(
                            labelText: "Peso",
                            //labelStyle: TextStyle(color:Colors.black)
                          ),
                          controller: pesoInputController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Inserir peso valido.';
                            }
                          }),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          //style: new TextStyle(color:Colors.black, fontSize:20),
                          decoration: InputDecoration(
                            labelText: "Estatura",
                            //labelStyle: TextStyle(color:Colors.black)
                          ),
                          controller: estaturaInputController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Inserir peso valido.';
                            }
                          }),
                      Container(
                        child: InputDecorator(
                          child: DropdownButton(
                              hint: Text('Selecione'),
                              onChanged: (String changedValue) {
                                selectedprof = changedValue;
                                setState(() {
                                  selectedprof;
                                  print(selectedprof);
                                });
                              },
                              value: selectedprof,
                              items: prof.map((String prof) {
                                return new DropdownMenuItem<String>(
                                    value: prof, child: new Text(prof));
                              }).toList()),
                          decoration: new InputDecoration(
                            labelText: "Profissão",
                            //labelStyle: TextStyle(color:Colors.black,fontSize:30)
                          ),
                        ),
                      ),
                      Container(
                        child: InputDecorator(
                          child: FlatButton(
                              child: new Row(children: <Widget>[
                                new Text(
                                  '${formatDate(selecteddataadmissao, [
                                    dd,
                                    '/',
                                    mm,
                                    '/',
                                    yyyy
                                  ])}',
                                  //style:new TextStyle(color: Colors.black,fontSize: 20),
                                ),
                                new Icon(Icons.calendar_today),
                              ]),
                              onPressed: () async {
                                final dtPick = await showDatePicker(
                                    context: context,
                                    initialDate: new DateTime.now(),
                                    firstDate: new DateTime(1900),
                                    lastDate: new DateTime(2100));
                                if (dtPick != null &&
                                    dtPick != selecteddataadmissao) {
                                  setState(() {
                                    selecteddataadmissao = dtPick;
                                  });
                                }
                              }),
                          decoration: new InputDecoration(
                            labelText: "Data de admissão",
                            //labelStyle: TextStyle(color:Colors.black,fontSize:30)
                          ),
                        ),
                      ),
                      Container(
                        child: InputDecorator(
                          child: DropdownButton<String>(
                              value: selectedgrad,
                              items: graduacao.map((grad) {
                                return DropdownMenuItem(
                                  value: grad,
                                  child: Text(grad),
                                );
                              }).toList(),
                              onChanged: (v) {
                                print(v);
                                setState(() {
                                  selectedgrad = v;
                                });
                              }),
                          decoration: new InputDecoration(
                            labelText: "Posto ou graduação",
                            //labelStyle: TextStyle(color:Colors.black,fontSize:30)
                          ),
                        ),
                      ),
                      Container(
                        child: InputDecorator(
                          child: DropdownButton<String>(
                              value: selectedlotado,
                              items: lot.map((lotado) {
                                return DropdownMenuItem(
                                  value: lotado,
                                  child: Text(lotado),
                                );
                              }).toList(),
                              onChanged: (v) {
                                print(v);
                                setState(() {
                                  selectedlotado = v;
                                });
                              }),
                          decoration: new InputDecoration(
                            labelText: "Você está lotado em :",
                            //labelStyle: TextStyle(color:Colors.black,fontSize:30)
                          ),
                        ),
                      ),
                      Container(
                        child: InputDecorator(
                          child: DropdownButton<String>(
                              value: selectedestado,
                              items: estado.map((est) {
                                return DropdownMenuItem(
                                  value: est,
                                  child: Text(est),
                                );
                              }).toList(),
                              onChanged: (v) {
                                //est.escolheEstado(selectedestado);
                                print(v);
                                setState(() {
                                  selectedestado = v;
                                });
                              }),
                          decoration: new InputDecoration(
                            labelText: "Estado:",
                            //labelStyle: TextStyle(color:Colors.black,fontSize:30)
                          ),
                        ),
                      ),
                      Container(
                        child: InputDecorator(
                          child: DropdownButton<String>(
                              value: selectedcidade,
                              items: cidade.map((cid) {
                                return DropdownMenuItem(
                                  value: cid,
                                  child: Text(cid),
                                );
                              }).toList(),
                              onChanged: (v) {
                                print(v);
                                setState(() {
                                  selectedcidade = v;
                                });
                              }),
                          decoration: new InputDecoration(
                            labelText: "Cidade:",
                            //labelStyle: TextStyle(color:Colors.black,fontSize:30)
                          ),
                        ),
                      ),
                      Container(
                          child: Row(
                        children: <Widget>[
                          Flexible(
                              child: new Text(
                                  "Quantas vezes por semana você pratica exercício físico?"))
                        ],
                      )),
                      Container(
                        child: DropdownButton<String>(
                            value: selectedprimeiro,
                            items: primeiro.map((prim) {
                              return DropdownMenuItem(
                                value: prim,
                                child: Text(prim),
                              );
                            }).toList(),
                            onChanged: (v) {
                              print(v);
                              setState(() {
                                selectedprimeiro = v;
                              });
                            }),
                      ),
                      Container(
                          child: Row(
                        children: <Widget>[
                          Flexible(
                              child: new Text(
                                  "No último mês, durante o horário de plantão quantos dias você foi instruído a realizar exercício físico para melhorar a performance?"))
                        ],
                      )),
                      Container(
                        child: DropdownButton<String>(
                            value: selectedsegundo,
                            items: segundo.map((est) {
                              return DropdownMenuItem(
                                value: est,
                                child: Text(est),
                              );
                            }).toList(),
                            onChanged: (v) {
                              print(v);
                              setState(() {
                                selectedsegundo = v;
                              });
                            }),
                      ),
                      Container(
                          child: Row(
                        children: <Widget>[
                          Flexible(
                              child: new Text(
                                  "Como você classifica as orientações sobre exercício físico no seu posto de trabalho?"))
                        ],
                      )),
                      Container(
                        child: DropdownButton<String>(
                            isExpanded: true,
                            value: selectedterceiro,
                            items: terceiro.map((cid) {
                              return DropdownMenuItem(
                                value: cid,
                                child: Text(cid),
                              );
                            }).toList(),
                            onChanged: (v) {
                              print(v);
                              setState(() {
                                selectedterceiro = v;
                              });
                            }),
                      ),
                      RaisedButton(
                          child: Text('Salvar'),
                          onPressed: () {
                            if (nameInputController.text.isNotEmpty) {
                              Firestore.instance
                                  .collection("users")
                                  .document(widget.uid)
                                  .collection('Cadastro')
                                  .add({
                                    'name': nameInputController.text,
                                    'sexo': selectedvalue,
                                    'data de nascimento': selecteddata,
                                    'peso': pesoInputController.text,
                                    'estatura': estaturaInputController.text,
                                    'profissao': selectedprof,
                                    'Data de admissao': selecteddataadmissao,
                                    'Posto ou graduacao': selectedgrad,
                                    'Está lotado em:': selectedlotado,
                                    'Estado': selectedestado,
                                    'Cidade': selectedcidade,
                                    'Quantas vezes por semana você pratica exercício físico?':
                                        selectedprimeiro,
                                    'No último mês, durante o horário de plantão quantos dias você foi instruído a realizar exercício físico para melhorar a performance?':
                                        selectedsegundo,
                                    'Como você classifica as orientações sobre exercício físico no seu posto de trabalho?':
                                        selectedterceiro,
                                  })
                                  .then((result) => {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomePage(
                                                      title: nameInputController
                                                              .text +
                                                          "'s Tasks",
                                                      uid: currentUser.uid,
                                                    )),
                                            (_) => false),
                                      })
                                  .catchError((err) => print(err));
                            }
                          })
                    ])))));
  }
}
