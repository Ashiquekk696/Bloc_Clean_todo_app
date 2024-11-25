
import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;

  Responsive(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  double get blockSizeHorizontal => width / 100;
  double get blockSizeVertical => height / 100;

  bool isExtraSmallScreen() => width < 480;
  bool isSmallScreen() => width >= 480 && width < 600;
  bool isMediumScreen() => width >= 600 && width < 900;
  bool isLargeScreen() => width >= 900 && width < 1200;
  bool isExtraLargeScreen() => width >= 1200 && width < 1350;
  bool isUltraLargeScreen() => width >= 1350;

  double getChildAspectRatio() {
    if (isExtraLargeScreen()) {
      return 2.4; // Adjust this as needed for very small screens
    }
    if (isExtraSmallScreen()) {
      return 1.2; // Adjust this as needed for very small screens
    } else if (isSmallScreen()) {
      return 1.4;
    } else if (isMediumScreen()) {
      return 1.6;
    } else if (isLargeScreen()) {
      return 1.8;
    } else {
      return 2.6; // For very large screens
    }
  }

  double fontSize(double size) {
    if (isExtraSmallScreen()) {
      return size;
    } else if (isSmallScreen()) {
      return size * 1.1;
    } else if (isMediumScreen()) {
      return size * 1.2;
    } else if (isLargeScreen()) {
      return size * 1.3;
    } else if (isExtraLargeScreen()) {
      return size * 1.4;
    } else {
      return size * 1.5;
    }
  }
}
