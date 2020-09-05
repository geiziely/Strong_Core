import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:app/relatorio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class Corpo extends StatefulWidget {
  Corpo({Key key, this.semana, this.dia, this.uid})
      : super(key: key); //variaveis que vai receber
  int semana;
  String uid;
  int dia;

  @override
  State<StatefulWidget> createState() => new _CorpoState();
}

class _CorpoState extends State<Corpo> {
  @override
  GlobalKey _containerKey = GlobalKey();
  StorageReference storageReference = FirebaseStorage().ref();
  FirebaseUser currentUser;

  final List<String> _dropdownValues = [
    'Nenhum desconforto/dor',
    'Algum desconforto/dor',
    'Moderado desconforto/dor',
    'Bastante desconforto/dor',
    'Intolerável desconforto/dor',
  ];

  List<String> _checked = [];

  bool loading = false;

  bool zerobranco = true;
  bool umbranco = true;
  bool doisbranco = true;
  bool tresbranco = true;
  bool quatrobranco = true;
  bool cincobranco = true;
  bool seisbranco = true;
  bool seteleftbranco = true;
  bool seterightbranco = true;

  bool oitoleftbranco = true;
  bool oitorightbranco = true;

  bool noveleftbranco = true;
  bool noverightbranco = true;

  bool dezleftbranco = true;
  bool dezrightbranco = true;

  bool onzeleftbranco = true;
  bool onzerightbranco = true;

  bool dozerightbranco = true;
  bool dozeleftbranco = true;

  bool trezeleftbranco = true;
  bool trezerightbranco = true;

  bool quaztleftbranco = true;
  bool quazrightbranco = true;

  bool quinleftbranco = true;
  bool quinrightbranco = true;

  bool deseisleftbranco = true;
  bool deseisrightbranco = true;

  bool _sel = false;
  bool priVal = false;
  bool segVal = false;
  bool terVal = false;
  bool quarVal = false;
  bool friVal = false;
  bool satVal = false;
  bool sunVal = false;
  bool quiVal = false;

  void convertWidgetToImage() async {
    RenderRepaintBoundary renderRepaintBoundary =
        _containerKey.currentContext.findRenderObject();
    ui.Image boxImage = await renderRepaintBoundary.toImage(pixelRatio: 1);
    ByteData byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uInt8List = byteData.buffer.asUint8List();
    this.setState(() {
      loading = true;
    });
    StorageUploadTask storageUploadTask = storageReference
        .child(
            "${widget.uid}/IMG_${widget.semana}/${widget.dia}.png") //modifica o local no firebase
        .putData(uInt8List);

    await storageUploadTask.onComplete;
    this.setState(() {
      loading = false;
    });
  }

  muda(bool newValue, String atualiza) {
    setState(() {
      if (atualiza == 'zerobranco') {
        zerobranco = newValue;
      }
      if (atualiza == 'umbranco') {
        umbranco = newValue;
      }
      if (atualiza == 'doisbranco') {
        doisbranco = newValue;
      }
      if (atualiza == 'tresbranco') {
        tresbranco = newValue;
      }
      if (atualiza == 'quatrobranco') {
        quatrobranco = newValue;
      }
      if (atualiza == 'cincobranco') {
        cincobranco = newValue;
      }
      if (atualiza == 'seisbranco') {
        seisbranco = newValue;
      }
      if (atualiza == 'seteleftbranco') {
        seteleftbranco = newValue;
      }
      if (atualiza == 'seterightbranco') {
        seterightbranco = newValue;
      }
      if (atualiza == 'oitoleftbranco') {
        oitoleftbranco = newValue;
      }
      if (atualiza == 'oitorightbranco') {
        oitorightbranco = newValue;
      }
      if (atualiza == 'noveleftbranco') {
        noveleftbranco = newValue;
      }
      if (atualiza == 'noverightbranco') {
        noverightbranco = newValue;
      }
      if (atualiza == 'dezleftbranco') {
        dezleftbranco = newValue;
      }
      if (atualiza == 'dezrightbranco') {
        dezrightbranco = newValue;
      }
      if (atualiza == 'onzeleftbranco') {
        onzeleftbranco = newValue;
      }
      if (atualiza == 'onzerightbranco') {
        onzerightbranco = newValue;
      }
      if (atualiza == 'dozerightbranco') {
        onzerightbranco = newValue;
      }
      if (atualiza == 'dozelefttbranco') {
        onzerightbranco = newValue;
      }
      if (atualiza == 'trezerightbranco') {
        onzerightbranco = newValue;
      }

      if (atualiza == 'quazrightbranco') {
        onzerightbranco = newValue;
      }
      if (atualiza == 'quaztleftbranco') {
        onzerightbranco = newValue;
      }
      if (atualiza == 'quinrightbranco') {
        onzerightbranco = newValue;
      }
      if (atualiza == 'quinleftbranco') {
        onzerightbranco = newValue;
      }
      if (atualiza == 'deseisrightbranco') {
        onzerightbranco = newValue;
      }
      if (atualiza == 'deseisleftbranco') {
        onzerightbranco = newValue;
      }
    });
  }

  _displayDialog(BuildContext context, String parteCorpo) async {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(// StatefulBuilder
              builder: (context, setState) {
            return AlertDialog(
              title: Text('$parteCorpo'),
              actions: <Widget>[
                Container(
                  width: 400,
                  child: Column(children: <Widget>[
                    CheckboxGroup(
                      labels: <String>[
                        'Nenhum desconforto/dor',
                        'Algum desconforto/dor',
                        'Moderado desconforto/dor',
                        'Bastante desconforto/dor',
                        'Intolerável desconforto/dor',
                      ],
                      checked: _checked,
                      onChange: (bool isChecked, String label, int index) => print(
                          "isChecked: $isChecked   label: $label  index: $index"),
                      onSelected: (List selected) => setState(() {
                        if (selected.length > 1) {
                          selected.removeAt(0);
                          print('selected length  ${selected.length}');
                        } else {
                          print("only one");
                        }
                        _checked = selected;
                        print("$_checked");
                      }),
                    ),

                    /* CheckboxListTile(
                      value: priVal,
                      title: Text("Nenhum desconforto/dor"),
                      onChanged: (bool val) {
                        setState(() {
                          priVal = val;
                        });
                      },
                    ),
                    CheckboxListTile(
                      value: segVal,
                      title: Text("Algum desconforto/dor"),
                      onChanged: (bool val) {
                        setState(() {
                          segVal = val;
                        });
                      },
                    ),
                    CheckboxListTile(
                      value: terVal,
                      title: Text("Moderado desconforto/dor"),
                      onChanged: (bool val) {
                        setState(() {
                          terVal = val;
                        });
                      },
                    ),
                    CheckboxListTile(
                      value: quarVal,
                      title: Text("Bastante desconforto/dor"),
                      onChanged: (bool val) {
                        setState(() {
                          quarVal = val;
                        });
                      },
                    ),
                    CheckboxListTile(
                      value: quiVal,
                      title: Text("Intolerável desconforto/dor"),
                      onChanged: (bool val) {
                        setState(() {
                          quiVal = val;
                        });
                      },
                    ), */
                  ]),
                ),
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Firestore.instance
                        .collection('users')
                        .document('gmKjgCrUl7fYTvym0KAkgjCnc1z2')
                        .collection('Relatorios')
                        .document('Semana 1 ') //${widget.semana}
                        .collection('Dia1') //${widget.dia}
                        .document('Intensidade da dor')
                        .setData({'$parteCorpo': _checked}, merge: true);
                  },
                )
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RepaintBoundary(
              key: _containerKey,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                width: size.width - 50,
                height: size.height * 0.90,
                child: Stack(children: <Widget>[
                  Container(
                    child: Image.asset('assets/cabeca.jpg'),
                    alignment: Alignment(0.0, -0.92),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!zerobranco, 'zerobranco');
                          _displayDialog(context, 'Pescoço');
                        },
                        child: Image(
                            image: zerobranco
                                ? ExactAssetImage('assets/zerobranco.jpg')
                                : const ExactAssetImage(
                                    'assets/quatrobranco.jpg'))),
                    alignment: Alignment(0.0, -0.704),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!umbranco, 'umbranco');
                          _displayDialog(context, 'Regiao Cervical');
                        },
                        child: Image(
                            image: umbranco
                                ? ExactAssetImage('assets/umbranco.jpg')
                                : ExactAssetImage('assets/cincobranco.jpg'))),
                    alignment: Alignment(0.00, -0.63),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!seisbranco, 'seisbranco');
                          _displayDialog(context, 'Ombro');
                        },
                        child: Image(
                            image: seisbranco
                                ? ExactAssetImage('assets/seisbranco.png')
                                : ExactAssetImage('assets/quatrobranco.jpg'))),
                    alignment: Alignment(0.0, -0.57),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!doisbranco, 'doisbranco');
                          _displayDialog(context, 'Costas Superior');
                        },
                        child: Image(
                            image: doisbranco
                                ? ExactAssetImage('assets/doisbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(0.0, -0.475),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!tresbranco, 'tresbranco');
                          _displayDialog(context, 'Costas Médio');
                        },
                        child: Image(
                            image: tresbranco
                                ? ExactAssetImage('assets/tresbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(-0.008, -0.27),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!quatrobranco, 'quatrobranco');
                          _displayDialog(context, 'Costas Inferior');
                        },
                        child: Image(
                            image: quatrobranco
                                ? ExactAssetImage('assets/quatrobranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(-0.008, -0.165),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!cincobranco, 'cincobranco');
                          _displayDialog(context, 'Bacia');
                          //_displayDialog(context);
                        },
                        child: Image(
                            image: cincobranco
                                ? ExactAssetImage('assets/cincobranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(-0.008, 0.02),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!seteleftbranco, 'seteleftbranco');
                          _displayDialog(context, 'Braço esquerdo');
                        },
                        child: Image(
                            image: seteleftbranco
                                ? ExactAssetImage('assets/seteleftbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(-0.55, -0.4),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!seterightbranco, 'seterightbranco');
                          _displayDialog(context, 'Braço direito');
                        },
                        child: Image(
                            image: seterightbranco
                                ? ExactAssetImage('assets/seterightbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(0.55, -0.4),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!oitorightbranco, 'oitorightbranco');
                          _displayDialog(context, 'Cotovelo Direito');
                        },
                        child: Image(
                            image: oitorightbranco
                                ? ExactAssetImage('assets/oitorightbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(0.63, -0.270),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!oitoleftbranco, 'oitoleftbranco');
                          _displayDialog(context, 'Cotovelo esquerdo');
                        },
                        child: Image(
                            image: oitoleftbranco
                                ? ExactAssetImage('assets/oitoleftbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(-0.63, -0.27),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!noveleftbranco, 'noveleftbranco');
                          _displayDialog(context, 'Antebraço esquerdo');
                        },
                        child: Image(
                            image: noveleftbranco
                                ? ExactAssetImage('assets/noveleftbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(-0.68, -0.14),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!noverightbranco, 'noverightbranco');
                          _displayDialog(context, 'Antebraço direito');
                        },
                        child: Image(
                            image: noverightbranco
                                ? ExactAssetImage('assets/noverightbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(0.685, -0.14), //antebraço
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!dezleftbranco, 'dezleftbranco');
                          _displayDialog(context, 'Punho esquerdo');
                        },
                        child: Image(
                            image: dezleftbranco
                                ? ExactAssetImage('assets/dezleftbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(-0.8, -0.02),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!dezrightbranco, 'dezrightbranco');
                          _displayDialog(context, 'Punho direito');
                        },
                        child: Image(
                            image: dezrightbranco
                                ? ExactAssetImage('assets/dezrightbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(0.8, -0.02), //pulso dez
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!onzeleftbranco, 'onzeleftbranco');
                          _displayDialog(context, 'Mão esquerda');
                        },
                        child: Image(
                            image: onzeleftbranco
                                ? ExactAssetImage('assets/onzeleftbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(-0.86, 0.08),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!onzerightbranco, 'onzerightbranco');
                          _displayDialog(context, 'Mão direita');
                        },
                        child: Image(
                            image: onzerightbranco
                                ? ExactAssetImage('assets/onzerightbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(0.86, 0.1),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!dozerightbranco, 'dozerightbranco');
                          _displayDialog(context, 'Coxa direita');
                        },
                        child: Image(
                            image: dozerightbranco
                                ? ExactAssetImage('assets/dozerightbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(0.25, 0.34),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!dozeleftbranco, 'dozeleftbranco');
                          _displayDialog(context, 'Coxa esquerda');
                        },
                        child: Image(
                            image: dozeleftbranco
                                ? ExactAssetImage('assets/dozeleftbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(-0.25, 0.34),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!trezerightbranco, 'trezerightbranco');
                          _displayDialog(context, 'Joelho direito');
                        },
                        child: Image(
                            image: trezerightbranco
                                ? ExactAssetImage('assets/trezerightbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(0.23, 0.5),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!trezeleftbranco, 'trezeleftbranco');
                          _displayDialog(context, 'Joelho esquerdo');
                        },
                        child: Image(
                            image: trezeleftbranco
                                ? ExactAssetImage('assets/trezeleftbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(-0.23, 0.50),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!quazrightbranco, 'quazrightbranco');
                          _displayDialog(context, 'Perna direita');
                        },
                        child: Image(
                            image: quazrightbranco
                                ? ExactAssetImage('assets/quazrightbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(0.24, 0.805),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!quaztleftbranco, 'quaztleftbranco');
                          _displayDialog(context, 'Perna esquerda');
                        },
                        child: Image(
                            image: quaztleftbranco
                                ? ExactAssetImage('assets/quaztleftbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(-0.24, 0.80),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!quinrightbranco, 'quinrightbranco');
                          _displayDialog(context, 'Tornozelo direito');
                        },
                        child: Image(
                            image: quinrightbranco
                                ? ExactAssetImage('assets/quinrightbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(0.24, 0.91),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!quinleftbranco, 'quinleftbranco');
                          _displayDialog(context, 'Tornozelo esquerdo');
                        },
                        child: Image(
                            image: quinleftbranco
                                ? ExactAssetImage('assets/quinleftbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(-0.24, 0.91),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!deseisrightbranco, 'deseisrightbranco');
                          _displayDialog(context, 'Pé direito');
                        },
                        child: Image(
                            image: deseisrightbranco
                                ? ExactAssetImage(
                                    'assets/deseisrightbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(0.3, 0.99),
                  ),
                  Container(
                    child: GestureDetector(
                        onTap: () {
                          muda(!deseisleftbranco, 'deseisleftbranco');
                          _displayDialog(context, 'Pé esquerdo');
                        },
                        child: Image(
                            image: deseisleftbranco
                                ? ExactAssetImage('assets/deseisleftbranco.jpg')
                                : ExactAssetImage('assets/zerobranco.jpg'))),
                    alignment: Alignment(-0.29, 0.99),
                  )
                ]),
              ),
            ),
            SizedBox(height: 5.0),
            Container(
                alignment: Alignment(0.84, 0.2),
                child: MaterialButton(
                    color: Colors.deepOrange,
                    child: Text(
                      "Share",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      convertWidgetToImage();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Relatorio()));
                    }))
          ],
        ),
      ),
    );
  }
}
