import 'dart:convert';
import 'package:alphabet/models/alphabet.dart';
import 'package:alphabet/settings.dart';
import 'package:http/http.dart' as http;

class Services {
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

  Future<Alphabet> getLetters() async {
    http.Response response =
        await http.get(Uri.parse('${Settings.apiUrl}/letters'));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return Alphabet.fromJson(json);
    } else {
      throw Exception('Не удалось получить алфавит');
    }
  }

  Future<Map> addResult(int userId, String result) async {
    http.Response response = await http.post(
      Uri.parse('${Settings.apiUrl}/add-result'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'userId': userId, 'result': result}),
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return json['data']; // user
    } else {
      throw Exception('Не удалось получить алфавит');
    }
  }
}
