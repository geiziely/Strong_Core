import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUser();
  Future<void> signOut();
  
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
Future<String> inputData() async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final String uid = user.uid.toString();
  return uid;
  }

  @override
  Future<String> signInWithEmailAndPassword(String email, String password) async {
    final AuthResult user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return inputData();
  }

  @override
  Future<String> createUserWithEmailAndPassword(String email, String password) async {
    final AuthResult user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return inputData();
  }

  @override
  Future<String> currentUser() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return user?.uid;
  }

  Future<void> signOut() async{
    return _firebaseAuth.signOut();
  }
}