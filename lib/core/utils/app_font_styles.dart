import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle headingLarge = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static final TextStyle headingMedium = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static final TextStyle headingSmall = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static final TextStyle bodyLarge = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.grey[800],
  );

  static final TextStyle bodyMedium = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.grey[700],
  );

  static final TextStyle bodySmall = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.grey[600],
  );

  static final TextStyle button = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final TextStyle caption = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.grey[500],
  );

  static final TextStyle link = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );
}
