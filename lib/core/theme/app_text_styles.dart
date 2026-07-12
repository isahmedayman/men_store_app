import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/theme/app_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle _style({
    required double size,
    required FontWeight weight,
    Color? color,
  }) {
    return GoogleFonts.getFont(
      AppFonts.primaryFont,
      fontSize: size.sp,
      fontWeight: weight,
      height: 1.3,
    );
  }

  static final appBarTitle = _style(
    size: 24,
    weight: FontWeight.w600,
    color: AppColors.blackColor,
  );
  static final bodyTitle = _style(
    size: 28,
    weight: FontWeight.w600,
    color: AppColors.blackColor,
  );

  static final bodyText = _style(
    size: 16,
    weight: FontWeight.w400,
    color: AppColors.greyColor,
  );

  static final primaryButtonText = _style(size: 16, weight: FontWeight.w600);
  static final textFormFieldHintText = _style(
    size: 16,
    weight: FontWeight.w500,
    color: AppColors.blackColor,
  );
  static final textFormFieldLabel = _style(size: 16, weight: FontWeight.w600);

  static final bottomNavBarText = _style(
    size: 12,
    weight: FontWeight.w500,
    color: AppColors.greyColor,
  );
}
