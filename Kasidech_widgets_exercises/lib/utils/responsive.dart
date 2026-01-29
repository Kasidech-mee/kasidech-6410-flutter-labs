import 'package:flutter/material.dart';

class Responsive {
  static const double tabletBreakpoint = 600.0;
  static const double desktopBreakpoint = 900.0;

  static bool isPortrait(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return true;
    } else {
      return false;
    }
  }
  static EdgeInsets getScreenPadding(BuildContext context) {
    if (MediaQuery.of(context).size.width < 600) {
      return EdgeInsets.all(16.0);
    } else {
      return EdgeInsets.all(8.0);
    }
  }

  static bool isMobile(double width) {
    return width < tabletBreakpoint;
  }
  
  static bool isTablet(double width) {
    return width < desktopBreakpoint && width >= tabletBreakpoint;
  }

  static bool isDesktop(double width) {
    return width >= desktopBreakpoint;
  }

}