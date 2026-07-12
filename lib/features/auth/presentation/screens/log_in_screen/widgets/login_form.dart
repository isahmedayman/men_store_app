import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/widgets/primary_input_field_widget.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryInputFieldWidget(
          controller: emailController,
          width: 341.w,
          height: 51.h,
          borderWidth: 1,
          borderRadius: 10.r,
          labelText: 'Email Address',
          hintText: 'Enter your email address',
          fillColor: AppColors.whiteColor,
          borderColor: AppColors.greyColor,
        ),
        const HeightSpace(height: 16),
        PrimaryInputFieldWidget(
          controller: passwordController,
          width: 341.w,
          height: 51.h,
          borderWidth: 1,
          borderRadius: 10.r,
          labelText: 'Password',
          hintText: 'Enter your password',
          isPassword: true,
          fillColor: AppColors.whiteColor,
          borderColor: AppColors.greyColor,
        ),
      ],
    );
  }
}
