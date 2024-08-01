import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:connectivity_plus/connectivity_plus.dart';

class Globals {
  Future<bool> checkinternet() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.other)) {
      return true;
    } 
    else{
        final uri = "https://www.google.com";
      final response = await http.get(
        Uri.parse(uri),
        headers: {
          'Cache-Control': 'no-cache',
          'Pragma': 'no-cache',
          'Expires': '0',
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
  }

  void nointernet({required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('No internet connection'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future isconnected(BuildContext context) async {
    if (await checkinternet()) {
      return true;
    } else {
      return nointernet(context: context);
    }
  }
}
