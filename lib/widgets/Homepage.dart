import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndula/widgets/BrandBar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     leading: Icon(Icons.menu),
      //     centerTitle: true,
      //     backgroundColor: Colors.white,
      //     title: Text("Homepage")),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [storeLocation(context), 
            TopBar()],
          )),
    );
  }
}

Widget storeLocation(context) {
  return Container(
    margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.07,
        right: MediaQuery.of(context).size.width * 0.07,
        left: MediaQuery.of(context).size.width * 0.07),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          CupertinoIcons.person,
          size: MediaQuery.of(context).size.height * 0.036,
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Store Location",
                style: GoogleFonts.brunoAce(
                    textStyle: TextStyle(
                        color: const Color.fromARGB(255, 129, 129, 129),
                        fontSize: MediaQuery.of(context).size.height * 0.018)),
              ),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.location_solid,
                    color: Colors.red[200],
                  ),
                  Text("Nairobi,Central",
                      style: GoogleFonts.brunoAce(
                          textStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.031)))
                ],
              )
            ],
          ),
        ),
        Icon(
          CupertinoIcons.shopping_cart,
          size: MediaQuery.of(context).size.height * 0.036,
        )
      ],
    ),
  );
}

Widget SearchBar(context) {
  final _formField = GlobalKey<FormState>();
  final search_controller = TextEditingController();
  return Container(
    height: MediaQuery.of(context).size.height * 0.06,
    margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        left: MediaQuery.of(context).size.height * 0.02,
        right: MediaQuery.of(context).size.height * 0.02),
    child: Form(
        key: _formField,
        child: TextFormField(
            autocorrect: true,
            cursorColor: Colors.black,
            controller: search_controller,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white),
              ),
              prefixIcon: Icon(
                  CupertinoIcons.search), // Use prefixIcon instead of prefix
              labelText: "Looking for Shoes",
              labelStyle: TextStyle(color: Colors.grey[400]),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(style: BorderStyle.none, color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            validator: <String>(value) {
              if (value == null || value.isEmpty) {
                return "";
              }
            })),
  );
}
