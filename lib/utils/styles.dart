import 'package:cart/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppStyles {
  final bodyFont = GoogleFonts.roboto(
    fontSize: 12.sp,
    color: appColors.blackColor.withOpacity(.5),
  );
  final smallBodyFont = GoogleFonts.roboto(
    fontSize: 10.sp,
    color: appColors.blackColor.withOpacity(.5),
  );
  final title = GoogleFonts.roboto(
    fontSize: 14.sp,
    color: appColors.blackColor,
    fontWeight: FontWeight.bold,
  );
  final enableInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      color: appColors.shadowColor,
    ),
  );
}
