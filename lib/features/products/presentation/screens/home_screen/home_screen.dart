import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';
import 'package:men_store_app/features/products/presentation/screens/home_screen/widgets/categories_list.dart';
import 'package:men_store_app/features/products/presentation/screens/home_screen/widgets/home_search_section.dart';
import 'package:men_store_app/features/products/presentation/screens/home_screen/widgets/products_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 30.h),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Discover', style: AppTextStyles.bodyTitle),
            ),
            const HeightSpace(height: 16),
            HomeSearchSection(controller: _searchController),
            const HeightSpace(height: 16),
            CategoriesList(),
            const HeightSpace(height: 16),
            const Expanded(child: ProductsGrid()),
          ],
        ),
      ),
    );
  }
}
