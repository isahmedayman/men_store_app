import 'package:dio/dio.dart';
import 'package:men_store_app/core/network/api_endpoints.dart';
import 'package:men_store_app/core/network/network_exceptions.dart';
import 'package:men_store_app/features/address_book/data/models/address_model.dart';

abstract class AddressRemoteDataSource {
  Future<List<AddressModel>> getAddresses();
}

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final Dio dio;

  const AddressRemoteDataSourceImpl(this.dio);

  @override
  Future<List<AddressModel>> getAddresses() async {
    try {
      final response = await dio.get(ApiEndpoints.locations);

      final data = response.data as List<dynamic>;

      return data
          .map<AddressModel>(
            (e) => AddressModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } on DioException catch (e) {
      throw ServerException(resolveDioError(e));
    }
  }
}
