
import 'package:clean_architecture_example/features/User/bloc/userbloc.dart';
import 'package:clean_architecture_example/features/User/ui/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (context)=> UserBloc())
      ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
        home: SignInScreen(),
      ),
    );
  }
}

