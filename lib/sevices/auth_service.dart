import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import com.google.firebase.auth.FirebaseAuth;
class AuthService {
  FirebaseAuth firebaseAuths = FirebaseAuth.instance;

  Future<User?> register(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCrendential = await firebaseAuths
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCrendential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(snackBar)
      print(e);
    }
  }

  Future<User?> login(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCrendential = await firebaseAuths
          .signInWithEmailAndPassword(email: email, password: password);
      return userCrendential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.red,
      ));
      print(e);
    } catch (e) {
      print(e);
    }
  }
}
