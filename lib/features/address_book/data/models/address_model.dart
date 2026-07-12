import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;

  const AddressModel({
    required this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
    );
  }

  @override
  List<Object?> get props => [id, name, description, latitude, longitude];
}
