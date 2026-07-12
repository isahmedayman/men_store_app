import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:men_store_app/core/constants/app_assets.dart';
import 'package:men_store_app/core/routing/app_routes.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';

Future<bool?> showLogoutConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (_) => const _LogoutConfirmationDialog(),
  );
}

class _LogoutConfirmationDialog extends StatelessWidget {
  const _LogoutConfirmationDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 78.w,
              height: 78.h,
              child: SvgPicture.asset(AppAssets.warningIcon),
            ),
            const HeightSpace(height: 12),
            Text('Logout?', style: AppTextStyles.bodyTitle),
            const HeightSpace(height: 8),
            Text(
              'Are you sure you want to logout?',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyText.copyWith(
                color: AppColors.greyColor,
              ),
            ),
            const HeightSpace(height: 24),
            SizedBox(
              width: 293.w,
              height: 54.h,
              child: FilledButton(
                onPressed: () => context.go(AppRoutes.logInScreen),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.redColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  'Yes, Logout',
                  style: AppTextStyles.bodyText.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const HeightSpace(height: 12),
            SizedBox(
              width: 293.w,
              height: 54.h,
              child: FilledButton(
                onPressed: () => context.pop(),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    side: const BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                ),
                child: Text(
                  'No, Cancel',
                  style: AppTextStyles.bodyText.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
