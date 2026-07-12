import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:men_store_app/core/constants/app_assets.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.cartIcon,
              width: 100.w,
              height: 100.h,
              colorFilter: ColorFilter.mode(
                AppColors.greyColor,
                BlendMode.srcIn,
              ),
            ),
            const HeightSpace(height: 24),
            Text(
              'Your cart is empty',
              style: AppTextStyles.bodyTitle,
              textAlign: TextAlign.center,
            ),
            const HeightSpace(height: 8),

            Text(
              'Looks like you haven\'t added anything to your cart yet.',
              style: AppTextStyles.bodyText.copyWith(
                color: AppColors.greyColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
