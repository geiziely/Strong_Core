import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class Boneco extends StatefulWidget {
  @override
  _Boneco createState() => _Boneco();
}

class _Boneco extends State<Boneco> {
  bool _zerobranco = true;
  bool _umbranco = true;
  bool _doisbranco = true;
  bool _tresbranco = true;
  bool _quatrobranco = true;
  bool _cincobranco = true;
  bool _seisbranco = true;
  bool _seteleftbranco = true;
  bool _seterightbranco = true;

  bool _oitoleftbranco = true;
  bool _oitorightbranco = true;

  bool _noveleftbranco = true;
  bool _noverightbranco = true;

  bool _dezleftbranco = true;
  bool _dezrightbranco = true;

  bool _onzeleftbranco = true;
  bool _onzerightbranco = true;

  bool _dozerightbranco = true;
  bool _dozeleftbranco = true;

  bool _trezeleftbranco = true;
  bool _trezerightbranco = true;

  bool _quaztleftbranco = true;
  bool _quazrightbranco = true;

  bool _quinleftbranco = true;
  bool _quinrightbranco = true;

  bool _deseisleftbranco = true;
  bool _deseisrightbranco = true;

  void _mudazerobranco(bool newValue) {
    setState(() {
      _zerobranco = newValue;
    });
  }

  void _mudaum(bool newValue) {
    setState(() {
      _umbranco = newValue;
    });
  }

  void _mudadoisbranco(bool newValue) {
    setState(() {
      _doisbranco = newValue;
    });
  }

  void _mudatresbranco(bool newValue) {
    setState(() {
      _tresbranco = newValue;
    });
  }

  void _mudaquatrobranco(bool newValue) {
    setState(() {
      _quatrobranco = newValue;
    });
  }

  void _mudacincobranco(bool newValue) {
    setState(() {
      _cincobranco = newValue;
    });
  }

  void _mudaseisbranco(bool newValue) {
    setState(() {
      _seisbranco = newValue;
    });
  }

  void _mudaseteleftbranco(bool newValue) {
    setState(() {
      _seteleftbranco = newValue;
    });
  }

  void _mudaseterightbranco(bool newValue) {
    setState(() {
      _seterightbranco = newValue;
    });
  }

  void _mudaoitoleftbranco(bool newValue) {
    setState(() {
      _oitoleftbranco = newValue;
    });
  }

  void _mudaoitorightbranco(bool newValue) {
    setState(() {
      _oitorightbranco = newValue;
    });
  }

  void _mudanoveleftbranco(bool newValue) {
    setState(() {
      _noveleftbranco = newValue;
    });
  }

  void _mudanoverightbranco(bool newValue) {
    setState(() {
      _noverightbranco = newValue;
    });
  }

  void _mudadezleftbranco(bool newValue) {
    setState(() {
      _dezleftbranco = newValue;
    });
  }

  void _mudadezrightbranco(bool newValue) {
    setState(() {
      _dezrightbranco = newValue;
    });
  }

  void _mudaonzeleftbranco(bool newValue) {
    setState(() {
      _onzeleftbranco = newValue;
    });
  }

  void _mudaonzerightbranco(bool newValue) {
    setState(() {
      _onzerightbranco = newValue;
    });
  }

  void _mudadozeleftbranco(bool newValue) {
    setState(() {
      _dozeleftbranco = newValue;
    });
  }

  void _mudadozerightbranco(bool newValue) {
    setState(() {
      _dozerightbranco = newValue;
    });
  }

  void _mudatrezeleftbranco(bool newValue) {
    setState(() {
      _trezeleftbranco = newValue;
    });
  }

  void _mudatrezerightbranco(bool newValue) {
    setState(() {
      _trezerightbranco = newValue;
    });
  }

  void _mudaquaztleftbranco(bool newValue) {
    setState(() {
      _quaztleftbranco = newValue;
    });
  }

  void _mudaquatzrightbranco(bool newValue) {
    setState(() {
      _quazrightbranco = newValue;
    });
  }

  void _mudaquinleftbranco(bool newValue) {
    setState(() {
      _quinleftbranco = newValue;
    });
  }

  void _mudaquinrightbranco(bool newValue) {
    setState(() {
      _quinrightbranco = newValue;
    });
  }

  void _mudadeseisleftbranco(bool newValue) {
    setState(() {
      _deseisleftbranco = newValue;
    });
  }

  void _mudadeseisrightbranco(bool newValue) {
    setState(() {
      _deseisrightbranco = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(
        zerobranco: _zerobranco,
        umbranco: _umbranco,
        doisbranco: _doisbranco,
        tresbranco: _tresbranco,
        quatrobranco: _quatrobranco,
        cincobranco: _cincobranco,
        seisbranco: _seisbranco,
        seteleftbranco: _seteleftbranco,
        seterightbranco: _seterightbranco,
        oitoleftbranco: _oitoleftbranco,
        oitorightbranco: _oitorightbranco,
        noveleftbranco: _noveleftbranco,
        noverightbranco: _noverightbranco,
        dezleftbranco: _dezleftbranco,
        dezrightbranco: _dezrightbranco,
        onzeleftbranco: _onzeleftbranco,
        onzerightbranco: _onzerightbranco,
        dozerightbranco: _dozeleftbranco,
        dozeleftbranco: _dozerightbranco,
        trezeleftbranco: _trezeleftbranco,
        trezerightbranco: _trezerightbranco,
        quaztleftbranco: _quaztleftbranco,
        quazrightbranco: _quazrightbranco,
        quinleftbranco: _quinleftbranco,
        quinrightbranco: _quinrightbranco,
        deseisleftbranco: _deseisleftbranco,
        deseisrightbranco: _deseisrightbranco,
        mudaum: _mudaum,
        mudazerobranco: _mudazerobranco,
        mudadoisbranco: _mudadoisbranco,
        mudatresbranco: _mudatresbranco,
        mudaquatrobranco: _mudaquatrobranco,
        mudacincobranco: _mudacincobranco,
        mudaseisbranco: _mudaseisbranco,
        mudaseteleftbranco: _mudaseteleftbranco,
        mudaseterightbranco: _mudaseterightbranco,
        mudaoitoleftbranco: _mudaoitoleftbranco,
        mudaoitorightbranco: _mudaoitorightbranco,
        mudanoveleftbranco: _mudanoveleftbranco,
        mudanoverightbranco: _mudanoverightbranco,
        mudadezleftbranco: _mudadezleftbranco,
        mudadezrightbranco: _mudadezrightbranco,
        mudaonzeleftbranco: _mudaonzeleftbranco,
        mudaonzerightbranco: _mudaonzerightbranco,
        mudadozeleftbranco: _mudadozeleftbranco,
        mudadozerightbranco: _mudadozerightbranco,
        mudatrezeleftbranco: _mudatrezeleftbranco,
        mudatrezerightbranco: _mudatrezerightbranco,
        mudaquatzleftbranco: _mudaquaztleftbranco,
        mudaquatzrightbranco: _mudaquatzrightbranco,
        mudaquinleftbranco: _mudaquinleftbranco,
        mudaquinrightbranco: _mudaquinrightbranco,
        mudadeseisleftbranco: _mudadeseisleftbranco,
        mudadeseisrightbranco: _mudadeseisrightbranco,
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  TapboxB({
    Key key,
    this.umbranco = false,
    this.zerobranco = false,
    this.doisbranco = false,
    this.tresbranco = false,
    this.quatrobranco = false,
    this.cincobranco = false,
    this.seisbranco = false,
    this.seteleftbranco = false,
    this.seterightbranco = false,
    this.oitoleftbranco = false,
    this.oitorightbranco = false,
    this.noveleftbranco = false,
    this.noverightbranco = false,
    this.dezleftbranco = false,
    this.dezrightbranco = false,
    this.onzeleftbranco = false,
    this.onzerightbranco = false,
    this.dozerightbranco = false,
    this.dozeleftbranco = false,
    this.trezeleftbranco = false,
    this.trezerightbranco = false,
    this.quaztleftbranco = false,
    this.quazrightbranco = false,
    this.quinleftbranco = false,
    this.quinrightbranco = false,
    this.deseisleftbranco = false,
    this.deseisrightbranco = false,
    this.title,
    @required this.mudaum,
    @required this.mudazerobranco,
    @required this.mudadoisbranco,
    @required this.mudatresbranco,
    @required this.mudaquatrobranco,
    @required this.mudacincobranco,
    @required this.mudaseisbranco,
    @required this.mudaseteleftbranco,
    @required this.mudaseterightbranco,
    @required this.mudaoitorightbranco,
    @required this.mudaoitoleftbranco,
    @required this.mudanoveleftbranco,
    @required this.mudanoverightbranco,
    @required this.mudadezleftbranco,
    @required this.mudadezrightbranco,
    @required this.mudaonzeleftbranco,
    @required this.mudaonzerightbranco,
    @required this.mudadozeleftbranco,
    @required this.mudadozerightbranco,
    @required this.mudatrezeleftbranco,
    @required this.mudatrezerightbranco,
    @required this.mudaquatzleftbranco,
    @required this.mudaquatzrightbranco,
    @required this.mudaquinleftbranco,
    @required this.mudaquinrightbranco,
    @required this.mudadeseisleftbranco,
    @required this.mudadeseisrightbranco,
  }) : super(key: key);
  final bool zerobranco;
  final bool umbranco;
  final bool doisbranco;
  final bool tresbranco;
  final bool quatrobranco;
  final bool cincobranco;
  final bool seisbranco;
  final bool seteleftbranco;
  final bool seterightbranco;
  final bool oitoleftbranco;
  final bool oitorightbranco;
  final bool noveleftbranco;
  final bool noverightbranco;
  final bool dezleftbranco;
  final bool dezrightbranco;
  final bool onzeleftbranco;
  final bool onzerightbranco;
  final bool dozerightbranco;
  final bool dozeleftbranco;
  final bool trezeleftbranco;
  final bool trezerightbranco;
  final bool quaztleftbranco;
  final bool quazrightbranco;
  final bool quinleftbranco;
  final bool quinrightbranco;
  final bool deseisleftbranco;
  final bool deseisrightbranco;
  final String title;

  final ValueChanged<bool> mudaum;
  final ValueChanged<bool> mudazerobranco;
  final ValueChanged<bool> mudadoisbranco;
  final ValueChanged<bool> mudatresbranco;
  final ValueChanged<bool> mudaquatrobranco;
  final ValueChanged<bool> mudaseisbranco;
  final ValueChanged<bool> mudacincobranco;
  final ValueChanged<bool> mudaseteleftbranco;
  final ValueChanged<bool> mudaseterightbranco;
  final ValueChanged<bool> mudaoitorightbranco;
  final ValueChanged<bool> mudaoitoleftbranco;
  final ValueChanged<bool> mudanoveleftbranco;
  final ValueChanged<bool> mudanoverightbranco;
  final ValueChanged<bool> mudadezleftbranco;
  final ValueChanged<bool> mudadezrightbranco;
  final ValueChanged<bool> mudaonzeleftbranco;
  final ValueChanged<bool> mudaonzerightbranco;
  final ValueChanged<bool> mudadozeleftbranco;
  final ValueChanged<bool> mudadozerightbranco;
  final ValueChanged<bool> mudatrezeleftbranco;
  final ValueChanged<bool> mudatrezerightbranco;
  final ValueChanged<bool> mudaquatzleftbranco;
  final ValueChanged<bool> mudaquatzrightbranco;
  final ValueChanged<bool> mudaquinleftbranco;
  final ValueChanged<bool> mudaquinrightbranco;
  final ValueChanged<bool> mudadeseisleftbranco;
  final ValueChanged<bool> mudadeseisrightbranco;

  GlobalKey _containerKey = GlobalKey();
  StorageReference storageReference = FirebaseStorage().ref();
  bool loading = false;
  String uid = 'gmKjgCrUl7fYTvym0KAkgjCnc1z2';
  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  /* onPressed: () {
                      _imageFile = null;
                      screenshotController.capture().then((File image) async {
re.instance
                            .collection('users')
                            .document('gmKjgCrUl7fYTvym0KAkgjCnc1z2')
                            .collection('Relatorios')
                            .document('Semana 1')
                            .collection('dia ')
                            .add({
                          'dores': image,
                        });
 */
  void _zerobranco() {
    mudazerobranco(!zerobranco);
  }

  void _umbranco() {
    mudaum(!umbranco);
  }

  void _doisbranco() {
    mudadoisbranco(!doisbranco);
  }

  void _tresbranco() {
    mudatresbranco(!tresbranco);
  }

  void _quatrobranco() {
    mudaquatrobranco(!quatrobranco);
  }

  void _cincobranco() {
    mudacincobranco(!cincobranco);
  }

  void _seisbranco() {
    mudaseisbranco(!seisbranco);
  }

  void _seteleftbranco() {
    mudaseteleftbranco(!seteleftbranco);
  }

  void _seterightbranco() {
    mudaseterightbranco(!seterightbranco);
  }

  void _oitoleftbranco() {
    mudaoitoleftbranco(!oitoleftbranco);
  }

  void _oitorightbranco() {
    mudaoitorightbranco(!oitorightbranco);
  }

  void _noveleftbranco() {
    mudanoveleftbranco(!noveleftbranco);
  }

  void _noverightbranco() {
    mudanoverightbranco(!noverightbranco);
  }

  void _dezleftbranco() {
    mudadezleftbranco(!dezleftbranco);
  }

  void _dezrightbranco() {
    mudadezrightbranco(!dezrightbranco);
  }

  void _onzeleftbranco() {
    mudaonzeleftbranco(!onzeleftbranco);
  }

  void _onzerightbranco() {
    mudaonzerightbranco(!onzerightbranco);
  }

  void _dozerightbranco() {
    mudadozeleftbranco(!dozerightbranco);
  }

  void _dozeleftbranco() {
    mudadozerightbranco(!dozeleftbranco);
  }

  void _trezeleftbranco() {
    mudatrezeleftbranco(!trezeleftbranco);
  }

  void _trezerightbranco() {
    mudatrezerightbranco(!trezerightbranco);
  }

  void _quaztleftbranco() {
    mudaquatzleftbranco(!quaztleftbranco);
  }

  void _quazrightbranco() {
    mudaquatzrightbranco(!quazrightbranco);
  }

  void _quinleftbranco() {
    mudaquinleftbranco(!quinleftbranco);
  }

  void _quinrightbranco() {
    mudaquinrightbranco(!quinrightbranco);
  }

  void _deseisleftbranco() {
    mudadeseisleftbranco(!deseisleftbranco);
  }

  void _deseisrightbranco() {
    mudadeseisrightbranco(!deseisrightbranco);
  }

  final List<String> _dropdownValues = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five'
  ]; //The list of values we want on the dropdown

  void _displayDialog(BuildContext context) async {
    showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Dropdown Button'),
            content: DropdownButton<String>(
              items: _dropdownValues.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String value) {},
              isExpanded: false,
              hint: const Text('Select Number'),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(

        /*    child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
        /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [ */

        body: RepaintBoundary(
            key: _containerKey,
            child: Stack(children: <Widget>[
              Container(
                child: Image.asset('assets/cabeca.jpg'),
                alignment: Alignment.topCenter,
              ),
              Container(
                child: GestureDetector(
                    onTap: _zerobranco,
                    child: Image(
                        image: zerobranco
                            ? ExactAssetImage('assets/zerobranco.jpg')
                            : const ExactAssetImage(
                                'assets/quatrobranco.jpg'))),
                alignment: Alignment(0.0, -0.83),
              ),
              Container(
                child: GestureDetector(
                    onTap: _umbranco,
                    child: Image(
                        image: umbranco
                            ? ExactAssetImage('assets/umbranco.jpg')
                            : ExactAssetImage('assets/cincobranco.jpg'))),
                alignment: Alignment(0.00, -0.78),
              ),
              Container(
                child: GestureDetector(
                    onTap: _seisbranco,
                    child: Image(
                        image: seisbranco
                            ? ExactAssetImage('assets/seisbranco.png')
                            : ExactAssetImage('assets/quatrobranco.jpg'))),
                alignment: Alignment(0.0, -0.735),
              ),
              Container(
                child: GestureDetector(
                    onTap: _doisbranco,
                    child: Image(
                        image: doisbranco
                            ? ExactAssetImage('assets/doisbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(0.0, -0.668),
              ),
              Container(
                child: GestureDetector(
                    onTap: _tresbranco,
                    child: Image(
                        image: tresbranco
                            ? ExactAssetImage('assets/tresbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(-0.008, -0.508),
              ),
              Container(
                child: GestureDetector(
                    onTap: _quatrobranco,
                    child: Image(
                        image: quatrobranco
                            ? ExactAssetImage('assets/quatrobranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(-0.008, -0.43),
              ),
              Container(
                child: GestureDetector(
                    onTap: () {
                      _cincobranco();
                      _displayDialog(context);
                    },
                    child: Image(
                        image: cincobranco
                            ? ExactAssetImage('assets/cincobranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(-0.008, -0.298),
              ),
              Container(
                child: GestureDetector(
                    onTap: _seteleftbranco,
                    child: Image(
                        image: seteleftbranco
                            ? ExactAssetImage('assets/seteleftbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(-0.39, -0.603),
              ),
              Container(
                child: GestureDetector(
                    onTap: _seterightbranco,
                    child: Image(
                        image: seterightbranco
                            ? ExactAssetImage('assets/seterightbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(0.39, -0.603),
              ),
              Container(
                child: GestureDetector(
                    onTap: _oitorightbranco,
                    child: Image(
                        image: oitorightbranco
                            ? ExactAssetImage('assets/oitorightbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(0.44, -0.50),
              ),
              Container(
                child: GestureDetector(
                    onTap: _oitoleftbranco,
                    child: Image(
                        image: oitoleftbranco
                            ? ExactAssetImage('assets/oitoleftbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(-0.45, -0.50),
              ),
              Container(
                child: GestureDetector(
                    onTap: _noveleftbranco,
                    child: Image(
                        image: noveleftbranco
                            ? ExactAssetImage('assets/noveleftbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(-0.48, -0.42),
              ),
              Container(
                child: GestureDetector(
                    onTap: _noverightbranco,
                    child: Image(
                        image: noverightbranco
                            ? ExactAssetImage('assets/noverightbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(0.48, -0.42),
              ),
              Container(
                child: GestureDetector(
                    onTap: _dezleftbranco,
                    child: Image(
                        image: dezleftbranco
                            ? ExactAssetImage('assets/dezleftbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(-0.57, -0.32),
              ),
              Container(
                child: GestureDetector(
                    onTap: _dezrightbranco,
                    child: Image(
                        image: dezrightbranco
                            ? ExactAssetImage('assets/dezrightbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(0.56, -0.32),
              ),
              Container(
                child: GestureDetector(
                    onTap: _onzeleftbranco,
                    child: Image(
                        image: onzeleftbranco
                            ? ExactAssetImage('assets/onzeleftbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(-0.61, -0.245),
              ),
              Container(
                child: GestureDetector(
                    onTap: _onzerightbranco,
                    child: Image(
                        image: onzerightbranco
                            ? ExactAssetImage('assets/onzerightbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(0.605, -0.243),
              ),
              Container(
                child: GestureDetector(
                    onTap: _dozerightbranco,
                    child: Image(
                        image: dozerightbranco
                            ? ExactAssetImage('assets/dozerightbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(0.17, -0.0724),
              ),
              Container(
                child: GestureDetector(
                    onTap: _dozeleftbranco,
                    child: Image(
                        image: dozeleftbranco
                            ? ExactAssetImage('assets/dozeleftbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(-0.186, -0.0707),
              ),
              Container(
                child: GestureDetector(
                    onTap: _trezerightbranco,
                    child: Image(
                        image: trezerightbranco
                            ? ExactAssetImage('assets/trezerightbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(0.16, 0.095),
              ),
              Container(
                child: GestureDetector(
                    onTap: _trezeleftbranco,
                    child: Image(
                        image: trezeleftbranco
                            ? ExactAssetImage('assets/trezeleftbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(-0.17, 0.095),
              ),
              Container(
                child: GestureDetector(
                    onTap: _quazrightbranco,
                    child: Image(
                        image: quazrightbranco
                            ? ExactAssetImage('assets/quazrightbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(0.16, 0.283),
              ),
              Container(
                child: GestureDetector(
                    onTap: _quaztleftbranco,
                    child: Image(
                        image: quaztleftbranco
                            ? ExactAssetImage('assets/quaztleftbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(-0.18, 0.28),
              ),
              Container(
                child: GestureDetector(
                    onTap: _quinrightbranco,
                    child: Image(
                        image: quinrightbranco
                            ? ExactAssetImage('assets/quinrightbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(0.165, 0.418),
              ),
              Container(
                child: GestureDetector(
                    onTap: _quinleftbranco,
                    child: Image(
                        image: quinleftbranco
                            ? ExactAssetImage('assets/quinleftbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(-0.18, 0.41),
              ),
              Container(
                child: GestureDetector(
                    onTap: _deseisrightbranco,
                    child: Image(
                        image: deseisrightbranco
                            ? ExactAssetImage('assets/deseisrightbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(0.20, 0.483),
              ),
              Container(
                child: GestureDetector(
                    onTap: _deseisleftbranco,
                    child: Image(
                        image: deseisleftbranco
                            ? ExactAssetImage('assets/deseisleftbranco.jpg')
                            : ExactAssetImage('assets/zerobranco.jpg'))),
                alignment: Alignment(-0.21, 0.476),
              ),
              Positioned(
                  bottom: 30.0,
                  child: RaisedButton(
                    color: Color(0xFF3C5A99),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    child: Text('Clique para prosseguir'),
                    onPressed: () {},
                  ))
            ])));
  }
}
