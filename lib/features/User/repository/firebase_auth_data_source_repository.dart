import 'package:clean_architecture_example/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthDataSourceRespository {

  Future< FirebaseUser> signInFirebase();
  signOut();

  Future<FirebaseUser> signInFacebook();
  signOutFacebook();

  Future<FirebaseUser> signInTwitter();
  signOutTwitter();
}


