import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store_app/core/theme/app_colors.dart';

class ProfileMenuDivider extends StatelessWidget {
  final double indent;
  final double thickness;
  final Color color;

  const ProfileMenuDivider({
    super.key,
    this.indent = 48,
    this.thickness = 1,
    this.color = AppColors.greyColor,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: indent.w,
      endIndent: 0,
      height: 1.h,
      thickness: thickness,
      color: color,
    );
  }
}
