import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ndula/widgets/AppBloc.dart';
import 'package:ndula/widgets/BottmNavBar.dart';
import 'package:ndula/widgets/Carousel.dart';
import 'package:ndula/widgets/Splash.dart';
import 'package:ndula/widgets/authentication/login.dart';
import 'package:provider/provider.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => Appbloc())],
        child: MaterialApp(
      
            title: 'Ndula app',
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              // bottomNavigationBar:bottomNavBar(),
              body:
            //  LoginScreen()
               SplashScreen(),
            )));
  }
}
