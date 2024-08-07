import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndula/widgets/AppHeight.dart';
import 'package:ndula/widgets/AppWidth.dart';
import 'package:ndula/widgets/Arrivals.dart';
import 'package:ndula/widgets/HomepagePopular.dart';
import 'package:ndula/widgets/globals.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ndula/widgets/homepage/ItemCart.dart';
import 'package:ndula/widgets/homepage/popular.dart';
import 'package:simple_icons/simple_icons.dart';

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
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
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
                          size: 18,
                          color: Colors.black54,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          "Search",
                          style: GoogleFonts.poppins(
                              fontSize: 18, color: Colors.black54),
                        ),
                      ),
                    ],
                  )),
              Globals.homepageTitles(text: "Brand"),
              SizedBox(
                height: 10,
              ),
              Globals.displayCategory(context: context),
              Globals.homepageTitles(text: "Categories"),
              Container(
                height: AppHeight(context, 0.35),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Itemcart();
                    }),
              ),
              Container(
                  margin: EdgeInsets.all(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Globals.homepageTitles(text: "Popular"),
                      TextButton(
                          onPressed: () {},
                          child: Globals.homepageTitles(text: "Show all")),
                    ],
                  )),
                   Arrivals()
            ],
          ),
        ),
      ),
    );
  }
}
