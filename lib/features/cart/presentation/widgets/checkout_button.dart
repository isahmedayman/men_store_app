import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/widgets/primary_button_widget.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return PrimaryButtonWidget(
      buttonColor: AppColors.primaryColor,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Go To Checkout',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 8.w),
          const Icon(
            Icons.arrow_forward,
            color: AppColors.whiteColor,
            size: 20,
          ),
        ],
      ),
    );
  }
}
