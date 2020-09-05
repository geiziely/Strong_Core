import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/signupcheckbox.dart';



class FisicoSignup extends StatefulWidget {
  @override
  _FisicoSignup createState() => new _FisicoSignup();
}

class _FisicoSignup extends State<FisicoSignup> { //segundo  

  var selectedprimeiro = 'Selecione';
  List<String> primeiro = ['Selecione',
                            'Não pratico',
                            'Uma vez por semana',
                            'Duas vezes por semana',
                            'Três vezes por semana',
                            'Quatro dias por semana',
                            'Cinco vezes por semana ou mais'];
  var selectedsegundo = 'Selecione';
  List<String> segundo = [ 'Selecione',
                            'Nenhum dia',
                            'Um dia',
                            'Dois dias',
                            'Três dias',
                            'Quatro dias',
                            'Cinco dias',
                            'Seis dias',
                            'Sete dias ou mais'];
  var selectedterceiro = 'Selecione';
  List<String> terceiro = ['Selecione',
                            'Não recebo, e considero desnecessária essa informação para o meu trabalho',
                            'Não recebo, mas considero essa informação importante para meu trabalho',
                            'Recebo, mas considero desnecessária essa informação para o meu trabalho',
                            'Recebo, e considero essa informação importante para meu trabalho',
                            'Recebo, mas as informações passadas não auxiliam no meu trabalho'];
 @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body:Container(
        padding: EdgeInsets.only(top: 10,left: 40,right: 40),
        color :Colors.white,
        child: ListView(
          children: <Widget>[
          
          Container(
            child: Row(
              children: <Widget>[
                Flexible(
                  child: new Text("Quantas vezes por semana você pratica exercício físico?"))
                ],
        )
        ),


           Container(
              //child: InputDecorator(
                child:DropdownButton<String>(
                  value:selectedprimeiro,
                  items: primeiro.map((prim) {
                    return DropdownMenuItem(
                      value: prim,
                      child: Text(prim),
                    );
                  }).toList(),
                  onChanged: (v) {
                    print(v);
                    setState((){
                      selectedprimeiro = v;
                    });
                  }
                ),
                //decoration: new InputDecoration(
                   //labelText: "Quantas vezes por semana você pratica exercício físico?",
                   //labelStyle: TextStyle(color:Colors.black,fontSize:30)
                //),
              //),
            ),


            Container(
            child: Row(
              children: <Widget>[
                Flexible(
                  child: new Text("No último mês, durante o horário de plantão quantos dias você foi instruído a realizar exercício físico para melhorar a performance?"))
                ],
              )
              ),

             Container(
              //child: InputDecorator(
                child:DropdownButton<String>(
                  value:selectedsegundo,
                  items: segundo.map((est) {
                    return DropdownMenuItem(
                      value: est,
                      child: Text(est),
                    );
                  }).toList(),
                  onChanged: (v) {
                    print(v);
                    setState((){
                      selectedsegundo = v;
                    });
                  }
                ),
                /* decoration: new InputDecoration(
                   labelText: "segundo:",
                   labelStyle: TextStyle(color:Colors.black,fontSize:30) */
                //),
              //),
            ),

            
            Container(
            child: Row(
              children: <Widget>[
                Flexible(
                  child: new Text("Como você classifica as orientações sobre exercício físico no seu posto de trabalho?"))
                ],
              )
              ),

            Container(
              //child: InputDecorator(
                child:DropdownButton<String>(
                  isExpanded: true,
                  value:selectedterceiro,
                  items: terceiro.map((cid) {
                    return DropdownMenuItem(
                      value: cid,
                      child: Text(cid),
                    );
                  }).toList(),
                  onChanged: (v) {
                    print(v);
                    setState((){
                      selectedterceiro = v;
                    });
                  }
                ),
                /* decoration: new InputDecoration(
                   labelText: "terceiro:",
                   labelStyle: TextStyle(color:Colors.black,fontSize:30)
                ),
              ), */
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
                          builder: (context) =>SignupCheckBox(),
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