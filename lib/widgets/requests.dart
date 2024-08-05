import 'dart:convert';

import 'package:http/http.dart' as http;

class Requests {
  final loginUrl = "http://127.0.0.1:8000/api/login";

  Future login({required String username, required String password}) async {
    final body = jsonEncode({"username": username, "password": password});

    final response = http.post(Uri.parse(loginUrl),
        body: body, headers: {"Content-Type": "application/json"});
  }
}
