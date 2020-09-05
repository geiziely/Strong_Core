import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:app/profissionalsignup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';


class Signup extends StatefulWidget {
  @override
  _Signup createState() => _Signup();
 
}

enum FormType{
  login,
  register
}

class _Signup extends State<Signup> { //estado

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  var selectedvalue = 'sexo';
  List<String> users = ['sexo','feminino','masculino'];
  DateTime _data = new DateTime.now(); // instance of DateTime
  
  final formKey = new GlobalKey<FormState>();
  
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  String _email;
  String _password;
  FormType _formType = FormType.login;
 
  bool validateAndSave(){
    final form = formKey.currentState;

    if(form.validate()){
      form.save();
      print('Formulario é valido, email:$_email, paswword: $_password');
      return true;
    } 
      return false;
  }
   

    Future validateAndSubmit()async{
      if (validateAndSave()){
        try{
          if(_formType == FormType.login){
          AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password:_password);
          
          print('Signed in : ');
          }else {
            AuthResult user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
            print('Registered user:');
          }
        }
        catch (e){
          print('Error: $e');
        }
      }
    }

    void moveToRegister(){
      setState(() {
       _formType = FormType.register; 
      });
    }

    
    void moveToLogin(){
      setState(() {
       _formType = FormType.login; 
      });
    } 

 @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body:Container(
        padding: EdgeInsets.only(top: 10,left: 40,right: 40),
        color :Colors.white,
        child: ListView(
          children: <Widget>[
          Form(
            key:formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  style: new TextStyle(color:Colors.black, fontSize:20),
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(color:Colors.black,fontWeight: FontWeight.w500)
                  ),
                ),
            
            TextFormField(
              keyboardType: TextInputType.text,
              style: new TextStyle(color:Colors.black, fontSize:20),
              decoration: InputDecoration(
                labelText: "Sobrenome",
                labelStyle: TextStyle(color:Colors.black)
              ),
            ),

            TextFormField(
              keyboardType: TextInputType.text,
              style: new TextStyle(color:Colors.black, fontSize:20),
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(color:Colors.black)
              ),
              /* validator: (value) => value.isEmpty ? 'Email está vazio':null,
              onSaved: (value) => _email = value, */
           ),

           TextFormField(
              keyboardType: TextInputType.text,
              style: new TextStyle(color:Colors.black, fontSize:20),
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(color:Colors.black)
              ),
              validator: (value) => value.isEmpty ? 'Campo senha está vazio':null,
              onSaved: (value)=> _password = value,
           ),


            Container( //--------
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child:DropdownButton<String>(
                      value:selectedvalue,
                      items: users.map((user) {
                      return DropdownMenuItem(
                        value: user,
                        child: Text(user),
                      );
                      }).toList(),
                      onChanged: (value) {
                        print(value);
                        setState((){
                          selectedvalue = value;
                        });
                      }
                    ),
                  ),

                  Container(
                    child:FlatButton(
                      child:new Row(
                        children:<Widget>[
                          new Text(
                          '${formatDate(_data, [dd,'/',mm, '/',yyyy])}',
                            style:new TextStyle(color: Colors.black,fontSize: 20), 
                          ),
                        new Icon(Icons.calendar_today),
                        ]
                      ),
                      onPressed: () async{
                        final dtPick= await showDatePicker(
                          context: context,
                          initialDate: new DateTime.now(),
                          firstDate: new DateTime(1900),
                          lastDate: new DateTime(2100)
                        );
                        if(dtPick!=null && dtPick!=_data){
                          setState(() {
                            _data = dtPick;
                        });
                        }
                      }
                    ),
                  ),
                ],
              ),
            ),
            
            TextFormField(
              keyboardType: TextInputType.text,
              style: new TextStyle(color:Colors.black, fontSize:20),
              decoration: InputDecoration(
                labelText: "Peso",
                labelStyle: TextStyle(color:Colors.black)
              ),
            ),

            TextFormField(
              keyboardType: TextInputType.text,
              style: new TextStyle(color:Colors.black, fontSize:20),
              decoration: InputDecoration(
                labelText: "Estatura",
                labelStyle: TextStyle(color:Colors.black)
              ),
           ),

            Container(
              height: 60, //altura do container
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color(0xFF3C5A99),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
                
                child: SizedBox.expand(  // toma todo o conteudo do caontainer
                  child: FlatButton(
                    child: Row( // row :as palavras vão ser escritas na horizontal em columm na vertical
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // alinhamento do intens e o space é para separar as palavras dentro do botao
                      children: <Widget>[
                        Text(
                          "Seguir",
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                            ),
                        ],
                    ),
                    onPressed: () {
                      validateAndSave();
                      Navigator.push(
                        context,
                        MaterialPageRoute<CupertinoDynamicColor>(
                          builder: (context) =>ProfissionalSignup(),
                        ),
                      );
                      
                    },
                  ),
                ),
            ),
          ],
        ), 
      ),
          ]
      )
    )
    ); 
  }
}