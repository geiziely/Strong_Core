import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Usuarios {
  final String users;
  final String nome;
  final String tempo1;
  final String tempo2;
  final String tempo3;

  final List<String> exercicios;
  final List<String> relatorios;
  final List<String> semana;
  final List<String> dores;

  const Usuarios({
    this.users,
    this.nome,
    this.relatorios,
    this.semana,
    this.exercicios,
    this.dores,
    this.tempo1,
    this.tempo2,
    this.tempo3,
  });

  Usuarios.fromMap(Map<String, dynamic> data, String users)
      : this(
          users: 'gmKjgCrUl7fYTvym0KAkgjCnc1z2',
          nome:data['name'],
          tempo1: data['tempo 1'],
          tempo2: data['tempo 2'],
          tempo3: data['tempo 3'],
          exercicios: List<String>.from(data['Exercicios']),
        );
}
