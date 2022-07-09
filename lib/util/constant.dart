// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Dimen {
  static const double THICKNESS = 2.5;
  static const double SMALL_ICON_SIZE = 20.0;
  static const double DEF_ICON_SIZE = 30.0;
  static const double DEF_ICON_CIRCLE = 47.0;
  static const double DEF_MARGIN = 12.0;
  static const double DEF_PADDING = 18.0;
  static const double DEF_TWICE_PADDING = DEF_PADDING * 2;
  static const double DEF_CIRCULAR = 30.0;
  static const double DEF_BTN_HEIGHT = 42.0;
  static const double DEF_BTN_RADIUS = 15.0;
  static const double DEF_BTN_TEXT_SIZE = 20.0;
  static const double TITLE_TEXT_SIZE = 24.0;
  static const double HEADING_1_TEXT_SIZE = 24.0;
  static const double HEADING_2_TEXT_SIZE = 21.0;
  static const double HEADING_3_TEXT_SIZE = 18.0;
  static const double HEADING_4_TEXT_SIZE = 16.0;
  static const double SUB_TITLE_TEXT_SIZE = 16.0;
}

class MColor {
  static const PRIMARY_COLOR = MaterialColor(
    _PRIMARY_COLOR,
    <int, Color>{
      50: Color(0xFFE3F7E8),
      100: Color(0xFFBAECC7),
      200: Color(0xFF8CDFA1),
      300: Color(0xFF5ED27B),
      400: Color(0xFF3CC95F),
      500: Color(0xFF19BF43),
      600: Color(0xFF16B93D),
      700: Color(0xFF12B134),
      800: Color(0xFF0EA92C),
      900: Color(0xFF089B1E),
    },
  );
  static const _PRIMARY_COLOR = 0xFF19BF43;
  static const DEF_TEXT_COLOR = Color(0xff7a7a7a);
}

class Font {
  static TextStyle title({
    Color color = MColor.DEF_TEXT_COLOR,
    FontWeight fontWeight = FontWeight.bold,
    double fontSize = Dimen.DEF_BTN_TEXT_SIZE,
  }) =>
      TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      );
  static const HEADING_1 = TextStyle(
    color: MColor.DEF_TEXT_COLOR,
    fontSize: Dimen.HEADING_1_TEXT_SIZE,
    fontWeight: FontWeight.bold,
  );
  static const HEADING_2 = TextStyle(
    color: MColor.DEF_TEXT_COLOR,
    fontSize: Dimen.HEADING_2_TEXT_SIZE,
    fontWeight: FontWeight.bold,
  );
  static const HEADING_3 = TextStyle(
    color: MColor.DEF_TEXT_COLOR,
    fontSize: Dimen.HEADING_3_TEXT_SIZE,
    fontWeight: FontWeight.bold,
  );
  static const HEADING_4 = TextStyle(
    color: MColor.DEF_TEXT_COLOR,
    fontSize: Dimen.HEADING_4_TEXT_SIZE,
    fontWeight: FontWeight.bold,
  );
}

class Format {
  static final birthday = DateFormat('yyyy-MM-dd');
}

class MKey {
  static final API_HOST = "API_HOST";
  static final API_KEY = "API_KEY";
}
