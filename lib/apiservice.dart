import 'package:http/http.dart' as http;

class APIService {
  static Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse("https://random-data-api.com/api/v2/users"),
    );

    if (response.statusCode == 200) {
      print('Data: ${response.body}');
    } else {
      print('failed to load Data');
    }
  }
}
