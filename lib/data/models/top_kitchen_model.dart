class TopKitchenModel {
  final int? createdAt;
  final String? title;
  final String? image;
  final String? id;

  TopKitchenModel({
    this.createdAt,
    this.title,
    this.image,
    this.id,
  });

  factory TopKitchenModel.fromJson(Map<String, dynamic> json) =>
      TopKitchenModel(
        createdAt: json["createdAt"],
        title: json["title"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "title": title,
        "image": image,
        "id": id,
      };
}
