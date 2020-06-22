import 'package:flutter/material.dart';

class CustomButtonLogin extends StatefulWidget {
  double width = 0.0;
  double height = 0.0;
  final double borderRadius;
  final Color color;
  final VoidCallback onPressed;
  final String path;
  CustomButtonLogin(
      {Key key, @required this.onPressed, @required this.path, @required this.borderRadius, @required this.color, this.height, this.width });
  @override
  State<StatefulWidget> createState() {
    return _CustomButtonLogin();
  }
}

class _CustomButtonLogin extends State<CustomButtonLogin> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            color: widget.color
           ),
        child: Center(
            child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.path))))),
      ),
    );
  }
}
