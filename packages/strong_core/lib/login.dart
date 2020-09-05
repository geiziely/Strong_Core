
import 'package:app/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/resetpassword.dart';
import 'package:app/auth.dart';



class LoginPage extends StatefulWidget { //com 
  LoginPage({this.auth,this.onSignedIn}); // inicia o parametro auth em Login
  final BaseAuth auth; // outro parametro da classe abstrata auth
  final VoidCallback onSignedIn;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

enum FormType{
  login,
  register
}

class _LoginPageState extends State<LoginPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final GoogleSignIn googleSignIn = GoogleSignIn();

  
  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    } 
      return false;
  } 
  
  void validateAndSubmit()async{
    if (validateAndSave()) {
      try{
        if( _formType == FormType.login){
        String userId = await widget.auth.signInWithEmailAndPassword(_email, _password); 
        //AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password:_password);
        
        print('Signed in : ');
        }else {
          String userId = await widget.auth.createUserWithEmailAndPassword(_email, _password); 
          //AuthResult user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email:_email, password: _password);
          print('Registered user:');
        }
        widget.onSignedIn(); // vai mandar um sinal para o root se a pessoa logou ou se cadastrou
      }
      catch (e){
        print('Error: $e');
      }
    }
  }


  void moveToLogin(){
      setState(() {
       _formType = FormType.login; 
      });
     }

     void moveToRegister(){
      setState(() {
       _formType = FormType.register; 
      });
    }

  @override
    Widget build(BuildContext context) {
      return Scaffold( // não deixa o teclado sobrepor 
        backgroundColor: Colors.blue, // cor do fundo
        body: Padding( // espaçamento de fora como se fosse a borda
          padding: EdgeInsets.all(30), // o tamanho do espaçamento
            child: ListView(
              children: <Widget>[
                Form(
                  key: formKey,
                  child: Column(
                    children:buildInputs()+buildSubmitButtons(),            
                  ),
                ),
              ]
            ),
          ),     
        );
    }

    List <Widget> buildInputs(){
      return[
        TextFormField(
          //keyboardType: TextInputType.text,
          autofocus: true, // já foca no texto quando iniciar
          style: new TextStyle(color:Colors.white, fontSize:20),
          decoration: InputDecoration(
              labelText: "E-mail",
              labelStyle: TextStyle(color:Colors.white), 
          ),
          validator: (value) => value.isEmpty ? 'Email está vazio':null,
          onSaved: (value) => _email = value,
        ),
        
        TextFormField(
          keyboardType: TextInputType.text,
          autofocus: true, // já foca no texto quando iniciar
          obscureText: true,
          style: new TextStyle(color:Colors.white, fontSize:20),
          decoration: InputDecoration(
              labelText: "senha",
              labelStyle: TextStyle(color:Colors.white)
          ),
          validator: (value) => value.isEmpty ? 'Campo senha está vazio':null,
          onSaved: (value)=> _password = value,               
          
        ),
      ];
    }
    List<Widget> buildSubmitButtons(){
      if(_formType == FormType.login){
        return [
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
                        "Login",
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                          ),
                    ]
                  ),
                  onPressed: validateAndSubmit,
                ),
              ),
          ),
                  
                      
          Container(
            height: 40,
            alignment: Alignment.centerRight,
            child: FlatButton(
              child: Text(
                "Cadastrar",
                textAlign: TextAlign.right,
              ),
              onPressed: moveToRegister,
            ),
          ),

          Container(
            height: 40,
            alignment: Alignment.centerLeft,
            child: FlatButton(
              child: Text(
                "Recuperar Senha",
                textAlign: TextAlign.left,
              ),
              onPressed: () { }
            ),
          ),
        ];
      
      } else {
        return [
          FlatButton(
            child: Row( // row :as palavras vão ser escritas na horizontal em columm na vertical
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // alinhamento do intens e o space é para separar as palavras dentro do botao
              children: <Widget>[
                Text(
                  "Login",
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20
                ),
                textAlign: TextAlign.left,
                    ),
              ]
            ),
            onPressed: validateAndSubmit,
          ),
          FlatButton(
            child: Row( // row :as palavras vão ser escritas na horizontal em columm na vertical
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // alinhamento do intens e o space é para separar as palavras dentro do botao
              children: <Widget>[
                Text(
                  "Cadastrar",
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
                    ),
              ]
            ),
            onPressed: moveToLogin,
          ),
        ];
      }
    }
}

    

                

