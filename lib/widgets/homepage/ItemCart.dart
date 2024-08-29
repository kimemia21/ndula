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
  final VoidCallback onLikeChanged;

  const Itemcart({
    Key? key,
    required this.id,
    required this.likes,
    required this.brand,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.onLikeChanged
  }) : super(key: key);

  @override
  State<Itemcart> createState() => _ItemcartState();
}

class _ItemcartState extends State<Itemcart> {
  bool isLiked = false;
  late int likes;

  @override
  void initState() {
    super.initState();
    likes = widget.likes;
  }

  void toggleLike() async{
    setState(() {
      isLiked = !isLiked;
      likes += isLiked ? 1 : -1;
      Requests.addLike(id: widget.id, likes: likes);
    });
     await Requests.addLike(id: widget.id, likes: likes);
        widget.onLikeChanged; 
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: toggleLike,
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: ItemPage(
            id: widget.id,
            likes: likes,
            imageUrl: widget.imageUrl,
            brandName: widget.brand,
            shoeName: widget.name,
            price: widget.price,
            description: widget.description,
            gender: "",
          ),
        );
      },
      child: Container(
        width: AppWidth(context, 0.45),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                widget.imageUrl,
                height: AppHeight(context, 0.2),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.brand,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.name,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${widget.price.toStringAsFixed(2)}',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? Colors.red : Colors.grey,
                          ),
                          SizedBox(width: 4),
                          Text(
                            likes.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
