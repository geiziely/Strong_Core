import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cadastro.dart';
import 'package:app/home.dart';

import 'package:date_format/date_format.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController firstNameInputController;
  TextEditingController lastNameInputController;
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;
  TextEditingController sexoInputController;

  
  var selectedvalue = 'sexo';
  List<String> users = ['sexo','feminino','masculino'];
  DateTime selecteddata = new DateTime.now(); 
  

  @override
  initState() {
    firstNameInputController = new TextEditingController();
    lastNameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
    sexoInputController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex =  RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 3) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Form(
                  key: _registerFormKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'First Name*', hintText: "John"),
                        controller: firstNameInputController,
                        validator: (String value){
                          if (value.length < 3) {
                            return 'Inserir nome valido.';
                          }
                        },
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Last Name*', hintText: "Doe"),
                          controller: lastNameInputController,
                          validator: (value){
                            if (value.length < 3) {
                              return 'Inserir sobrenome valido.';
                            }
                      }),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Email*', hintText: 'john.doe@gmail.com'),
                        controller: emailInputController,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                      ),
                      
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Senha*', hintText: '********'),
                        controller: pwdInputController,
                        obscureText: true,
                        validator: pwdValidator,
                      ),
                     
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Confirmar senha*', hintText: "********"),
                        controller: confirmPwdInputController,
                        obscureText: true,
                        validator: pwdValidator,
                      ),
                      

                      
  
                      RaisedButton(
                        child: Text("Registrar"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          if (_registerFormKey.currentState.validate()) {
                            if (pwdInputController.text ==
                                confirmPwdInputController.text) {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: emailInputController.text,
                                      password: pwdInputController.text)
                                  .then((currentUser) => Firestore.instance
                                      .collection('users')
                                      .document(currentUser.user.uid)
                                      .setData({
                                        'uid': currentUser.user.uid,
                                        'fname':firstNameInputController.text,
                                        'surname': lastNameInputController.text,
                                        'email': emailInputController.text,
                                        'sexo' : selectedvalue,
                                        'data de nascimento' : selecteddata
                                      })
                                      .then((result) => {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>Cadastro(
                                                      title:
                                                          firstNameInputController
                                                                  .text +
                                                              "'s Tasks",
                                                      uid: currentUser.user.uid,
                                                    )),
                                            (_) => false),
                                            firstNameInputController.clear(),
                                            lastNameInputController.clear(),
                                            emailInputController.clear(),
                                            pwdInputController.clear(),
                                            confirmPwdInputController.clear(),
                                            selectedvalue = null
                                      })
                                      .catchError((dynamic err) => print(err)))
                                  .catchError((dynamic err) => print(err));
                            } else {
                              showDialog<dynamic>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Erro!"),
                                      content: Text("Senhas não conferem"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Fechar"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  });
                            }
                          }
                        },
                      ),
                      Text("Já tem uma conta?"),
                      FlatButton(
                        child: Text("Entre aqui!"),
                        onPressed: () {
                          Navigator.pop(context);
                          print("ola registered");
                        },
                      )
                    ],
                  ),
                ))));
      }
    }