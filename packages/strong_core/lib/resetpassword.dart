import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: ()=>Navigator.pop(context,false), // faz o botão da seta desmanchar a paginae voltar pra outra pagina
        )
        ),
        body: Container(
          padding: EdgeInsets.only(
            top: 60,
            left: 40,
            right: 40,
          ),
          color: Colors.white,
          child:ListView(
            children:<Widget>[
              SizedBox(
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Esqueceu sua senha?",
                style: TextStyle(
                  fontSize:32,
                  fontWeight: FontWeight.w500, //espessura da fonte
                ),
                textAlign:TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Informe o e-mail para recuperar a senha gggggggggggg tttttttttttt yyyyyyyyyy rrrrrrrrrr",
                style: TextStyle(
                  fontSize:16,
                  fontWeight: FontWeight.w500, //espessura da fonte
                ),
                textAlign:TextAlign.center,
              ),
              SizedBox(
                height:10,
              ),
              
              TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(color:Colors.black, fontSize:20),//refere-se a caixa de digitação
              decoration: InputDecoration( // refere-se ao subtitulo email
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color:Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  ),
              ),
            ),
              SizedBox(
                height:10,
              ),

              Container(
              height: 40,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color:Colors.blue,
              ),
              child: SizedBox.expand(
                child:FlatButton(
                  child: Text(
                  "Enviar",
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                    color:Colors.white,
                    fontSize:20,
                  ),
                  textAlign: TextAlign.left,
                ),
                onPressed: () {  },
              ),
              )
              ),
              SizedBox(
                height:10,
              ),

            ],
          ),
        ),
    );
  }
}