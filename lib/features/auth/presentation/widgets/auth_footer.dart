import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.questionText,
    required this.actionText,
    required this.onPressed,
  });

  final String questionText;
  final String actionText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          style: AppTextStyles.bodyText.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.greyColor,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            actionText,
            style: AppTextStyles.bodyText.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}