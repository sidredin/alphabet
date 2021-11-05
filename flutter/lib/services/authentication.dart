import 'dart:convert';
import 'package:alphabet/settings.dart';
import 'package:http/http.dart' as http;

class Authentication {
  Future<int> getUserId(Map accessData) async {
    http.Response response = await http.post(
      Uri.parse('${Settings.apiUrl}/check-auth'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(accessData),
    );

    if (response.statusCode == 200) {
      var serverData = jsonDecode(response.body);
      return serverData['data']['id'];
    }
    return 0;
  }
}
