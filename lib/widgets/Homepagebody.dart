import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndula/widgets/AppHeight.dart';
import 'package:ndula/widgets/AppWidth.dart';
import 'package:ndula/widgets/Arrivals.dart';
import 'package:ndula/widgets/HomepagePopular.dart';
import 'package:ndula/widgets/Stock.dart';

class BodyHomepage extends StatefulWidget {
  const BodyHomepage({super.key});

  @override
  State<BodyHomepage> createState() => _BodyHomepageState();
}

class _BodyHomepageState extends State<BodyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100]),
      height: AppHeight(context, 1),
      width: AppHeight(context, 1),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.only(
                top: AppWidth(context, 0.06), left: AppWidth(context, 0.03)),
            child: Text(
              "Popular Shoes",
              style: GoogleFonts.brunoAce(
                  textStyle: TextStyle(fontSize: AppHeight(context, 0.025))),
            ),
          ),
          popular(context),
          Arrivals(),
          
          Stock(),
          
        ],
      ),
    );
  }
}
