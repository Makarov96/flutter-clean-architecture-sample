import 'package:clean_architecture_example/features/User/ui/screens/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeUser extends StatelessWidget {
  HomeUser({Key key}) : super(key: key);
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.close),
            onPressed: () {
              userBloc.signOut();
              userBloc.signOutFacebook();
              userBloc.signOutTwitter();
            }),
        body: StreamBuilder(
          stream: userBloc.auhtStatus,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
                break;

              case ConnectionState.none:
                return CircularProgressIndicator();
                break;

              case ConnectionState.active:
                return showPofileData(snapshot);
                break;

              case ConnectionState.done:
                return showPofileData(snapshot);
                break;

              default:
            }
          },
        ));
  }


  Widget showPofileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[Text("Usuario no logeado. Haz login")],
          ),
        ],
      );
    } else {
      var user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoUrl,
      );

      return Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[UserHeader(user: user)],
          ),
  
        ],
      );
    }
  }
}



