import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ndula/widgets/AppBloc.dart';
import 'package:ndula/widgets/AppHeight.dart';
import 'package:ndula/widgets/AppWidth.dart';
import 'package:ndula/widgets/globals.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late bool _isconnected;
  late Timer timer;
  late StreamSubscription<List<ConnectivityResult>> subscription;

  @override
  void initState() {
    super.initState();

    // timer = Timer.periodic(Duration(seconds: 1), (_) {
    try {
      bool connection = false;
      subscription = Connectivity()
          .onConnectivityChanged
          .listen((List<ConnectivityResult> result) {
        if (result.contains(ConnectivityResult.wifi)) {
          print(result);
          connection = true;
          context.read<Appbloc>().changeConnection(connection);
        } else if (result.contains(ConnectivityResult.mobile)) {
          print(result);
          connection = true;
          context.read<Appbloc>().changeConnection(connection);
        } else if (result.contains(ConnectivityResult.none)) {
          print(result);
          connection = false;
          Globals().nointernet(context: context);
          context.read<Appbloc>().changeConnection(connection);
         
        }
      });
    } catch (e) {
      print("got this error in  the init method splashscreen $e");
      throw Exception(e);
    }

    // Globals().checkinternet().then((connection) {
    //   if (connection) {
    //     print("checking");
    //     _isconnected = true;
    //     context.read<Appbloc>().changeConnection(connection);
    //   } else {
    //     print("no internet connection");
    //     Globals().nointernet(context: context);
    //     context.read<Appbloc>().changeConnection(connection);
    //   }
    // });
    // });

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      reverseDuration: Duration(seconds: 1),
    )..repeat(
        reverse: true); // Repeat the animation in reverse for a pulsing effect

    _animation = Tween<double>(begin: 10.0, end: 30.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(4),
      child: Stack(
        children: [
          Positioned(
              child: Image.asset(
                  fit: BoxFit.cover,
                  width: AppWidth(context, 1),
                  height: AppHeight(context, 1),
                  "assets/images/splash.jpg"

                  // "https://wallpapers.com/images/hd/nike-air-jordan-1-retro-chicago-goj5lj0rsp1329ug.jpg"
                  // // "https://i.pinimg.com/736x/1d/1f/8c/1d1f8c8b77a4dac766ce0ae7e49daabd.jpg"
                  // "https://cdn.shopify.com/s/files/1/0260/3270/1520/files/J1-Lost-Mobile-Banner_480x480.gif?v=1681133671"
                  // "https://i.redd.it/0z4tfhph8ai61.jpg"
                  // "https://www.sneakerhdwallpapers.com/wallpapers/2024/sabrina-2-usa-wallpaper-mobile.jpg"
                  )),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedOpacity(
                    onEnd: () => print('Fade FlutterLogo'),
                    curve: Curves.easeIn,
                    duration: const Duration(milliseconds: 500),
                    opacity: 0.5,
                    child: Container(
                      margin: EdgeInsets.only(right: 3, left: 3),
                      width: AppWidth(context, 1),
                      height: AppHeight(context, 0.25),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.6),
                            spreadRadius: 12,
                            blurRadius: 5,
                            offset: Offset(0, 7), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(20),
                            topEnd: Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            "Let's improve your \n appearance",
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Find shoes to support your daily activites",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              // context.watch<Appbloc>().isconnected
                              Provider.of<Appbloc>(context, listen: false)
                                      .isconnected
                                  ? print("success")
                                  : Globals().nointernet(context: context);
                            },
                            child: AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                return Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      // BoxShadow(
                                      //   color: Colors.red.withOpacity(0.3),
                                      //   spreadRadius: _animation.value,
                                      //   blurRadius: _animation.value * 3,
                                      //   offset: Offset(0, 3),
                                      // ),
                                      BoxShadow(
                                        color: Colors.red.withOpacity(
                                            0.6), // Increased opacity
                                        spreadRadius: _animation.value,
                                        blurRadius: _animation.value * 2,
                                        offset: Offset(0, 0), // Centered glow
                                      ),
                                      BoxShadow(
                                        color: Colors.red.withOpacity(
                                            0.6), // Increased opacity
                                        spreadRadius: _animation.value * 0.8,
                                        blurRadius: _animation.value * 1.5,
                                        offset: Offset(0, 0), // Centered glow
                                      ),
                                    ],
                                  ),
                                  child: context.watch<Appbloc>().isconnected
                                      ? Text("Get started")

                                      // ? LoadingAnimationWidget.twistingDots(
                                      //     leftDotColor: const Color(0xFF1A1A3F),
                                      //     rightDotColor:
                                      //         const Color(0xFFEA3799),
                                      //     size: 20,
                                      //   )
                                      : LoadingAnimationWidget.twistingDots(
                                          leftDotColor: const Color(0xFF1A1A3F),
                                          rightDotColor:
                                              const Color(0xFFEA3799),
                                          size: 20,
                                        ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
