import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndula/global/AnimatedButton.dart';
import 'package:ndula/widgets/AppHeight.dart';
import 'package:ndula/widgets/AppWidth.dart';
import 'package:ndula/widgets/Requests/Requests.dart';
import 'package:ndula/widgets/homepage/ItemPage.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class Itemcart extends StatefulWidget {
  final id;
  final likes;
  final name;
  final brand;
  final imageUrl;
  final price;
  final description;

  const Itemcart(
      {required this.id,
      required this.likes,
      required this.brand,
      required this.name,
      required this.imageUrl,
      required this.description,
      required this.price});

  @override
  State<Itemcart> createState() => _ItemcartState();
}

class _ItemcartState extends State<Itemcart> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          number += 1;
        });
      },
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(context,
            screen: ItemPage(
                id: widget.id,
                likes: widget.likes,
                imageurl: widget.imageUrl,
                brandName: widget.brand,
                shoeName: widget.name,
                price: widget.price,
                description: widget.description,
                gender: ""));
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
            AnimatedLikeButton(number: number, id: widget.id),
            Padding(
              padding: EdgeInsets.all(8),
              child: Image.network(
                  height: AppHeight(context, 0.3 / 2),
                  width: AppWidth(context, 0.4),
                  widget.imageUrl),
            ),
            Text(
              number.toString(),
            ),
            Text(
              widget.brand.toString(),
            ),
            Text(
              style: GoogleFonts.poppins(color: Colors.black54),
              "Best Selling",
            ),
            Text(
              widget.price.toString(),
            )
          ],
        ),
      ),
    );
  }
}
