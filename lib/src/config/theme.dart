import 'package:flutter/material.dart';

Color kTextColor = const Color(0xff141c2c);
Color kPrimaryColor = Colors.indigoAccent;
Color kSecondaryColor = Colors.indigo;
Color kTertiaryColor = Colors.deepPurpleAccent;
Color kBackgroundColor = Colors.transparent;

AppBarTheme appBarTheme = AppBarTheme(
  elevation: 0,
  backgroundColor: kBackgroundColor,
  titleTextStyle: PrimaryFont.semiBold(
    fontSize: 22,
    color: kPrimaryColor,
  ),
  foregroundColor: kPrimaryColor,
);

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    elevation: MaterialStateProperty.resolveWith<double>((states) {
      if (states.contains(MaterialState.disabled)) {
        return 4;
      }
      return 8;
    }),
    backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
      if (states.contains(MaterialState.disabled)) {
        return Colors.grey;
      }
      return kTertiaryColor;
    }),
    minimumSize: MaterialStateProperty.resolveWith<Size>((states) {
      return const Size(0, 44);
    }),
    maximumSize: MaterialStateProperty.resolveWith<Size>((states) {
      return const Size(double.maxFinite, 44);
    }),
    padding: MaterialStateProperty.resolveWith<EdgeInsets>((states) {
      return const EdgeInsets.symmetric(horizontal: 16);
    }),
    textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
      return PrimaryFont.medium(fontSize: 16).copyWith(letterSpacing: 1.0);
    }),
    shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>((states) {
      return RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));
    }),
  ),
);

class PrimaryFont {
  static const String fontFamily = "Nunito";

  static TextStyle light({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      color: color ?? kTextColor,
      fontSize: fontSize,
    );
  }

  static TextStyle regular({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      color: color ?? kTextColor,
      fontSize: fontSize,
    );
  }

  static TextStyle medium({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      color: color ?? kTextColor,
      fontSize: fontSize,
    );
  }

  static TextStyle semiBold({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      color: color ?? kTextColor,
      fontSize: fontSize,
    );
  }

  static TextStyle bold({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      color: color ?? kTextColor,
      fontSize: fontSize,
    );
  }

  static TextStyle extraBold({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w800,
      color: color ?? kTextColor,
      fontSize: fontSize,
    );
  }

  static TextStyle black({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w900,
      color: color ?? kTextColor,
      fontSize: fontSize,
    );
  }
}
