import 'package:clean_architecture_example/features/User/bloc/userbloc.dart';
import 'package:clean_architecture_example/features/User/data/model/user.dart';
import 'package:clean_architecture_example/features/Widgets/custom_button_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../custom_nav_bar.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  UserBloc userBloc;
  double screenWitdht;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    screenWitdht = MediaQuery.of(context).size.width;
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.auhtStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return CustomNavBarUser();
        }
      },
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Row(
                  children: [
                    FlutterLogo(size:200),
                    Flexible(
                                          child: Container(
                        child: Text("Happy Flutter Day", style: TextStyle(
                          fontSize:60,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0B1C2C)
                        ),),
                      ),
                    )
                  ],
                ),

                CustomButtonLogin(
                path: "assets/img/fb.png",
                color: Color(0xFF1878F3),
                borderRadius: 22.0,
                width: 300,
                height: 50.0,
                onPressed: () {
                  userBloc.signInFacebook().then((FirebaseUser user) {
                    userBloc.updateUserData(User(
                        uid: user.uid,
                        name: user.displayName,
                        email: user.email,
                        photoURL: user.photoUrl));
                    isPressed = !isPressed;
                  });
                  setState(() {
                    isPressed = !isPressed;
                  });
                },
              ),
                   CustomButtonLogin(
                  borderRadius: 25.0,
                  color: Color(0xFF53A7E7),
                  path: "assets/img/twitter.png",
                  onPressed: () {
                    userBloc.signInTwitter().then((FirebaseUser user) {
                      userBloc.updateUserData(User(
                          uid: user.uid,
                          name: user.displayName,
                          email: user.email,
                          photoURL: user.photoUrl));
                      isPressed = !isPressed;
                    });
                    setState(() {
                      isPressed = !isPressed;
                    });
                  },
                  width: 300,
                  height: 50.0),
              CustomButtonLogin(
                  borderRadius: 25.0,
                  color: Color(0xFFEFEFEF),
                  path: "assets/img/google.png",
                  onPressed: () {
                    userBloc.signIn().then((FirebaseUser user) {
                      userBloc.updateUserData(User(
                          uid: user.uid,
                          name: user.displayName,
                          email: user.email,
                          photoURL: user.photoUrl));
                      isPressed = !isPressed;
                    });
                    setState(() {
                      isPressed = !isPressed;
                    });
                  },
                  width: 300,
                  height: 50.0),


              
            
            ],
          )
        ],
      ),
    );
  }
}
