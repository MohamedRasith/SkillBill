import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants.dart';

class FontConstants {
  static const String fontRubik = "Rubik";
}

class AppFonts {
  static TextStyle extraBoldStyle({
    double fontSize = 12.0,
    double letterSpacing = 0.5,
    double wordSpacing = 0.3,
    double height = 1,
    String fontType = FontConstants.fontRubik,
    Color fontColor = AppColors.textColor,
    FontWeight fontWeight = FontWeight.w800,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = AppColors.transparent,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      color: fontColor,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
    );
  }

  static TextStyle boldStyle({
    double fontSize = 12.0,
    double letterSpacing = 0.5,
    double wordSpacing = 0.3,
    double height = 1,
    String fontType = FontConstants.fontRubik,
    Color fontColor = AppColors.textColor,
    FontWeight fontWeight = FontWeight.w700,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = AppColors.transparent,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      color: fontColor,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
    );
  }

  static TextStyle semiBoldStyle({
    double fontSize = 14.0,
    double letterSpacing = 0.5,
    double wordSpacing = 0.3,
    double height = 1,
    String fontType = FontConstants.fontRubik,
    Color fontColor = AppColors.textColor,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = AppColors.transparent,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      color: fontColor,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
    );
  }

  static TextStyle mediumStyle({
    double fontSize = 20.0,
    double letterSpacing = 0.5,
    double wordSpacing = 0.3,
    double height = 1,
    String fontType = FontConstants.fontRubik,
    Color fontColor = AppColors.textColor,
    FontWeight fontWeight = FontWeight.w500,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = AppColors.transparent,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      color: fontColor,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
    );
  }

  static TextStyle lightStyle({
    double fontSize = 12.0,
    double letterSpacing = 0.2,
    double wordSpacing = 0.3,
    double height = 1.43,
    String fontType = FontConstants.fontRubik,
    Color fontColor = AppColors.textColor,
    FontWeight fontWeight = FontWeight.w300,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = AppColors.transparent,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      color: fontColor,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
    );
  }

  static TextStyle regularStyle({
    double fontSize = 12.0,
    double letterSpacing = 0.2,
    double wordSpacing = 0.3,
    double height = 1.43,
    String fontType = FontConstants.fontRubik,
    Color fontColor = AppColors.textColor,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = AppColors.transparent,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      color: fontColor,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
    );
  }

  static TextStyle extraRegularStyle({
    double fontSize = 12.0,
    double letterSpacing = 0.2,
    double wordSpacing = 0.3,
    double height = 1.43,
    String fontType = FontConstants.fontRubik,
    Color fontColor = AppColors.textColor,
    FontWeight fontWeight = FontWeight.w300,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = AppColors.transparent,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      color: fontColor,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
    );
  }

  static TextStyle thinStyle({
    double fontSize = 12.0,
    double letterSpacing = 0.2,
    double wordSpacing = 0.3,
    double height = 1.43,
    String fontType = FontConstants.fontRubik,
    Color fontColor = AppColors.textColor,
    FontWeight fontWeight = FontWeight.w200,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = AppColors.transparent,
    Paint? foreground,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      color: foreground == null ? fontColor : null,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
      foreground: foreground,
    );
  }

  static TextStyle regularGradStyle({
    double fontSize = 12.0,
    double letterSpacing = 0.2,
    double wordSpacing = 0.3,
    double height = 1.43,
    String fontType = FontConstants.fontRubik,
    FontWeight fontWeight = FontWeight.w500,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = AppColors.transparent,
    List<Color> colors = const [AppColors.btnLight, AppColors.btnDark],
    double shadWidth = 200,
    double shadeHeight = 70,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
      foreground: Paint()
        ..shader = LinearGradient(
          colors: colors,
        ).createShader(
          Rect.fromLTWH(
            0.0,
            0.0,
            shadWidth,
            shadeHeight,
          ),
        ),
    );
  }
}
