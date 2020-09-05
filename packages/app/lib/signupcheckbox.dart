import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/fisicosignup.dart';
import 'package:app/boneco.dart';

class SignupCheckBox extends StatefulWidget {
  @override
  _SignupCheckBox createState() => new _SignupCheckBox();
}

class _SignupCheckBox extends State<SignupCheckBox> {
  //estado

  var selecteddormiu = 'Selecione';
  List<String> dormiu = [
    'Selecione',
    'Nenhum dia.',
    'Um dia.',
    'Dois dias.',
    'Três dias.',
    'Quatro dias.',
    'Cinco dias.',
    'Seis dias.',
    'Todos os dias.'
  ];

  String selectedestresse;
  List<String> estresse = [
    'Selecione',
    'Nenhum estresse.',
    'Estresse abaixo do normal.',
    'Estresse normal.',
    'Estresse acima do normal.',
    'Estresse bastante elevado.'
  ];

  bool _sel = false;
  bool monVal = false;
  bool tuVal = false;
  bool wedVal = false;
  bool thurVal = false;
  bool friVal = false;
  bool satVal = false;
  bool sunVal = false;

  Widget checkbox(String title, bool boolValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            /// manage the state of each value
            setState(() {
              switch (title) {
                case "Dores osteomusculares":
                  monVal = value;
                  break;
                case "Entorse articular":
                  tuVal = value;
                  break;
                case "Fratura óssea":
                  wedVal = value;
                  break;
                case "Enxaqueca":
                  thurVal = value;
                  break;
              }
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Colors.white,
        child: ListView(children: <Widget>[
          Container(
              child: Row(
            children: <Widget>[
              Flexible(
                  child: new Text(
                      "Nos últimos 12 meses Algum profissional diagnosticou em você alguns desses problemas de saúde?"))
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              checkbox("Dores osteomusculares", monVal),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              checkbox("Entorse articular", satVal),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              checkbox("Fratura óssea", satVal),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              checkbox("Enxaqueca", satVal),
            ],
          ),
          Container(
              child: Row(
            children: <Widget>[
              Flexible(
                  child: new Text(
                      "Nos últimos 7 dias quantos dias você dormiu o suficiente, sentindo-se descansado pela manhã?"))
            ],
          )),
          Container(
            child: DropdownButton<String>(
                value: selecteddormiu,
                items: dormiu.map((prim) {
                  return DropdownMenuItem(
                    value: prim,
                    child: Text(prim),
                  );
                }).toList(),
                onChanged: (v) {
                  print(v);
                  setState(() {
                    selecteddormiu = v;
                  });
                }),
          ),
          Container(
              child: Row(
            children: <Widget>[
              Flexible(
                  child: new Text(
                      "Nos últimos 6 meses como você classifica o seu estresse geral?"))
            ],
          )),
          Container(
            child: DropdownButton<String>(
                hint: Text('Selecione'),
                onChanged: (String changedValue) {
                  selectedestresse = changedValue;
                  setState(() {
                    selectedestresse;
                    print(selectedestresse);
                  });
                },
                value: selectedestresse,
                items: estresse.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList()),
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

            child: SizedBox.expand(
              // toma todo o conteudo do caontainer
              child: FlatButton(
                child: Row(
                  // row :as palavras vão ser escritas na horizontal em columm na vertical
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // alinhamento do intens e o space é para separar as palavras dentro do botao
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
                      builder: (context) => Boneco(),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
