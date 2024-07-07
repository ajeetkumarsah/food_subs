import 'package:equatable/equatable.dart';

class KitchenModel extends Equatable {
  final int? createdAt;
  final String? name;
  final String? avatar;
  final String? address;
  final List<String> images;
  final String? id;
  final String? rating;
  final String? totalRating;

  const KitchenModel({
    this.createdAt,
    this.name,
    this.avatar,
    this.address,
    required this.images,
    this.id,
    this.rating,
    this.totalRating,
  });

  @override
  List<Object?> get props => [id, name, createdAt, avatar, address, images];

  factory KitchenModel.fromJson(Map<String, dynamic> json) {
    return KitchenModel(
      createdAt: json["created_at"],
      name: json["name"],
      avatar: json["avatar"],
      address: json["address"],
      rating: json["rating"],
      totalRating: json["total_rating"],
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x.toString())),
      id: json["id"],
    );
  }
}
