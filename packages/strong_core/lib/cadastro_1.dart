import 'package:app/cadastro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'commonComponents/customCard.dart';
import 'package:date_format/date_format.dart';
import'home.dart';



class Cidades extends Cadastro {
  Cidades({Key key, this.estado}) : super(key: key); //update this to include the uid in the constructor
  final String estado;//final a variavel não pode ser alterada
   //include this

  List<String> acre = ['Selecione','Acrelandia',
'Assis Brasil',
'Brasileia',
'Bujari',
'Capixaba',
'Cruzeiro do Sul',
'Epitaciolandia',
'Feijo',
'Jordao',
'Mancio Lima',
'Manoel Urbano',
'Marechal Thaumaturgo',
'Placido de Castro',
'Porto Acre',
'Porto Walter',
'Rio Branco',
'Rodrigues Alves',
'Santa Rosa do Purus',
'Sena Madureira',
'Senador Guiomard',
'Tarauaca',
'Xapuri'];

List<String> alagoas = ['Selecione','Agua Branca',
'Anadia',
'Arapiraca',
'Atalaia',
'Barra de Santo Antonio',
'Barra de Sao Miguel',
'Batalha',
'Belem',
'Belo Monte',
'Boca da Mata',
'Branquinha',
'Cacimbinhas',
'Cajueiro',
'Campestre',
'Campo Alegre',
'Campo Grande',
'Canapi',
'Capela',
'Carneiros',
'Cha Preta',
'Coite do Noia',
'Colonia Leopoldina',
'Coqueiro Seco',
'Coruripe',
'Craibas',
'Delmiro Gouveia',
'Dois Riachos',
'Estrela de Alagoas',
'Feira Grande',
'Feliz Deserto',
'Flexeiras',
'Girau do Ponciano',
'Ibateguara',
'Igaci',
'Igreja Nova',
'Inhapi',
'Jacare dos Homens',
'Jacuipe',
'Japaratinga',
'Jaramataia',
'Joaquim Gomes',
'Jequiá da Praia',
'Jundia',
'Junqueiro',
'Lagoa da Canoa',
'Limoeiro de Anadia',
'Maceio',
'Major Isidoro',
'Mar Vermelho',
'Maragogi',
'Maravilha',
'Marechal Deodoro',
'Maribondo',
'Mata Grande',
'Matriz de Camaragibe',
'Messias',
'Minador do Negrao',
'Monteiropolis',
'Murici',
'Novo Lino',
'Olho dAgua Grande',
'Olho dAgua das Flores',
'Olho dAgua do Casado',
'Olivenca',
'Ouro Branco',
'Palestina',
'Palmeira dos Indios',
'Pao de Acucar',
'Pariconha',
'Paripueira',
'Passo de Camaragibe',
'Paulo Jacinto',
'Penedo',
'Piacabucu',
'Pilar',
'Pindoba',
'Piranhas',
'Poco das Trincheiras',
'Porto Calvo',
'Porto Real do Colegio',
'Porto de Pedras',
'Quebrangulo',
'Rio Largo',
'Roteiro',
'Santa Luzia do Norte',
'Santana do Ipanema',
'Santana do Mundau',
'Sao Bras',
'Sao Jose da Laje',
'Sao Jose da Tapera',
'Sao Luis do Quitunde',
'Sao Miguel dos Campos',
'Sao Miguel dos Milagres',
'Sao Sebastiao',
'Satuba',
'Senador Rui Palmeira',
'Tanque dArca',
'Taquarana',
'Teotonio Vilela',
'Traipu',
'Uniao dos Palmares',
'Vicosa'];

  @override
escolheEstado(String estado){
  if(estado == acre){
    return acre;
  }
  if(estado == alagoas){
    return alagoas;
  }
  else{return 'Selecione';}
  
}
}




