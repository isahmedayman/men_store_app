import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men_store_app/core/network/network_exceptions.dart';
import 'package:men_store_app/features/products/data/models/category_model.dart';
import 'package:men_store_app/features/products/data/models/product_model.dart';
import 'package:men_store_app/features/products/data/repositories/product_repository.dart';
import 'package:men_store_app/features/products/presentation/manager/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepository repository;
  Timer? _searchDebounce;

  ProductsCubit(this.repository) : super(const ProductsState());

  Future<void> loadHomeData() async {
    emit(state.copyWith(status: ProductsStatus.loading));
    try {
      final results = await Future.wait([
        repository.getAllProducts(),
        repository.getCategories(),
      ]);
      final products = results[0] as List<ProductModel>;
      final categories = results[1] as List<CategoryModel>;
      emit(
        state.copyWith(
          status: ProductsStatus.loaded,
          allProducts: products,
          visibleProducts: products,
          categories: categories,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductsStatus.error,
          errorMessage: _messageOf(e),
        ),
      );
    }
  }

  void selectCategory(CategoryModel? category) {
    if (category?.id == state.selectedCategory?.id) return;

    emit(
      state.copyWith(
        selectedCategory: category,
        clearSelectedCategory: category == null,
        visibleProducts: _filterProducts(
          query: state.searchQuery,
          category: category,
        ),
      ),
    );
  }

  void searchChanged(String query) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(
      const Duration(milliseconds: 500),
      () => _performSearch(query),
    );
  }

  void _performSearch(String query) {
    emit(
      state.copyWith(
        searchQuery: query,
        visibleProducts: _filterProducts(
          query: query,
          category: state.selectedCategory,
        ),
      ),
    );
  }

  String _messageOf(Object e) => e is ServerException
      ? e.message
      : 'An unexpected error occurred. Please try again.';
  List<ProductModel> _filterProducts({
    required String query,
    required CategoryModel? category,
  }) {
    Iterable<ProductModel> products = state.allProducts;

    if (category != null) {
      products = products.where(
        (product) => product.category.id == category.id,
      );
    }

    if (query.trim().isNotEmpty) {
      final search = query.trim().toLowerCase();

      products = products.where(
        (product) => product.title.toLowerCase().contains(search),
      );
    }

    return products.toList();
  }

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    return super.close();
  }
}
