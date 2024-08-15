import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndula/widgets/AppHeight.dart';
import 'package:ndula/widgets/AppWidth.dart';
import 'package:ndula/widgets/globals.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'package:badges/badges.dart' as badges;

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  String? shoeSystem;
  String? shoeSize;
  List shoeSizeList = [37, 38, 39, 44, 45, 47];
  bool liked = false;

  Widget system(String value) {
    return TextButton(
        onPressed: () {
          setState(() {
            shoeSystem = value;
          });
        },
        child: Text(
          value,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: shoeSystem == value ? Colors.green : Colors.black),
        ));
  }

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
                 height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadiusDirectional.all(Radius.circular(20)
                       )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nike",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.green.shade300,
                              ),
                              Text(
                                "4.7",
                                style: GoogleFonts.poppins(
                                    color: Colors.green.shade300,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nike Running 85",
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.attach_money,
                                size: 14,
                                color: Colors.green.shade300,
                              ),
                              Text(
                                "235.00",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Size:",
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadiusDirectional.all(
                                    Radius.circular(10))),
                            width: 70,
                            height: 50,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                system("Uk"),
                                system("US"),
                                system("EU")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      width: AppWidth(context, 1),
                      height: 40,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: shoeSizeList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  shoeSize = shoeSizeList[index].toString();
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 70,
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(5),
                                    color: shoeSize ==
                                            shoeSizeList[index].toString()
                                        ? Colors.green.shade400
                                        : Colors.grey.shade300),
                                child: Text(
                                  shoeSizeList[index].toString(),
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: shoeSize ==
                                              shoeSizeList[index].toString()
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            );
                          }),
                    ),
                    Text(
                      "Description",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        "Aute ad consequat esse ea. Aliquip laboris aliqua deserunt Lorem ut in est dolor exercitation. Do commodo aute veniam amet aliquip aliquip consequat proident non eiusmod.",
                        style: GoogleFonts.poppins(color: Colors.grey.shade700),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Globals.addToCart(context),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                liked = !liked;
                              });
                            },
                            icon: Icon(
                              liked
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: liked ? Colors.red : Colors.black,
                            ))
                      ],
                    ),
                    SizedBox(
                      height:5,
                    ),
                    // this is  to 
                    Globals.offers(context)
                 
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
