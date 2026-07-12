import 'package:dio/dio.dart';
import 'package:men_store_app/core/network/api_endpoints.dart';
import 'package:men_store_app/core/network/network_exceptions.dart';
import 'package:men_store_app/features/cart/data/models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getUserCart(int userId);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final Dio dio;

  const CartRemoteDataSourceImpl(this.dio);

  @override
  Future<CartModel> getUserCart(int userId) async {
    try {
      final response = await dio.get(ApiEndpoints.userCart(userId));

      final data = response.data['carts'] as List<dynamic>;

      return CartModel.fromJson(data.first as Map<String, dynamic>);
    } on DioException catch (e) {
      throw ServerException(resolveDioError(e));
    }
  }
}

class CartRepository {
  final CartRemoteDataSource remoteDataSource;

  const CartRepository(this.remoteDataSource);

  Future<CartModel> getUserCart(int userId) {
    return remoteDataSource.getUserCart(userId);
  }
}
