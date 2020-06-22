import 'package:clean_architecture_example/core/error/failure.dart';
import 'package:clean_architecture_example/features/User/data/datasource/firebase_auth_data_source.dart';
import 'package:clean_architecture_example/features/User/repository/firebase_auth_data_source_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDataSourceRespositoryImpl implements FirebaseAuthDataSourceRespository{

   final  firebaseAuthApiDataSourceImpl = FirebaseAuthDataSourceImpl();

  @override
  Future<FirebaseUser> signInFacebook() {
    return  firebaseAuthApiDataSourceImpl.signInFacebook();
  } 

  @override
  Future< FirebaseUser> signInFirebase() async{
    return  firebaseAuthApiDataSourceImpl.signIn();
   
  } 

  @override
  signOut() => firebaseAuthApiDataSourceImpl.signOut();

  @override
  signOutFacebook()=> firebaseAuthApiDataSourceImpl.signOutFacebook();

  @override
  Future<FirebaseUser> signInTwitter() =>  firebaseAuthApiDataSourceImpl.signInTwitter();

  @override
  signOutTwitter() =>  firebaseAuthApiDataSourceImpl.signOutTwitter();

}

