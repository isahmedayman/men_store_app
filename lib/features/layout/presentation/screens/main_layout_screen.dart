import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:men_store_app/core/constants/app_assets.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final currentIndex = navigationShell.currentIndex;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: navigationShell,
      bottomNavigationBar: Container(
        height: 85,
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
          border: Border(
            top: BorderSide(color: AppColors.greyColor, width: 1.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCustomTabItem(
              context: context,
              index: 0,
              currentIndex: currentIndex,
              iconPath: AppAssets.homeIcon,
              label: 'Home',
            ),
            _buildCustomTabItem(
              context: context,
              index: 1,
              currentIndex: currentIndex,
              iconPath: AppAssets.cartIcon,
              label: 'Cart',
            ),
            _buildCustomTabItem(
              context: context,
              index: 2,
              currentIndex: currentIndex,
              iconPath: AppAssets.accountIcon,
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomTabItem({
    required BuildContext context,
    required int index,
    required int currentIndex,
    required String iconPath,
    required String label,
  }) {
    final isSelected = index == currentIndex;

    final itemColor = isSelected ? AppColors.primaryColor : AppColors.greyColor;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          navigationShell.goBranch(
            index,
            initialLocation: index == currentIndex,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(itemColor, BlendMode.srcIn),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.bodyText.copyWith(
                color: itemColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
