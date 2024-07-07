import 'dart:convert';

HomeBannerModel homeBannerModelFromJson(String str) =>
    HomeBannerModel.fromJson(json.decode(str));

String homeBannerModelToJson(HomeBannerModel data) =>
    json.encode(data.toJson());

class HomeBannerModel {
  final String? body;

  HomeBannerModel({
    this.body,
  });

  factory HomeBannerModel.fromJson(Map<String, dynamic> json) =>
      HomeBannerModel(
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "body": body,
      };
}
