import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacing {
  // Constants
  static const double zero = 0.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 40.0;
  static const double xxxl = 60.0;

  // Vertical Spacing (Height)
  static Widget verticalSpaceXs = SizedBox(height: xs.h);
  static Widget verticalSpaceSm = SizedBox(height: sm.h);
  static Widget verticalSpaceMd = SizedBox(height: md.h);
  static Widget verticalSpaceLg = SizedBox(height: lg.h);
  static Widget verticalSpaceXl = SizedBox(height: xl.h);
  static Widget verticalSpaceXxl = SizedBox(height: xxl.h);
  static Widget verticalSpaceXxxl = SizedBox(height: xxxl.h);

  // Horizontal Spacing (Width)
  static Widget horizontalSpaceXs = SizedBox(width: xs.w);
  static Widget horizontalSpaceSm = SizedBox(width: sm.w);
  static Widget horizontalSpaceMd = SizedBox(width: md.w);
  static Widget horizontalSpaceLg = SizedBox(width: lg.w);
  static Widget horizontalSpaceXl = SizedBox(width: xl.w);
  static Widget horizontalSpaceXxl = SizedBox(width: xxl.w);

  // Screen Padding
  static EdgeInsetsGeometry screenPadding = EdgeInsets.symmetric(horizontal: lg.w);
  
  // Custom spacing helper
  static Widget vertical(double height) => SizedBox(height: height.h);
  static Widget horizontal(double width) => SizedBox(width: width.w);
}
