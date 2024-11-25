 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import '../utils/responive.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    required this.responsive,
  });

  final Responsive responsive;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: responsive.blockSizeVertical * 2,
      ),
      child: Text(
        'Events',
        style: GoogleFonts.poppins(
          color: const Color(AppColors.black),
          fontSize: responsive.blockSizeVertical * 3,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
