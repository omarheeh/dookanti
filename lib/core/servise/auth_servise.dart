import 'package:firebase_auth/firebase_auth.dart';

class AuthServise {
  final FirebaseAuth firebaseAuth;
  AuthServise(this.firebaseAuth);
  Future<UserCredential> regester(
      {required String emailAddress, required String password}) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    return credential;
  }

  Future<UserCredential> singin(
      {required String emailAddress, required String password}) async {
    final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: emailAddress, password: password);
    return credential;
  }

  Future<void> signOut() async {
    firebaseAuth.signOut();
  }
}
