

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<UserCredential> petugasRegisterWithEmailAndPassword(
      String email, String password) async {
    var accountPetugas = FirebaseAuth.instance;
    var registerPetugas = await accountPetugas.createUserWithEmailAndPassword(
        email: email, password: password);
    return registerPetugas;
  }

  Future<UserCredential> petugasLoginWithEmailAndPassword(
      String email, String password) async {
    var accountPetugas = FirebaseAuth.instance;
    var registerPetugas = await accountPetugas.signInWithEmailAndPassword(email: email, password: password);
    return registerPetugas;
  }

  Future<void> logout()async{
    var user = FirebaseAuth.instance;
    await user.signOut();
  }
}
