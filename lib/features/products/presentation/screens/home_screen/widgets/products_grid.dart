import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:men_store_app/core/routing/app_routes.dart';
import 'package:men_store_app/features/products/presentation/manager/products_cubit.dart';
import 'package:men_store_app/features/products/presentation/manager/products_state.dart';
import 'package:men_store_app/features/products/presentation/screens/home_screen/widgets/message_view.dart';
import 'package:men_store_app/features/products/presentation/screens/home_screen/widgets/product_item_card.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.hasError) {
          return MessageView(
            message: state.errorMessage,
            actionLabel: 'Try again',
            onAction: () => context.read<ProductsCubit>().loadHomeData(),
          );
        }

        if (state.isEmpty) {
          return const MessageView(message: 'No products found.');
        }

        return GridView.builder(
          itemCount: state.visibleProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.h,
            crossAxisSpacing: 20.w,
            childAspectRatio: 0.62,
          ),
          itemBuilder: (context, index) {
            final product = state.visibleProducts[index];
            return GestureDetector(
              onTap: () =>
                  context.push(AppRoutes.productDetailsScreen, extra: product),
              child: ProductItemCard(
                title: product.title,
                price: product.formattedPrice,
                imagePath: product.thumbnail,
              ),
            );
          },
        );
      },
    );
  }
}
