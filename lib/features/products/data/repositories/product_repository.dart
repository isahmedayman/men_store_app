import 'package:men_store_app/features/products/data/data_sources/product_remote_data_source.dart';
import 'package:men_store_app/features/products/data/models/category_model.dart';
import 'package:men_store_app/features/products/data/models/product_model.dart';

class ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  const ProductRepository(this.remoteDataSource);

  Future<List<ProductModel>> getAllProducts() =>
      remoteDataSource.getAllProducts();

  Future<List<CategoryModel>> getCategories() =>
      remoteDataSource.getCategories();

  Future<List<ProductModel>> searchProducts(String title) =>
      remoteDataSource.searchProducts(title);

  Future<List<ProductModel>> getProductsByCategory(int categoryId) =>
      remoteDataSource.getProductsByCategory(categoryId);
}
