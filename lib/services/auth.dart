import 'package:fire1/models/user.dart';
import 'package:fire1/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  // get uid from firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  NewUser _userFromFirebaseUser(User user) {
    return user != null ? NewUser(uid: user.uid) : null;
  }

  // auth chnage user stream
  Stream<NewUser> get user {
    return _auth
        .authStateChanges()
        .map((User user) => _userFromFirebaseUser(user));
  }

  // signin anon

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // signin email and pass

  Future signInWithEmailAndPasword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign up

  Future registerWithEmailAndPasword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      await DatabaseService(uid: user.uid).updateUserData('0', 'new user', 100);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
