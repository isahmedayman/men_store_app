import 'package:equatable/equatable.dart';
import 'package:men_store_app/features/address_book/data/models/address_model.dart';

enum AddressStatus { initial, loading, loaded, error }

class AddressState extends Equatable {
  final AddressStatus status;
  final List<AddressModel> addresses;
  final String errorMessage;

  const AddressState({
    this.status = AddressStatus.initial,
    this.addresses = const [],
    this.errorMessage = '',
  });

  bool get isLoading => status == AddressStatus.loading;

  bool get hasError => status == AddressStatus.error;

  bool get isEmpty => status == AddressStatus.loaded && addresses.isEmpty;

  AddressState copyWith({
    AddressStatus? status,
    List<AddressModel>? addresses,
    String? errorMessage,
  }) {
    return AddressState(
      status: status ?? this.status,
      addresses: addresses ?? this.addresses,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, addresses, errorMessage];
}
