import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ndula/serializer/Brand.dart';
import 'package:ndula/widgets/AppWidth.dart';
import 'package:ndula/widgets/Requests/Requests.dart';
import 'package:simple_icons/simple_icons.dart';

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

  static Widget offers(BuildContext context) {
    return Container(
        // width: AppWidth(context,0.5),
        child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.local_shipping,
          color: Colors.white,
          size: 14,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          "Free Delivery for orders above \$200",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
        )
      ],
    ));
  }

  static Widget addToCart(context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: Colors.black),
      width: AppWidth(context, .7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Add to cart",
            style: GoogleFonts.poppins(color: Colors.white),
          )
        ],
      ),
    );
  }

  static Widget brandTile(
      {required String image, required BuildContext context, required String count}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          height: 50,
          width: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10),
              color: Colors.grey.shade300),
          child:Image.network(image)
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          count,
          style: GoogleFonts.poppins(
              fontSize: 12, color: Colors.black54, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  static Widget homepageTitles({required String text}) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: GoogleFonts.poppins(
            fontSize: 10, color: Colors.black87, fontWeight: FontWeight.w500),
      ),
    );
  }

  static Future<List<Brand>> fetchBrands({required BuildContext context}) async {
     List<Brand> brands = await Requests.requestBrand();
     return brands; // Return the List<Brand>
  }

static Widget displayCategory({required BuildContext context}) {
  // List of icons and item counts
  List<IconData> icons = [
    SimpleIcons.nike,
    SimpleIcons.adidas,
    SimpleIcons.jordan,
    SimpleIcons.newbalance,
    SimpleIcons.reebok,
    SimpleIcons.puma,
  ];
  List<String> itemsCount = ["12", "34", "54", "81", "15", "83"];

  // Replace the future call with your own method to fetch brands
 

  return FutureBuilder<List<Brand>>(
    future: fetchBrands(context: context), // Use your future method to fetch the brand list
    builder: (BuildContext context, AsyncSnapshot<List<Brand>> snapshot) {
      // Error handling
      if (snapshot.hasError) {
        return Center(
          child: Text(snapshot.error.toString()),
        );
      }
      // Show loading spinner while waiting for data
      else if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      // If data is available, display the list
      else if (snapshot.hasData) {
        List<Brand> data = snapshot.data!; // Statically typed as List<Brand>
        
        return Container(
          width: MediaQuery.of(context).size.width, // Adjust width based on context
          height: 100,
          child: ListView.builder(
            itemCount: data.length, // Dynamically set based on data length
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final brandDetails =data[index];
              return brandTile(image:brandDetails.brand_logo , context: context, count: "19");
              // brandTile(
              //   icon: icons[index], // Icon for each item
              //   context: context,
              //   count: itemsCount[index], // Display item count
              // );
            },
          ),
        );
      }
      // If no data available, display an empty message
      return const Center(
        child: Text('No data available'),
      );
    },
  );
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

  static Future<void> switchScreens(
      {required BuildContext context, required Widget screen}) {
    try {
      return Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(
                milliseconds:
                    600), // Increase duration for a smoother transition
            pageBuilder: (context, animation, secondaryAnimation) => screen,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final opacityTween = Tween(begin: 0.0, end: 1.0);
              final scaleTween = Tween(
                  begin: 0.95,
                  end: 1.0); // Slight scale transition for ambient effect
              final curvedAnimation = CurvedAnimation(
                parent: animation,
                curve:
                    Curves.easeInOut, // Use easeInOut for a smoother transition
              );

              return FadeTransition(
                opacity: opacityTween.animate(curvedAnimation),
                child: ScaleTransition(
                  scale: scaleTween.animate(curvedAnimation),
                  child: child,
                ),
              );
            },
          ));
    } catch (e) {
      throw Exception(e);
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
          fontSize: fontSizeMedium,
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
          fontSize: screenWidth * 0.08,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          letterSpacing: 1.0),
    );
  }
}
