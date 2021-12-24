import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// decoration: new BoxDecoration(
// color: forDialog ? Color(0xFF737373) : Colors.white,
// borderRadius: new BorderRadius.only(
// topLeft: const Radius.circular(25.0),
// topRight: const Radius.circular(25.0))),


class BottomCardButton extends StatelessWidget {
  final String vtext;
  final Color Tcolour;
  final Color buttonColor;
  final Function onPressed;
  const BottomCardButton(
      {this.vtext, this.Tcolour, this.buttonColor, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      onPressed: onPressed,
      child: Text(
        vtext,
        style: TextStyle(
          color: Tcolour,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
