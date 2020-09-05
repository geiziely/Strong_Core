/* import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/login.dart';
import 'package:app/auth.dart';
import 'package:app/home.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Root extends StatefulWidget {
  Root({this.auth,this.title, this.uid});
  final BaseAuth auth;
  final String title;
  final String uid;

  @override
  State<StatefulWidget> createState() => _RootState(); 
  
}

enum AuthStatus{
  notSignedIn,
  signedIn
}

class _RootState extends State<Root>{

  TextEditingController taskTitleInputController;
  TextEditingController taskDescripInputController;
  FirebaseUser currentUser;

  AuthStatus authStatus = AuthStatus.notSignedIn;

  initState() {
    super.initState();
    widget.auth.currentUser().then((userId){  //widget da para acessa o auth de qualquer lugar
      setState(() {
        authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn; // checa o estado do ususario agora quando inicia o app.
        //authSatus recebe userId se for igual a null é notSignedIn caso contratrio signedIn     
      });
    });
    taskTitleInputController = new TextEditingController();
    taskDescripInputController = new TextEditingController();
    this.getCurrentUser();
  }

  void getCurrentUser() async {
    currentUser = await FirebaseAuth.instance.currentUser();
  }

  void _signedIn(){
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut(){
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus){
      case AuthStatus.notSignedIn:
        return new LoginPage(
          auth:widget.auth,
          onSignedIn: _signedIn
        );
      case AuthStatus.signedIn:
        return Home(
          auth:widget.auth,
          onSignedOut: _signedOut,
        ); 
    }
  }
} */