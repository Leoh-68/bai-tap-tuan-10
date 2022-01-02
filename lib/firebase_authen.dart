import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Auth {
  // FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // void SignUp(String username, String pass, Function onSuccess) {
  //   _firebaseAuth
  //       .createUserWithEmailAndPassword(email: username, password: pass)
  //       .then((user) {
  //         _createUser(username, phone, onSuccess)
  //     print(user);
  //   }).catchError((err) {});
  // }

  // _createUser(String userId, String name, String phone, Function onSuccess) {
  //   var user = {"name": name, "phone": phone};
  //   // ignore: deprecated_member_use
  //   var ref = FirebaseDatabase.instance.reference().child("user");
  //   ref.child(userId).set(user).then((user) {
  //     onSuccess();
  //   }).catchError((err){

  //   });
  // }

  final FirebaseAuth _firebaseAuth;

  Auth({ required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> sigsignInWithEmailAndPasswordnIn(String email, String password)  {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) {
    return _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
