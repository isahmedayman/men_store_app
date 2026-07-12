import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men_store_app/core/network/network_exceptions.dart';
import 'package:men_store_app/features/products/data/models/category_model.dart';
import 'package:men_store_app/features/products/data/models/product_model.dart';
import 'package:men_store_app/features/products/data/repositories/product_repository.dart';
import 'package:men_store_app/features/profile/presentation/manager/products_state.dart';

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
      emit(
        state.copyWith(
          status: ProductsStatus.loaded,
          products: results[0] as List<ProductModel>,
          categories: results[1] as List<CategoryModel>,
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

  /// [category] = null means "All"
  Future<void> selectCategory(CategoryModel? category) async {
    if (category?.id == state.selectedCategory?.id) return;

    emit(
      state.copyWith(
        status: ProductsStatus.loading,
        selectedCategory: category,
        clearSelectedCategory: category == null,
      ),
    );
    try {
      final products = category == null
          ? await repository.getAllProducts()
          : await repository.getProductsByCategory(category.id);
      emit(state.copyWith(status: ProductsStatus.loaded, products: products));
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductsStatus.error,
          errorMessage: _messageOf(e),
        ),
      );
    }
  }

  void searchChanged(String query) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(
      const Duration(milliseconds: 500),
      () => _performSearch(query),
    );
  }

  Future<void> _performSearch(String query) async {
    final trimmed = query.trim();
    emit(state.copyWith(searchQuery: query, status: ProductsStatus.loading));
    try {
      final products = trimmed.isEmpty
          ? await repository.getAllProducts()
          : await repository.searchProducts(trimmed);
      emit(state.copyWith(status: ProductsStatus.loaded, products: products));
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductsStatus.error,
          errorMessage: _messageOf(e),
        ),
      );
    }
  }

  String _messageOf(Object e) => e is ServerException
      ? e.message
      : 'An unexpected error occurred. Please try again.';

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    return super.close();
  }
}
