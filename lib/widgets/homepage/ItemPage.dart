import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'package:badges/badges.dart' as badges;

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
        leading: IconButton(
            onPressed: () {
              PersistentNavBarNavigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: Text(
          "Sneakers",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
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
        padding: EdgeInsetsDirectional.all(2.0),
        child: SingleChildScrollView(
          child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.network(
                  fit: BoxFit.contain,
                  "https://pngimg.com/d/running_shoes_PNG5816.png",
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
              ),
              Container(
                padding: EdgeInsets.all(14),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(20),
                        topStart: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Item Name"),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.green.shade300,
                        ),
                        Text("4.7")
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
