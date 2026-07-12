import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:men_store_app/core/constants/app_assets.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';
import 'package:men_store_app/features/cart/presentation/manager/cart_cubit.dart';
import 'package:men_store_app/features/products/data/models/product_model.dart';

class ProductBottomBar extends StatelessWidget {
  const ProductBottomBar({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105.h,
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        bottom: 25.h,
        top: 20.h,
      ),
      decoration: BoxDecoration(
        border: const Border(top: BorderSide(color: Color(0xFFE6E6E6))),
        color: AppColors.whiteColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price', style: AppTextStyles.bodyText),
                Text(product.formattedPrice, style: AppTextStyles.bodyTitle),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              context.read<CartCubit>().addProduct(product);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Product added to cart')),
              );
            },
            child: Container(
              width: 240.w,
              height: 54.h,
              padding: EdgeInsets.symmetric(horizontal: 54.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssets.bagIcon,
                    colorFilter: const ColorFilter.mode(
                      AppColors.whiteColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  const WidthSpace(width: 10),
                  Text(
                    'Add to Cart',
                    style: AppTextStyles.primaryButtonText.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
