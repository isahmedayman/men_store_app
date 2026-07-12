import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';
import 'package:men_store_app/features/products/data/models/product_model.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.h),
        Text(product.title, style: AppTextStyles.bodyTitle),
        const HeightSpace(height: 12),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber),
            SizedBox(width: 6.w),
            Text('4.0/5 ', style: AppTextStyles.bodyText),
            Text(
              '(45 Reviews)',
              style: AppTextStyles.bodyText.copyWith(
                color: const Color(0xFF808080),
              ),
            ),
          ],
        ),
        const HeightSpace(height: 24),
        Text(
          "Description",
          style: AppTextStyles.bodyTitle.copyWith(fontSize: 24.sp),
        ),
        const HeightSpace(height: 8),
        Text(product.description, style: AppTextStyles.bodyText),
      ],
    );
  }
}
