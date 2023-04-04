import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const transparent = Colors.transparent;

  static const base = Color(0xFFBBDEFB);

  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);

  static const lightGray = Color(0xFFF2F2F2);
  static const gray = Color(0XFFB7BAC4);
  static const darkGray = Color(0xFF686868);

  static const lightGreen = Color.fromRGBO(200, 230, 201, 1);
  static const green = Color(0xFF69F0AE);
  static const darkGreen = Color(0xFF136A62);

  static const lightBrown = Color(0XFFB19144);
  static const darkBrown = Color(0xFF36291B);

  static const lightRed = Color(0xFFFFEBEE);
  static const red = Color(0xFFE57373);

  static const yellow = Color(0xFFFFEB3B);
}

class AppTextStyle {
  static final regular15 = GoogleFonts.robotoMono(
    fontSize: 15,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static final regular25 = GoogleFonts.robotoMono(
    fontSize: 25,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static final regular35 = GoogleFonts.robotoMono(
    fontSize: 35,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static final medium15 = GoogleFonts.robotoMono(
    fontSize: 15,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );

  static final medium25 = GoogleFonts.robotoMono(
    fontSize: 25,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );

  static final medium25medium35 = GoogleFonts.robotoMono(
    fontSize: 35,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );

  static final medium40 = GoogleFonts.robotoMono(
    fontSize: 40,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );

  static final bold15 = GoogleFonts.robotoMono(
    fontSize: 15,
    color: AppColors.black,
    fontWeight: FontWeight.w900,
  );

  static final bold25 = GoogleFonts.robotoMono(
    fontSize: 25,
    color: AppColors.black,
    fontWeight: FontWeight.w900,
  );

  static final bold35 = GoogleFonts.robotoMono(
    fontSize: 35,
    color: AppColors.black,
    fontWeight: FontWeight.w900,
  );

  static final bold40 = GoogleFonts.robotoMono(
    fontSize: 40,
    color: AppColors.black,
    fontWeight: FontWeight.w900,
  );
}