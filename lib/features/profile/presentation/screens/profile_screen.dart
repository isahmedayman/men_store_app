import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:men_store_app/core/constants/app_assets.dart';
import 'package:men_store_app/core/routing/app_routes.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/widgets/app_bar_widget.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';
import 'package:men_store_app/features/profile/presentation/widgets/account_menu_item.dart';
import 'package:men_store_app/features/profile/presentation/widgets/logout_confirmation_dialog.dart';
import 'package:men_store_app/features/profile/presentation/widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    final confirmed = await showLogoutConfirmationDialog(context);

    if (confirmed == true && context.mounted) {
      context.go(AppRoutes.logInScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(text: 'Account'),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileMenu(),
            const Spacer(),
            AccountMenuItem(
              iconName: AppAssets.logoutIcon,
              label: 'Logout',
              iconColor: Colors.red,
              labelColor: Colors.red,
              showChevron: false,
              onTap: () {
                _handleLogout(context);
              },
            ),
            const HeightSpace(height: 16),
          ],
        ),
      ),
    );
  }
}
