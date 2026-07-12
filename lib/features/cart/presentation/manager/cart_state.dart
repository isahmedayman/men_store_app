import 'package:equatable/equatable.dart';
import 'package:men_store_app/features/cart/data/models/cart_item_model.dart';

enum CartStatus { initial, loading, loaded, error }

class CartState extends Equatable {
  final CartStatus status;
  final List<CartItemModel> items;
  final String errorMessage;

  const CartState({
    this.status = CartStatus.initial,
    this.items = const [],
    this.errorMessage = '',
  });

  CartState copyWith({
    CartStatus? status,
    List<CartItemModel>? items,
    String? errorMessage,
  }) {
    return CartState(
      status: status ?? this.status,
      items: items ?? this.items,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get isLoading => status == CartStatus.loading;

  bool get hasError => status == CartStatus.error;

  bool get isEmpty => status == CartStatus.loaded && items.isEmpty;

  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal =>
      items.fold(0.0, (sum, item) => sum + item.price * item.quantity);

  double get shipping => items.isEmpty ? 0 : 80;

  double get vat => 0;

  double get total => subtotal + shipping + vat;

  @override
  List<Object?> get props => [status, items, errorMessage];
}
