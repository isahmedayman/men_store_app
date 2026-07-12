import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';
import 'package:men_store_app/features/products/data/models/category_model.dart';
import 'package:men_store_app/features/products/presentation/manager/products_cubit.dart';
import 'package:men_store_app/features/products/presentation/manager/products_state.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) =>
          previous.categories != current.categories ||
          previous.selectedCategory != current.selectedCategory,
      builder: (context, state) {
        final chips = <CategoryModel?>[null, ...state.categories];
        return SizedBox(
          height: 40.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const WidthSpace(width: 8),
            itemCount: chips.length,
            itemBuilder: (context, index) {
              final category = chips[index];
              final isSelected = category?.id == state.selectedCategory?.id;
              return GestureDetector(
                onTap: () =>
                    context.read<ProductsCubit>().selectCategory(category),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    border: isSelected
                        ? null
                        : Border.all(color: AppColors.greyColor),
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    category?.name ?? 'All',
                    style: isSelected
                        ? AppTextStyles.bodyText.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.whiteColor,
                          )
                        : AppTextStyles.bodyText,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
