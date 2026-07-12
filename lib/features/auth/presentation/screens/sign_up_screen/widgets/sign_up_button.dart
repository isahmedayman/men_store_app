import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:men_store_app/core/routing/app_routes.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/widgets/primary_button_widget.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButtonWidget(
      buttonColor: AppColors.primaryColor,
      buttonTextColor: AppColors.whiteColor,
      buttonWidth: 325.w,
      buttonHeight: 50.h,
      buttonRadius: 10.r,
      buttonBorderColor: AppColors.primaryColor,
      buttonText: 'Sign Up',
      onPressed: () {
        context.go(AppRoutes.homeScreen);
      },
    );
  }
}
