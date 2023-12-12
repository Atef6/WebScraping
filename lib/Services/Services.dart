import 'package:http/http.dart' as http;
const String baseUrl = "https://pub.dev/packages";
class Services {
  
  static Future<String?> getBost() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl"));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("faild response data ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("falid get data $e");
    }
  }
}
