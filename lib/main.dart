import 'package:flutter/material.dart';
import 'package:ndula/widgets/BottmNavBar.dart';
import 'package:ndula/widgets/Carousel.dart';
import 'package:ndula/widgets/Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ndula app',
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        // bottomNavigationBar:bottomNavBar(),
        body: SplashScreen(),
      )
    );
  }
}
