import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Custom Text Style theo Assets
class LandStyle {
  static final landTextTheme = TextTheme(
    headline1: GoogleFonts.manrope(fontSize: 40, fontWeight: FontWeight.bold),
    headline2: GoogleFonts.manrope(fontSize: 24),
    headline6: GoogleFonts.openSans(fontSize: 20),
    bodyText1: GoogleFonts.openSans(fontSize: 17),
    bodyText2: GoogleFonts.openSans(fontSize: 15),
    caption: GoogleFonts.openSans(fontSize: 12),
  );

  static TextStyle sectionTitle = GoogleFonts.manrope(fontSize: 18);
}
