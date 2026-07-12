import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? buttonBorderColor;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? buttonFontSize;
  final FontWeight? fontWeight;
  final Color? buttonTextColor;
  final double? buttonRadius;
  final void Function()? onPressed;
  final Widget? child;

  const PrimaryButtonWidget({
    super.key,
    this.buttonText,
    this.buttonColor,
    this.buttonBorderColor,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonFontSize,
    this.fontWeight,
    this.buttonTextColor,
    this.buttonRadius,
    this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: buttonTextColor ?? AppColors.whiteColor,
        fixedSize: Size(buttonWidth ?? 331.w, buttonHeight ?? 56.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius ?? 8.0.r),
          side: BorderSide(color: buttonBorderColor ?? AppColors.primaryColor),
        ),
        textStyle: AppTextStyles.primaryButtonText,
      ),
      onPressed: onPressed,
      child:
          child ??
          Text(
            buttonText ?? '',
            style: AppTextStyles.primaryButtonText.copyWith(
              color: buttonTextColor ?? AppColors.whiteColor,
              fontSize: buttonFontSize?.sp,
              fontWeight: fontWeight,
            ),
          ),
    );
  }
}
