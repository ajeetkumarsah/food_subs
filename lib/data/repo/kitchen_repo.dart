import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:food_subs/data/api/api_client.dart';
import 'package:food_subs/utils/app_constants.dart';
import 'package:food_subs/data/models/home_banner_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  final ApiClient apiClient;
  final SharedPreferences prefs;

  Repository({
    required this.apiClient,
    required this.prefs,
  });
//user pref
  Future<void> saveUserId(String userId) async {
    await prefs.setString(AppConstants.userId, userId);
  }

  String? getUserId() {
    return prefs.getString(AppConstants.userId);
  }

  //
  Future<List<dynamic>> fetchKitchens() async {
    final response = await apiClient.getKitchens(AppConstants.kitchesUri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (responseBody["status"].toString() == 'true' &&
          responseBody["data"].isNotEmpty) {
        return responseBody["data"];
      }
      return [];
    } else {
      throw Exception('Failed to load kitchens');
    }
  }

  Future<List<dynamic>> fetchTopKitchens() async {
    final response = await apiClient.getTopKitchens(AppConstants.categoriesUri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (responseBody["status"].toString() == 'true' &&
          responseBody["data"].isNotEmpty) {
        return responseBody["data"];
      }
      return [];
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

  Future<http.Response> login(String email, String password) async {
    final http.Response response = await apiClient.login(email, password);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load top kitchens');
    }
  }

  Future<http.Response> register(
      String name, String email, String phone, String password) async {
    final http.Response response =
        await apiClient.register(name, email, phone, password);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load top kitchens');
    }
  }
}
