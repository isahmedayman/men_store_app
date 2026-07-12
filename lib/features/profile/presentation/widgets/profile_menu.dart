import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:men_store_app/core/constants/app_assets.dart';
import 'package:men_store_app/core/routing/app_routes.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';
import 'package:men_store_app/features/profile/presentation/widgets/account_menu_item.dart';
import 'package:men_store_app/features/profile/presentation/widgets/profile_menu_devider.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeightSpace(height: 14),
        Divider(color: AppColors.greyColor, height: 1.h),
        AccountMenuItem(
          iconName: AppAssets.orderIcon,
          label: 'My Orders',
          onTap: () {},
        ),
        ProfileMenuDivider(indent: 0.w, thickness: 8.h),
        AccountMenuItem(
          iconName: AppAssets.accountDetailsIcon,
          label: 'My Details',
          onTap: () {},
        ),
        Divider(color: AppColors.greyColor, height: 1.h),
        AccountMenuItem(
          iconName: AppAssets.addressIcon,
          label: 'Address Book',
          onTap: () => context.pushNamed(AppRoutes.addressBookScreen),
        ),
        Divider(color: AppColors.greyColor, height: 1.h),
        AccountMenuItem(
          iconName: AppAssets.faqsIcon,
          label: 'FAQs',
          onTap: () {},
        ),
        Divider(color: AppColors.greyColor, height: 1.h),
        AccountMenuItem(
          iconName: AppAssets.helpCenterIcon,
          label: 'Help Center',
          onTap: () {},
        ),
        ProfileMenuDivider(
          indent: 0.w,
          thickness: 8.h,
          color: Color(0xFFE6E6E6),
        ),
      ],
    );
  }
}
