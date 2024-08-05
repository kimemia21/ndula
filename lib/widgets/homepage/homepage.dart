import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndula/widgets/AppWidth.dart';
import 'package:ndula/widgets/globals.dart';
import 'package:badges/badges.dart' as badges;

class Homnepage extends StatefulWidget {
  const Homnepage({super.key});

  @override
  State<Homnepage> createState() => _HomnepageState();
}

class _HomnepageState extends State<Homnepage> {
  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Globals.textTheme(ScreenWidth);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius:
                30.0, // Set the radius (50.0 is equivalent to 100x100 diameter)
            backgroundImage: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Virgil_Abloh_Paris_Fashion_Week_Autumn_Winter_2019_%28cropped%29.jpg/1200px-Virgil_Abloh_Paris_Fashion_Week_Autumn_Winter_2019_%28cropped%29.jpg'), // Replace with your image URL
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            Text("Username long", style: GoogleFonts.poppins(fontSize: 16))
          ],
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: badges.Badge(
                badgeAnimation: badges.BadgeAnimation.rotation(
                  animationDuration: Duration(seconds: 1),
                  colorChangeAnimationDuration: Duration(seconds: 1),
                  loopAnimation: false,
                  curve: Curves.fastOutSlowIn,
                  colorChangeAnimationCurve: Curves.easeInCubic,
                ),
                badgeContent: Text('3'),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                ),
              ))
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            color: Colors.grey.shade300,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "Search",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black54),
                ),
              ),
            ],
          )),
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10),
            alignment: Alignment.topLeft,
            child: Text("Brand",style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.black87,fontWeight: FontWeight.w500),),
          )
          ],
        ),
      ),
    );
  }
}
