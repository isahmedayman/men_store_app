import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men_store_app/core/network/network_exceptions.dart';
import 'package:men_store_app/features/address_book/data/repositories/address_repository.dart';
import 'package:men_store_app/features/address_book/presentation/manager/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressRepository repository;

  AddressCubit(this.repository) : super(const AddressState());

  Future<void> loadAddresses() async {
    emit(state.copyWith(status: AddressStatus.loading));

    try {
      final addresses = await repository.getAddresses();

      emit(state.copyWith(status: AddressStatus.loaded, addresses: addresses));
    } catch (e) {
      emit(
        state.copyWith(
          status: AddressStatus.error,
          errorMessage: _messageOf(e),
        ),
      );
    }
  }

  String _messageOf(Object e) => e is ServerException
      ? e.message
      : 'An unexpected error occurred. Please try again.';
}
