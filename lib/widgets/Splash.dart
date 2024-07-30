import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndula/widgets/AppHeight.dart';
import 'package:ndula/widgets/AppWidth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int number = 1;
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
                          Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(1),
                                  borderRadius: BorderRadiusDirectional.all(
                                      Radius.circular(10))),
                              child:
                              
                               Text(
                                "Get started",
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
