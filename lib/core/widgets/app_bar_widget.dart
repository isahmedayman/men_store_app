import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:men_store_app/core/constants/app_assets.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool isAccountScreen;

  const AppBarWidget({
    super.key,
    required this.text,
    this.isAccountScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text, style: AppTextStyles.appBarTitle),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(Icons.arrow_back, color: AppColors.blackColor),
      ),
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      actions: [
        if (!isAccountScreen)
          InkWell(
            child: Container(
              alignment: Alignment.center,
              width: 24.w,
              height: 24.h,
              margin: EdgeInsets.only(right: 20.w),
              child: SvgPicture.asset(AppAssets.notificationIcon),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
