import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';

class ProductItemCard extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;

  const ProductItemCard({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: SizedBox(width: double.infinity, child: _buildImage()),
          ),
        ),
        const HeightSpace(height: 8),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodyText.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        const HeightSpace(height: 4),
        Text(
          price,
          style: AppTextStyles.bodyText.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF808080),
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    if (imagePath.isEmpty) {
      return Container(
        color: AppColors.greyColor,
        alignment: Alignment.center,
        child: const Icon(Icons.image_not_supported_outlined),
      );
    }
    return Image.network(
      imagePath,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Container(
          color: AppColors.greyColor,
          alignment: Alignment.center,
          child: const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) => Container(
        color: AppColors.greyColor,
        alignment: Alignment.center,
        child: const Icon(Icons.image_not_supported_outlined),
      ),
    );
  }
}
