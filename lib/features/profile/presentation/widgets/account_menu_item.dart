import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';

class AccountMenuItem extends StatelessWidget {
  final String iconName;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? labelColor;
  final bool showChevron;

  const AccountMenuItem({
    super.key,
    required this.iconName,
    required this.label,
    required this.onTap,
    this.iconColor,
    this.labelColor,
    this.showChevron = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        child: SizedBox(
          height: 48.h,
          child: Row(
            children: [
              SizedBox(
                width: 24.w,
                height: 24.h,
                child: SvgPicture.asset(
                  iconName,
                  colorFilter: ColorFilter.mode(
                    iconColor ?? AppColors.blackColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  label,
                  style: AppTextStyles.bodyText.copyWith(
                    color: labelColor ?? AppColors.blackColor,
                  ),
                ),
              ),
              if (showChevron)
                Icon(
                  Icons.chevron_right,
                  size: 22.sp,
                  color: AppColors.greyColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
