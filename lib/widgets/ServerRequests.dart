import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ndula/widgets/AppBloc.dart';
import 'package:ndula/widgets/Homepage.dart';
import 'package:ndula/widgets/globals.dart';
import 'package:ndula/widgets/homepage/homepage.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class loginRequest {
  final loginUrl = "http://127.0.0.1:8001/api/login";

  Future login(
      {required String username,
      required String password,
      required BuildContext context}) async {
    final body = jsonEncode({"username": username, "password": password});
    try {
      context.read<Appbloc>().changeIsLoading(true);
      context.read<Appbloc>().changeIsUploading(true);
      print("block1");
      final response = await http.post(Uri.parse(loginUrl),
          body: body, headers: {"Content-Type": "application/json"});
      print("after uri block");
      if (response.statusCode == 200) {
        // print("Sucess block");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Logging in...')),
        );
        PersistentNavBarNavigator.pushNewScreen(context, screen: MainApp());
        // Globals.switchScreens(context: context, screen: MainApp());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.body)),
        );
      }
    } catch (e) {
      print("Got this error in login $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      context.read<Appbloc>().changeIsLoading(false);

      context.read<Appbloc>().changeIsUploading(false);
    }
  }
}
