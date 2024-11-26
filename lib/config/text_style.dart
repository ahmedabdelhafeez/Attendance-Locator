import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TextStyleClass {
  static TextStyle bigStyle({Color? color, FontWeight? fontWeight,foreground}) {
    return GoogleFonts.cairo(
      color: color ?? null,
      foreground:foreground ,
      fontSize: 22.sp,
      height: 1.3,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }

  static TextStyle semiBigStyle({Color? color,foreground,shadow}) {
    return GoogleFonts.cairo(
      color: color ?? null,
      fontSize: 19.sp,
      foreground:foreground ,
      height: 1.3,
      shadows: shadow
      //fontWeight: FontWeight.bold,
    );
  }

  static TextStyle semiBigBoldStyle({Color? color,decoration}) {
    return GoogleFonts.cairo(
      color: color ?? null,
      fontSize: 19.sp,
      decoration: decoration,
      height: 1.3,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle headBoldStyle({List<Shadow>?shadow ,Color? color, double? fontSize}) {
    return GoogleFonts.cairo(
      color: color ?? null,
      fontSize: fontSize ?? 16.sp,
      height: 1.3,
      shadows:shadow,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle headStyle({Color? color, double? fontSize,foreground,shadow}) {
    return GoogleFonts.cairo(
      color: color ?? null,
      foreground:foreground ,
      shadows:shadow ,
      fontSize: fontSize ?? 16.sp,
      height: 1.3,
    );
  }

  static TextStyle semiHeadBoldStyle({Color? color,decoration}) {
    return GoogleFonts.cairo(
      color: color ?? null,
      decoration: decoration,
      fontSize: 15.sp,
      height: 1.3,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle semiHeadStyle({Color? color,shadow,foreground}) {
    return GoogleFonts.cairo(
    shadows: shadow,
    foreground:foreground ,
     color: color ?? null,
      fontSize: 15.sp,
      height: 1.3,
    );
  }

  static TextStyle semiStyle({Color? color,foreground}) {
    return GoogleFonts.cairo(
     color: color ?? null,
     foreground:foreground ,
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      height: 1.3,
    );
  }

  static TextStyle semiDecorationStyle({Color? color}) {
    return GoogleFonts.cairo(
      color: color ?? null,
      fontSize: 13.sp,
      height: 1.3,
      decoration: TextDecoration.underline,
      decorationColor: color ?? Colors.black,
    );
  }

  static TextStyle semiBoldStyle({List<Shadow>?shadow, Color? color}) {
    return GoogleFonts.cairo(
      color: color ?? null,
      fontSize: 13.sp,
      height: 1.3,
      shadows:shadow ,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle normalStyle({Color? color,double? fontSize,double?height ,foreground}) {
    return GoogleFonts.cairo(
      color: color ?? null,
      foreground: foreground,
      fontSize: fontSize ?? 10.sp,
      height: height??1.3,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle normalLineThroughStyle({Color? color,}) {
    return GoogleFonts.cairo(
      color: color ?? null,
      decoration: TextDecoration.lineThrough,
      fontSize: 10.sp,
      height: 1.3,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle normalBoldStyle({Color? color,double? fontSize}) {
    return GoogleFonts.cairo(
      color: color ?? null,
      fontSize:fontSize ?? 11.sp,
      height: 1.3,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle textButtonStyle({Color? color}) {
    return GoogleFonts.cairo(
      color: color ?? null, //white
      fontSize: 14.sp,
      height: 1.3,
    );
  }

  static TextStyle smallTextButtonStyle({Color? color}) {
    return GoogleFonts.cairo(
      color: color ?? null, //white
      fontSize: 9.sp,
      height: 1.3,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle smallStyle({Color? color,decoration}) {
    return GoogleFonts.cairo(
      color: color ?? null,
      fontSize: 9.sp,
      decoration:decoration,
      height: 1.3,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle smallBoldStyle({Color? color}) {
    return GoogleFonts.cairo(
      color: color ?? null,
      fontSize: 9.sp,
      height: 1.3,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle tinyStyle({Color? color,TextDecoration? textDecoration}) {
    return GoogleFonts.cairo(
      color: color ?? null,
      fontSize: 7.5.sp,
      decoration:textDecoration,
      height: 1.3,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle tinyBoldStyle({Color? color}) {
    return GoogleFonts.cairo(
      color: color ?? null,
      fontSize: 7.5.sp,
      height: 1.3,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle veryTinyStyle({Color? color}) {
    return GoogleFonts.cairo(
      color: color ?? null,
      fontSize: 5.5.sp,
      height: 1.3,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle smallDecorationStyle({Color? color}) {
    return GoogleFonts.cairo(
      color: color ?? null,
      fontSize: 9.sp,
      height: 1.3,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
      decorationColor: color ?? Colors.black,
    );
  }
}
