

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'coretrainingpage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title, this.uid}) : super(key: key); //update this to include the uid in the constructor
  final String title;
  final String uid; //include this

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* TextEditingController taskTitleInputController;
  TextEditingController taskDescripInputController;*/
   FirebaseUser currentUser; 

  @override
  initState() {
   /*  taskTitleInputController = new TextEditingController();
    taskDescripInputController = new TextEditingController(); */
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    currentUser = await FirebaseAuth.instance.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          FlatButton(
            child: Text('Log Out'),
            textColor: Colors.white,
            onPressed: () {
              FirebaseAuth.instance
                  .signOut()
                  .then((result) =>
                      Navigator.pushReplacementNamed(context, '/login'))
                  .catchError((err) => print(err));
            },
          )
        ],
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
                      
              children: <Widget>[

                RaisedButton(
                  child: const Text('Core Training'),
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => CoreTrainingPage(uid: currentUser.uid,)
                      )
                      );
                    }
                  ),

                RaisedButton(
                  child: Text('Relatorio de treino'),
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => CoreTrainingPage()
                      )
                      );
                    }
                  ),

                RaisedButton(
                  child: Text('Configurações'),
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => CoreTrainingPage()
                      )
                      );
                    }
                  ),

                RaisedButton(
                  child: Text('Contato'),
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => CoreTrainingPage()
                      )
                      );
                    }
                  ),

                RaisedButton(
                  child: Text('Sobre'),
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => CoreTrainingPage()
                      )
                      );
                    }
                  ), 

                RaisedButton(
                  child: Text('Sair'),
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => CoreTrainingPage()
                      )
                      );
                    }
                  )         
                ]
              )
            )
          )
        );
      }
    }
  