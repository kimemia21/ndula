import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ndula/widgets/AppBloc.dart';
import 'package:provider/provider.dart';

class loginRequest {
  final loginUrl = "http://127.0.0.1:8000/api/login";

  Future login(
      {required String username,
      required String password,
      required BuildContext context}) async {
    final body = jsonEncode({"username": username, "password": password});
    try {
      context.read<Appbloc>().changeIsLoading(true);
      print("block1");
      final response = await http.post(Uri.parse(loginUrl),
          body: body, headers: {"Content-Type": "application/json"});
      print("after uri block");
      if (response.statusCode == 200) {
        // print("Sucess block");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Logging in...')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('error')),
        );
      }
    } catch (e) {
      print("Got this error in login $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      context.read<Appbloc>().changeIsLoading(false);
    }
  }
}
