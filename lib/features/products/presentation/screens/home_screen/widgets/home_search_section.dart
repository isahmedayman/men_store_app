import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:men_store_app/core/constants/app_assets.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/widgets/primary_input_field_widget.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';
import 'package:men_store_app/features/products/presentation/manager/products_cubit.dart';

class HomeSearchSection extends StatelessWidget {
  final TextEditingController controller;
  const HomeSearchSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryInputFieldWidget(
          controller: controller,
          onChanged: context.read<ProductsCubit>().searchChanged,
          width: 281.w,
          height: 51.h,
          borderWidth: 1,
          borderRadius: 10.r,
          isSearchField: true,
          isPassword: false,
          fillColor: AppColors.whiteColor,
          borderColor: AppColors.greyColor,
          hintText: 'Search for clothes',
          prefixIcon: SvgPicture.asset(AppAssets.searchIcon),
        ),
        const WidthSpace(width: 8),
        Container(
          width: 51.w,
          height: 51.h,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: SvgPicture.asset(
            AppAssets.filterIcon,
            colorFilter: ColorFilter.mode(
              AppColors.whiteColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
