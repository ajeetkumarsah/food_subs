import 'package:http/http.dart' as http;
import 'package:food_subs/utils/app_constants.dart';

class ApiClient {
  final http.Client httpClient = http.Client();

  ApiClient();

  Future<http.Response> getKitchens(String url) async {
    final response =
        await httpClient.get(Uri.parse(AppConstants.baseUrl + url));
    if (response.statusCode != 200) {
      throw Exception('Error fetching kitchens');
    }
    return response;
  }

  Future<http.Response> getTopKitchens(String url) async {
    final response =
        await httpClient.get(Uri.parse(AppConstants.baseUrl + url));
    if (response.statusCode != 200) {
      throw Exception('Error fetching kitchens');
    }
    return response;
  }

  Future<http.Response> getBanner() async {
    final response = await httpClient.get(
        Uri.parse('https://9b091d7ef07d4017a8ec5d1a100509b2.api.mockbin.io/'));
    if (response.statusCode != 200) {
      throw Exception('Error fetching kitchens');
    }
    return response;
  }
}
