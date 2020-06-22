import 'package:clean_architecture_example/features/User/bloc/userbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeUser extends StatelessWidget {
  HomeUser({Key key}) : super(key: key);
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        userBloc.signOut();
        userBloc.signOutFacebook();
        userBloc.signOutTwitter();
      }),
      body: Center(
          child: Container(
        child: Text("Bievenido"),
      )),
    );
  }
}
