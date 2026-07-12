import 'package:equatable/equatable.dart';
import 'package:men_store_app/features/products/data/models/category_model.dart';

class ProductModel extends Equatable {
  final int id;
  final String title;
  final double price;
  final String description;
  final CategoryModel category;
  final List<String> images;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      description: json['description'] as String? ?? '',
      category: json['category'] is Map<String, dynamic>
          ? CategoryModel.fromJson(json['category'] as Map<String, dynamic>)
          : const CategoryModel(id: 0, name: '', image: ''),
      images: _parseImages(json['images']),
    );
  }

  static List<String> _parseImages(dynamic raw) {
    if (raw is! List) return [];
    return raw
        .map((e) => e.toString().replaceAll(RegExp(r'["\[\]]'), '').trim())
        .where((url) => url.isNotEmpty)
        .toList();
  }

  String get thumbnail => images.isNotEmpty ? images.first : '';

  String get formattedPrice => '\$${price.toStringAsFixed(0)}';

  @override
  List<Object?> get props => [id, title, price, description, category, images];
}
