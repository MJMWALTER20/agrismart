import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8080"; // Android emulator

  static Future<String> sendOtp(String phone) async {
    final url = Uri.parse("$baseUrl/auth/send-otp");
    final res = await http.post(url, body: '{"phone":"$phone"}',
        headers: {"Content-Type": "application/json"});
    return res.body;
  }

  static Future<String> verifyOtp(String phone, String otp) async {
    final url = Uri.parse("$baseUrl/auth/verify-otp");
    final res = await http.post(url,
        body: '{"phone":"$phone", "otp":"$otp"}',
        headers: {"Content-Type": "application/json"});
    return res.body;
  }
}
