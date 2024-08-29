import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ndula/widgets/Requests/Shoe.dart';

class Requests {
  static final _url = "http://127.0.0.1:8001/api";

  static Future<List<Shoe>> requestProducts() async {
    final url = Uri.parse("$_url/shoes");
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print("This is the value of body: ${response.body}");
        final List<dynamic> body = jsonDecode(response.body);
        print("This is the value of body: $body");

        // Convert the JSON list to a List<Map<String, dynamic>>
        final List<Map<String, dynamic>> shoesList =
            body.cast<Map<String, dynamic>>();

        // Use the static method to convert the list of JSON maps to a list of Shoe objects
        return Shoe.fromJsonList(shoesList);
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  static Future addLike({required int id, required int likes}) async {
    String url = "$_url/shoes/$id";
    final body = jsonEncode({"likes": likes});
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final response =
        await http.patch(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 201) {
      print(response.body);
      print("liked");
    } else {
      print(response.body);
    }
  }
}
