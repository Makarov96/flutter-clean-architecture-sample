import 'package:clean_architecture_example/features/User/data/model/user.dart';
import 'package:flutter/material.dart';



class UserHeader extends StatelessWidget {
  final User user;
   UserHeader({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      final image_profile= Container(
        margin: EdgeInsets.only(top:30),
            width: 90.0,
            height: 90.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color:Colors.white, width:2.0, style: BorderStyle.solid),
          image:DecorationImage(
              fit:BoxFit.cover,
              image: NetworkImage(user.photoURL)
          )
        ),
      );

      final user_name = Container(
        child: Text("${user.name}", style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600
          
        ),),
      );


    return SafeArea(child: Container(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          image_profile,
          user_name
        ]
      )),
    );
  }
}