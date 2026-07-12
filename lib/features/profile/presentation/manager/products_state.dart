import 'package:equatable/equatable.dart';
import 'package:men_store_app/features/products/data/models/category_model.dart';
import 'package:men_store_app/features/products/data/models/product_model.dart';

enum ProductsStatus { initial, loading, loaded, error }

class ProductsState extends Equatable {
  final ProductsStatus status;
  final List<ProductModel> products;
  final List<CategoryModel> categories;

  final CategoryModel? selectedCategory;
  final String searchQuery;
  final String errorMessage;

  const ProductsState({
    this.status = ProductsStatus.initial,
    this.products = const [],
    this.categories = const [],
    this.selectedCategory,
    this.searchQuery = '',
    this.errorMessage = '',
  });

  bool get isLoading => status == ProductsStatus.loading;
  bool get hasError => status == ProductsStatus.error;
  bool get isEmpty => status == ProductsStatus.loaded && products.isEmpty;

  ProductsState copyWith({
    ProductsStatus? status,
    List<ProductModel>? products,
    List<CategoryModel>? categories,
    CategoryModel? selectedCategory,
    bool clearSelectedCategory = false,
    String? searchQuery,
    String? errorMessage,
  }) {
    return ProductsState(
      status: status ?? this.status,
      products: products ?? this.products,
      categories: categories ?? this.categories,
      selectedCategory: clearSelectedCategory
          ? null
          : (selectedCategory ?? this.selectedCategory),
      searchQuery: searchQuery ?? this.searchQuery,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    products,
    categories,
    selectedCategory,
    searchQuery,
    errorMessage,
  ];
}
