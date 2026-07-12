import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/widgets/app_bar_widget.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';
import 'package:men_store_app/features/cart/presentation/manager/cart_cubit.dart';
import 'package:men_store_app/features/cart/presentation/manager/cart_state.dart';
import 'package:men_store_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:men_store_app/features/cart/presentation/widgets/cart_summary.dart';
import 'package:men_store_app/features/cart/presentation/widgets/checkout_button.dart';
import 'package:men_store_app/features/cart/presentation/widgets/empty_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const AppBarWidget(text: 'My Cart'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.hasError) {
              return Center(child: Text(state.errorMessage));
            }

            if (state.isEmpty) {
              return const EmptyCart();
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.only(top: 24.h),
                    itemCount: state.items.length,
                    separatorBuilder: (_, __) => const HeightSpace(height: 16),
                    itemBuilder: (_, index) {
                      final item = state.items[index];

                      return CartItem(
                        title: item.title,
                        image: item.thumbnail,
                        price: '\$${item.price.toStringAsFixed(0)}',
                        quantity: item.quantity,
                        onAdd: () {
                          context.read<CartCubit>().increaseQuantity(item.id);
                        },
                        onRemove: () {
                          context.read<CartCubit>().decreaseQuantity(item.id);
                        },
                        onDelete: () {
                          context.read<CartCubit>().removeProduct(item.id);
                        },
                      );
                    },
                  ),
                ),
                CartSummary(
                  subtotal: '\$${state.subtotal.toStringAsFixed(0)}',
                  vat: '\$${state.vat.toStringAsFixed(0)}',
                  shippingFee: '\$${state.shipping.toStringAsFixed(0)}',
                  total: '\$${state.total.toStringAsFixed(0)}',
                ),
                const HeightSpace(height: 24),
                CheckoutButton(onPressed: () {}),
                const HeightSpace(height: 24),
              ],
            );
          },
        ),
      ),
    );
  }
}
