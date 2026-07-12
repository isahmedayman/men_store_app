import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/widgets/app_bar_widget.dart';
import 'package:men_store_app/features/products/data/models/product_model.dart';
import 'package:men_store_app/features/products/presentation/screens/product_details_screen/widgets/product_bottom_bar.dart';
import 'package:men_store_app/features/products/presentation/screens/product_details_screen/widgets/product_image_widget.dart';
import 'package:men_store_app/features/products/presentation/screens/product_details_screen/widgets/product_info_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const AppBarWidget(text: 'Details'),
      bottomNavigationBar: ProductBottomBar(product: product),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Column(
            children: [
              ProductImageWidget(image: product.thumbnail),
              ProductInfoWidget(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
