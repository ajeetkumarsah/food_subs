import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:food_subs/data/api/api_client.dart';
import 'package:food_subs/utils/app_constants.dart';
import 'package:food_subs/data/models/home_banner_model.dart';

class Repository {
  final ApiClient apiClient;

  Repository({required this.apiClient});

  Future<List<dynamic>> fetchKitchens() async {
    final response = await apiClient.getKitchens(AppConstants.kitchesUri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load kitchens');
    }
  }

  Future<List<dynamic>> fetchTopKitchens() async {
    final response = await apiClient.getTopKitchens(AppConstants.topKitchesUri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load top kitchens');
    }
  }

  Future<HomeBannerModel> fetchHomeBanner() async {
    final http.Response response = await apiClient.getBanner();

    if (response.statusCode == 200) {
      return homeBannerModelFromJson(response.body);
    } else {
      throw Exception('Failed to load top kitchens');
    }
  }
}
