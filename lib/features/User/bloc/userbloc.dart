import 'package:clean_architecture_example/features/User/data/model/user.dart';
import 'package:clean_architecture_example/features/User/data/repositoryimpl/firebase_auth_data_source_repository_impl.dart';
import 'package:clean_architecture_example/features/User/repository/cloud_firestore_data_source_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc {

  final _auth_repository_Impl = FirebaseAuthDataSourceRespositoryImpl();

  Stream<FirebaseUser> streamFirebase =FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get auhtStatus => streamFirebase;

  Future<FirebaseUser> signIn() => _auth_repository_Impl.signInFirebase();
  signOut() {
    _auth_repository_Impl.signOut();
  }

  Future<FirebaseUser> signInFacebook() => _auth_repository_Impl.signInFacebook();
  signOutFacebook() {
    _auth_repository_Impl.signOutFacebook();
  }


  Future<FirebaseUser> signInTwitter() => _auth_repository_Impl.signInTwitter();
  signOutTwitter()=> _auth_repository_Impl.signOutTwitter();



  final _cloudFirestoreRepository = CloudFireStoreRepository();
  void updateUserData(User user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  @override
  get initialState => null;

  @override
  Stream mapEventToState(event) {
    return null;
  }
}
