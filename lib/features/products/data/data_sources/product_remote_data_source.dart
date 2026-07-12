import 'package:dio/dio.dart';
import 'package:men_store_app/core/network/api_endpoints.dart';
import 'package:men_store_app/core/network/network_exceptions.dart';
import 'package:men_store_app/features/products/data/models/category_model.dart';
import 'package:men_store_app/features/products/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> searchProducts(String title);
  Future<List<ProductModel>> getProductsByCategory(int categoryId);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  const ProductRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await dio.get(ApiEndpoints.products);
      return _mapProducts(response.data);
    } on DioException catch (e) {
      throw ServerException(resolveDioError(e));
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await dio.get(ApiEndpoints.categories);
      final data = response.data as List;
      return data
          .map((json) => CategoryModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ServerException(resolveDioError(e));
    }
  }

  @override
  Future<List<ProductModel>> searchProducts(String title) async {
    try {
      final response = await dio.get(ApiEndpoints.searchProducts(title));
      return _mapProducts(response.data);
    } on DioException catch (e) {
      throw ServerException(resolveDioError(e));
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
    try {
      final response = await dio.get(
        ApiEndpoints.productsByCategory(categoryId),
      );
      return _mapProducts(response.data);
    } on DioException catch (e) {
      throw ServerException(resolveDioError(e));
    }
  }

  List<ProductModel> _mapProducts(dynamic data) {
    final list = data as List;
    return list
        .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
