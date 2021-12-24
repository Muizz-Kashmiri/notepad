import 'package:flutter/material.dart';
import 'package:notepad/screen/settings_screen.dart';

/// font-weight definitions
class FontWeights {
  FontWeights._();

  static const thin = FontWeight.w100;
  static const extraLight = FontWeight.w200;
  static const light = FontWeight.w300;
  static const normal = FontWeight.normal;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.bold;
  static const extraBold = FontWeight.w800;
  static const black = FontWeight.w900;
}

const kBottomBarSize = 56.0;
const kIconTintLight = Color(0xFF5F6368);
const kIconTintDark = Color(0xFF2f3031);

const kIconTintCheckedLight = Color(0xFF202124);
const kLabelColorLight = Color(0xFF202124);
const kCheckedLabelBackgroudLight = Color(0x337E39FB);
const kHintTextColorLight = Color(0xFF61656A);
//note title text color
const kNoteTitleColorLight = Color(0xFF202124);
// note title dark mode
const kNoteTitleColorDark = Color(0xFFd4d6db);

const kNoteTextColorLight = Color(0x99000000);
const kNoteTextColorDark = Color(0xffffffff);
const kNoteDetailTextColorLight = Color(0xC2000000);
const kErrorColorLight = Color(0xFFD43131);
const kWarnColorLight = Color(0xFFFD9726);
const kBorderColorLight = Color(0xFFDADCE0);
const kColorPickerBorderColor = Color(0x21000000);
const kBottomAppBarColorLight = Color(0xF2FFFFFF);
const kBottomAppBarColorDark = Color(0xff23272a);
const _kPurplePrimaryValue = 0xFF7E39FB;
const kAccentColorLight = MaterialColor(
  _kPurplePrimaryValue,
  <int, Color>{
    900: Color(0xFF0000c9),
    800: Color(0xFF3f00df),
    700: Color(0xFF2500d7),
    600: Color(0xFF6200ee),
    500: Color(_kPurplePrimaryValue),
    400: Color(0xFF5400e8),
    300: Color(0xFF995dff),
    200: Color(0xFFe3b8ff),
    100: Color(0xFFdab2ff),
    50: Color(0xFFfbd5ff),
  },
);

const kAccentColorDark = MaterialColor(
  _kPurplePrimaryValue,
  <int, Color>{
    900: Color(0xFF202090),
    800: Color(0xFF3f60df),
    700: Color(0xFF250fd7),
    600: Color(0xFF62a0ee),
    500: Color(_kPurplePrimaryValue),
    400: Color(0xFF5490e8),
    300: Color(0xFFf95dff),
    200: Color(0xFFe3e8ff),
    100: Color(0xFFdabeff),
    50: Color(0xFFfb25ff),
  },
);

/// Available note background colors
const Iterable<Color> kNoteColors = [
  Colors.white,
  Color(0xFFF28C82),
  Color(0xFFFABD03),
  Color(0xFFFFF476),
  Color(0xFFCDFF90),
  Color(0xFFA7FEEB),
  Color(0xFFCBF0F8),
  Color(0xFFAFCBFA),
  Color(0xFFD7AEFC),
  Color(0xFFFDCFE9),
  Color(0xFFE6C9A9),
  Color(0xFFE9EAEE),
];
var kDefaultNoteColor = kNoteColors.first;

/// [TextStyle] for note title in a preview card
var kCardTitleLight = TextStyle(
  fontFamily: selectedFont,
  color: kNoteTitleColorLight,
  // fontSize: 16,
  fontSize: initFontValue,

  height: 19 / 16,
  fontWeight: FontWeights.medium,
);

// For dark theme design
var kCardTitleDark = TextStyle(
  fontFamily: selectedFont,
  color: kNoteTitleColorDark,
  // fontSize: 16,
  fontSize: initFontValue,

  height: 19 / 16,
  fontWeight: FontWeights.medium,
);

/// [TextStyle] for note title in a preview card
var kNoteTitleLight = TextStyle(
  fontFamily: selectedFont,
  color: kNoteTitleColorLight,
  // fontSize: 21,
  fontSize: initFontValue,
  height: 19 / 16,
  fontWeight: FontWeights.medium,
);

/// [TextStyle] for text notes
var kNoteTextLight = TextStyle(
  fontFamily: selectedFont,
  color: kNoteTextColorLight,
  height: 1.3125,
  fontSize: initFontValue,
  // fontSize: 16,
);

/// [TextStyle] for text notes in detail view
var kNoteTextLargeLight = TextStyle(
  fontFamily: selectedFont,
  color: kNoteDetailTextColorLight,
  fontSize: initFontValue,
  // fontSize: 18,
  height: 1.3125,
);

/// [TextStyle] for checklist notes
var kChecklistTextLight = TextStyle(
  fontFamily: selectedFont,
  color: kNoteTextColorLight,
  height: 16 / 14,
  // fontSize: initFontValue,
  fontSize: initFontValue,
);

/// [TextStyle] for checklist notes in detail view
/// content in tiles on home page
var kChecklistTextLargeLight = TextStyle(
  fontFamily: selectedFont,
  color: kNoteDetailTextColorLight,
  height: 16 / 14,
  fontSize: initFontValue,
  // fontSize: 18,
);
