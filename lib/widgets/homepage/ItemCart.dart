import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndula/widgets/AppHeight.dart';
import 'package:ndula/widgets/AppWidth.dart';
import 'package:ndula/widgets/homepage/ItemPage.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class Itemcart extends StatefulWidget {
  final name;
  final brand;
  final imageUrl;
  final price;
  const Itemcart(
      {required this.brand, required this.name, required this.imageUrl,required this.price});

  @override
  State<Itemcart> createState() => _ItemcartState();
}

class _ItemcartState extends State<Itemcart> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(context, screen: ItemPage());
      },
      child: Container(
        // height: AppHeight(context, 0.35),
        width: AppWidth(context, 0.4),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadiusDirectional.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_sharp, color: Colors.red)),
            Padding(
              padding: EdgeInsets.all(8),
              child: Image.network(
                  height: AppHeight(context, 0.3 / 2),
                  width: AppWidth(context, 0.4),
                  widget.imageUrl),
            ),
            Text(
              widget.brand.toString(),
            ),
            Text(
              "Best Selling",
              style: GoogleFonts.poppins(color: Colors.black54),
            ),
            Text(
              widget.price.toString(),
              style: GoogleFonts.poppins(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
