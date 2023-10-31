import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const transparent = Colors.transparent;

  static const base = Color(0xFFBBDEFB);

  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);

  static const dark = Color(0xFF36454F);

  static const lightGrey = Color(0xFFF2F2F2);
  static const grey = Color(0XFFB7BAC4);
  static const semiGrey = Color(0xFFE0E0E0);
  static const darkGrey = Color(0xFF686868);

  static const lightGreen = Color(0xFFC8E6C9);
  static const green = Color(0xFF69F0AE);
  static const darkGreen = Color(0xFF136A62);

  static const lightBrown = Color(0XFFB19144);
  static const darkBrown = Color(0xFF36291B);

  static const lightRed = Color(0xFFFFEBEE);
  static const red = Color(0xFFE57373);
  static const darkRed = Color(0xFFB71C1C);

  static const yellow = Color(0xFFFFEB3B);

  static final lock = const Color(0xFF000000).withOpacity(0.7);
}

class AppTextStyle {
  static final regular10 = GoogleFonts.robotoMono(
    fontSize: 10,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static final regular13 = GoogleFonts.robotoMono(
    fontSize: 13,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

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

  static final medium10 = GoogleFonts.robotoMono(
    fontSize: 10,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );

  static final medium13 = GoogleFonts.robotoMono(
    fontSize: 12,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );

  static final medium15 = GoogleFonts.robotoMono(
    fontSize: 15,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );

  static final medium20 = GoogleFonts.robotoMono(
    fontSize: 20,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );

  static final medium25 = GoogleFonts.robotoMono(
    fontSize: 25,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );

  static final medium35 = GoogleFonts.robotoMono(
    fontSize: 35,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );

  static final medium40 = GoogleFonts.robotoMono(
    fontSize: 40,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );

  static final bold12 = GoogleFonts.robotoMono(
    fontSize: 12,
    color: AppColors.black,
    fontWeight: FontWeight.w900,
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

  static final phonetics = GoogleFonts.firaSans(
    fontSize: 20,
    color: AppColors.darkGrey,
    fontWeight: FontWeight.w500,
  );
}

class AppContainerStyle {
  static final border = BoxDecoration(
    color: AppColors.base,
    border: Border.all(
      color: AppColors.black,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(30),
  );
}

class AppButtonStyle {
  static final boder = ElevatedButton.styleFrom(
    backgroundColor: AppColors.darkGreen,
    side: const BorderSide(
      width: 2,
      color: AppColors.black,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
}
