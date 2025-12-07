import 'dart:convert';
import 'package:http/http.dart' as http;

class ListingService {
  static const String baseUrl = "http://localhost:8080";

  static Future<bool> createListing({
    required String phone,
    required String title,
    required String description,
    required double price,
    required String category,
  }) async {
    final url = Uri.parse("$baseUrl/listings/create");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "phone": phone,
        "title": title,
        "description": description,
        "price": price,
        "category": category,
      }),
    );

    return response.statusCode == 200;
  }

  static Future<List<dynamic>> getListings() async {
    final url = Uri.parse("$baseUrl/listings/");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    return [];
  }
}
