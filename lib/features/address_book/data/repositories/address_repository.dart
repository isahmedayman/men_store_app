import 'package:men_store_app/features/address_book/data/data_source/address_remote_data_source.dart';
import 'package:men_store_app/features/address_book/data/models/address_model.dart';

class AddressRepository {
  final AddressRemoteDataSource remoteDataSource;

  const AddressRepository(this.remoteDataSource);

  Future<List<AddressModel>> getAddresses() => remoteDataSource.getAddresses();
}
