import 'package:flutter/material.dart';
import 'package:notepad/screen/settings_screen.dart';
import 'package:notepad/styles.dart';


 Color kInactive = Colors.black;
 Color kActive = Colors.pinkAccent;



ButtonStyle bottomButton(color) {
  Color color;
  var kButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(color),
      padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 13)));
  return kButtonStyle;
}

/// [TextStyle] for modal sheet Headings
var kBottomSheetHeading = TextStyle(fontFamily: selectedFont , fontSize: 16, fontWeight: FontWeights.bold);

/// [TextStyle] for modal sheet Headings
const kBottomSheetChild = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: 14.0,
);

