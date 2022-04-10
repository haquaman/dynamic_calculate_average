import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const mainColor = Colors.indigo;
  static const String mainTittle = "Calculate Average";
  //const degerler sabit değerler verileceğinde kullanılır.
  static final TextStyle tittleStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: mainColor,
  );

  static BorderRadius borderRadious = BorderRadius.circular(24);

  static final TextStyle numberOfCoursesStyle = GoogleFonts.quicksand(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: mainColor,
  );

  static final TextStyle dropDownTextStyle = GoogleFonts.quicksand(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: mainColor,
  );

  static final TextStyle averageStyle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w800,
    color: mainColor,
  );

  static final dropdownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
}
