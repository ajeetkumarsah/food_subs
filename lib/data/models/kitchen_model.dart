import 'package:equatable/equatable.dart';

class KitchenModel extends Equatable {
  final String? createdAt;
  final String? name;

  final String? address;
  final List<String> images;
  final String? id;
  final String? rating;
  final String? totalRating;

  const KitchenModel({
    this.createdAt,
    this.name,
    this.address,
    required this.images,
    this.id,
    this.rating,
    this.totalRating,
  });

  @override
  List<Object?> get props => [id, name, createdAt, address, images];

  factory KitchenModel.fromJson(Map<String, dynamic> json) {
    return KitchenModel(
      createdAt: json["created_at"].toString(),
      name: json["name"],
      address: json["address"],
      rating: json["rating"].toString(),
      totalRating: json["totalRatings"],
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x.toString())),
      id: json["id"].toString(),
    );
  }
}
