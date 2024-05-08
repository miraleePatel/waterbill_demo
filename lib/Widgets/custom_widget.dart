import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomWidgets {
  static Text text(
    String content, {
    Color? color,
    double? fontSize = 13,
    FontWeight? fontWeight = FontWeight.normal,
    int? maxLine,
    double? letterSpacing = 0.0,
    TextAlign? textAlign,
    double? height = 1.7,
    TextOverflow? overflow,
    TextDecoration? decoration,
  }) {
    return Text(
      content,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: overflow,
      style: GoogleFonts.roboto(
        letterSpacing: letterSpacing,
        color: color,
        fontSize: fontSize!.sp,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
  }

  /// Custom Button

  /// Show progress indicator when API call Or any other async method call
  showProgressIndicator() {
    return EasyLoading.show(maskType: EasyLoadingMaskType.black, dismissOnTap: false, status: 'Loading');
  }




}
