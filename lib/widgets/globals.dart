import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:connectivity_plus/connectivity_plus.dart';

class Globals {
  final BuildContext context;
  Globals({required this.context});
// logic for getting screen sizes
  double getScreenWidth() {
    return MediaQuery.of(context).size.width;
  }

// find fontsize
  double FontSize(double size) {
    double screenWidth = getScreenWidth();
    return screenWidth * size;
  }

  Future<bool> checkinternet() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.other)) {
      return true;
    } else {
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

  void nointernet() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('No internet connection'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future isconnected() async {
    if (await checkinternet()) {
      return true;
    } else {
      return nointernet();
    }
  }

  static TextTheme textTheme(double screenWidth,
      {double? fontSizeLarge, double? fontSizeSmall, double? fontSizeMedium}) {
    fontSizeLarge ??= screenWidth * 0.045;
    fontSizeMedium ??= screenWidth * 0.035;
    fontSizeSmall ??= screenWidth * 0.03;

    return TextTheme(
      titleLarge: GoogleFonts.poppins(
          fontSize: fontSizeLarge,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          // fontStyle: FontStyle.italic,
          letterSpacing: 2.0),
      titleMedium: TextStyle(
          fontSize:fontSizeMedium,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.0),
      titleSmall: GoogleFonts.poppins(
          fontSize: fontSizeMedium,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          // fontStyle: FontStyle.italic,
          letterSpacing: 1.0),
      bodyLarge: GoogleFonts.poppins(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Colors.black54,
          letterSpacing: 1.0),
    );
  }
}
