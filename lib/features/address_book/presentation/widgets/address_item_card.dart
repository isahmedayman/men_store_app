import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marquee/marquee.dart';
import 'package:men_store_app/core/constants/app_assets.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';

class AddressItemCard extends StatelessWidget {
  const AddressItemCard({
    super.key,
    required this.name,
    required this.description,
    this.isDefault = false,
  });

  final String name;
  final String description;
  final bool isDefault;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 340.w,
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xFFE6E6E6)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 25.w,
            height: 76.h,
            child: SvgPicture.asset(AppAssets.locationIcon),
          ),
          WidthSpace(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 125.w,
                    height: 20.h,
                    child: Marquee(
                      text: name,
                      style: AppTextStyles.bodyText,
                      scrollAxis: Axis.horizontal,
                      blankSpace: 20.w,
                      velocity: 100.0,
                      pauseAfterRound: const Duration(seconds: 1),
                    ),
                  ),

                  WidthSpace(width: 8),
                  if (isDefault) const WidthSpace(width: 8),
                  Container(
                    height: 20.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6E6E6),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      'Default',
                      style: AppTextStyles.bodyText.copyWith(fontSize: 10.sp),
                    ),
                  ),
                ],
              ),
              HeightSpace(height: 2),
              SizedBox(
                width: 225.w,
                height: 20.h,
                child: Marquee(
                  text: description,
                  style: AppTextStyles.bodyText.copyWith(
                    color: const Color(0xFF808080),
                  ),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 20.w,
                  velocity: 100.0,
                  pauseAfterRound: const Duration(seconds: 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
