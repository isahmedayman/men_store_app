import 'package:equatable/equatable.dart';

class CartItemModel extends Equatable {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final String thumbnail;

  const CartItemModel({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.thumbnail,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      quantity: json['quantity'] as int? ?? 0,
      thumbnail: json['thumbnail'] as String? ?? '',
    );
  }

  CartItemModel copyWith({
    int? id,
    String? title,
    double? price,
    int? quantity,
    String? thumbnail,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  List<Object?> get props => [id, title, price, quantity, thumbnail];
}
