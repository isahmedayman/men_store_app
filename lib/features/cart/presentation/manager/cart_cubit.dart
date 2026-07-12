import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men_store_app/core/network/network_exceptions.dart';
import 'package:men_store_app/features/cart/data/models/cart_item_model.dart';
import 'package:men_store_app/features/cart/data/repositories/cart_repository.dart';
import 'package:men_store_app/features/cart/presentation/manager/cart_state.dart';
import 'package:men_store_app/features/products/data/models/product_model.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository repository;

  CartCubit(this.repository) : super(const CartState());

  Future<void> loadCart({int userId = 1}) async {
    emit(state.copyWith(status: CartStatus.loading));

    try {
      final cart = await repository.getUserCart(userId);

      emit(state.copyWith(status: CartStatus.loaded, items: cart.products));
    } catch (e) {
      emit(
        state.copyWith(status: CartStatus.error, errorMessage: _messageOf(e)),
      );
    }
  }

  void addProduct(ProductModel product) {
    final items = List<CartItemModel>.from(state.items);

    final index = items.indexWhere((e) => e.id == product.id);

    if (index != -1) {
      items[index] = items[index].copyWith(quantity: items[index].quantity + 1);
    } else {
      items.add(
        CartItemModel(
          id: product.id,
          title: product.title,
          price: product.price,
          quantity: 1,
          thumbnail: product.thumbnail,
        ),
      );
    }

    emit(state.copyWith(items: items));
  }

  void removeProduct(int productId) {
    final items = List<CartItemModel>.from(state.items)
      ..removeWhere((e) => e.id == productId);

    emit(state.copyWith(items: items));
  }

  void increaseQuantity(int productId) {
    final items = List<CartItemModel>.from(state.items);

    final index = items.indexWhere((e) => e.id == productId);

    if (index == -1) return;

    items[index] = items[index].copyWith(quantity: items[index].quantity + 1);

    emit(state.copyWith(items: items));
  }

  void decreaseQuantity(int productId) {
    final items = List<CartItemModel>.from(state.items);

    final index = items.indexWhere((e) => e.id == productId);

    if (index == -1) return;

    if (items[index].quantity == 1) {
      items.removeAt(index);
    } else {
      items[index] = items[index].copyWith(quantity: items[index].quantity - 1);
    }

    emit(state.copyWith(items: items));
  }

  void clearCart() {
    emit(const CartState(status: CartStatus.loaded));
  }

  String _messageOf(Object e) {
    if (e is ServerException) {
      return e.message;
    }

    return 'An unexpected error occurred. Please try again.';
  }
}
