import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:app/fisicosignup.dart';


class ProfissionalSignup extends StatefulWidget {
  @override
  _ProfissionalSignup createState() => new _ProfissionalSignup();
}

class _ProfissionalSignup extends State<ProfissionalSignup> { //estado  
  DateTime _data = new DateTime.now(); // instance of DateTime
  var selectedvalue = 'Selecione';
  var selectedgrad = 'Selecione';
  List<String> users = ['Selecione','Bombeiro Militar','Policia Militar'];
  List<String> graduacao = ['Selecione','Soldado 2ª classe','Cadete','Soldado 1ª classe'];
  var selectedlotado = 'Selecione';
  List<String> lot = ['Selecione','Cargo Administrativo','Cargo Operacional'];
  var selectedestado = 'Selecione';
  List<String> estado = ['Selecione','Cargo Administrativo','Cargo Operacional'];
  var selectedcidade = 'Selecione';
  List<String> cidade = ['Selecione','Cargo Administrativo','Cargo Operacional'];
 @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body:Container(
        padding: EdgeInsets.only(top: 10,left: 40,right: 40),
        color :Colors.white,
        child: ListView(
          children: <Widget>[
            
           Container(
                child:DropdownButton<String>(
                  items: users.map((user) {
                    return DropdownMenuItem(
                      value: user,
                      child: Text(user),
                    );
                  }).toList(),
                  value:selectedvalue,
                  onChanged: (v) {
                    print(v);
                    setState((){
                      selectedvalue = v;
                    });
                  },
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


            Container(
              child: InputDecorator(
                child:DropdownButton<String>(
                  value:selectedgrad,
                  items: graduacao.map((grad) {
                    return DropdownMenuItem(
                      value: grad,
                      child: Text(grad),
                    );
                  }).toList(),
                  onChanged: (v) {
                    print(v);
                    setState((){
                      selectedgrad = v;
                    });
                  }
                ),
                decoration: new InputDecoration(
                   labelText: "Posto ou graduação",
                   labelStyle: TextStyle(color:Colors.black,fontSize:30)
                ),
              ),
            ),

            Container(
              child: InputDecorator(
                child:DropdownButton<String>(
                  value:selectedlotado,
                  items: lot.map((lotado) {
                    return DropdownMenuItem(
                      value: lotado,
                      child: Text(lotado),
                    );
                  }).toList(),
                  onChanged: (v) {
                    print(v);
                    setState((){
                      selectedlotado = v;
                    });
                  }
                ),
                decoration: new InputDecoration(
                   labelText: "Você está lotado em :",
                   labelStyle: TextStyle(color:Colors.black,fontSize:30)
                ),
              ),
            ),

            Container(
              child: InputDecorator(
                child:DropdownButton<String>(
                  value:selectedestado,
                  items: estado.map((est) {
                    return DropdownMenuItem(
                      value: est,
                      child: Text(est),
                    );
                  }).toList(),
                  onChanged: (v) {
                    print(v);
                    setState((){
                      selectedestado = v;
                    });
                  }
                ),
                decoration: new InputDecoration(
                   labelText: "Estado:",
                   labelStyle: TextStyle(color:Colors.black,fontSize:30)
                ),
              ),
            ),

            Container(
              child: InputDecorator(
                child:DropdownButton<String>(
                  value:selectedcidade,
                  items: cidade.map((cid) {
                    return DropdownMenuItem(
                      value: cid,
                      child: Text(cid),
                    );
                  }).toList(),
                  onChanged: (v) {
                    print(v);
                    setState((){
                      selectedcidade = v;
                    });
                  }
                ),
                decoration: new InputDecoration(
                   labelText: "Cidade:",
                   labelStyle: TextStyle(color:Colors.black,fontSize:30)
                ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute<CupertinoDynamicColor>(
                          builder: (context) =>FisicoSignup(),
                        ),
                      );
                    },
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  } 
}