import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marquee/marquee.dart';
import 'package:men_store_app/core/constants/app_assets.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
    this.onAdd,
    this.onRemove,
    this.onDelete,
  });

  final String title;
  final String price;
  final String image;
  final int quantity;

  final VoidCallback? onAdd;
  final VoidCallback? onRemove;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342.w,
      height: 107.h,
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Color(0xFFE6E6E6)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: Image.network(
              image,
              width: 90.w,
              height: 90.h,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 90.w,
                height: 90.h,
                color: AppColors.greyColor,
                child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          WidthSpace(width: 16.w),
          SizedBox(
            height: 90.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100.w,
                  height: 16.h,
                  child: Marquee(
                    text: title,
                    style: AppTextStyles.bodyText.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    velocity: 50,
                    blankSpace: 20.w,
                    pauseAfterRound: const Duration(milliseconds: 1000),
                  ),
                ),
                Text(
                  price,
                  style: AppTextStyles.bodyText.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 90.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onDelete,
                  child: SizedBox(
                    height: 16.h,
                    width: 16.w,
                    child: SvgPicture.asset(
                      AppAssets.deleteIcon,
                      colorFilter: ColorFilter.mode(
                        AppColors.redColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    _QuantityButton(icon: Icons.remove, onTap: onRemove),
                    SizedBox(width: 9.w),
                    Text(quantity.toString(), style: AppTextStyles.bodyText),
                    SizedBox(width: 9.w),
                    _QuantityButton(icon: Icons.add, onTap: onAdd),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      onTap: onTap,
      child: Container(
        width: 22.5.w,
        height: 22.5.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(3.r),
        ),
        child: Icon(icon, size: 14),
      ),
    );
  }
}
