import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signIn(String email, String password) async {
    var user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  void register(String email, String password) {}
}
