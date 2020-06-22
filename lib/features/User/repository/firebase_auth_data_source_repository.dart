import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthDataSourceRespository {

  Future< FirebaseUser> signInFirebase();
  signOut();

  Future<FirebaseUser> signInFacebook();
  signOutFacebook();

  Future<FirebaseUser> signInTwitter();
  signOutTwitter();
}


