import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndula/global/AnimatedButton.dart';
import 'package:ndula/widgets/globals.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:badges/badges.dart' as badges;
import 'package:palette_generator/palette_generator.dart';

class ItemPage extends StatefulWidget {
  final  imageUrl;
  final  brandName;
  final  shoeName;
  final  price;
  final  gender;
  final  description;
  final  id;
  final int likes;

  const ItemPage({
    Key? key,
    required this.id,
    required this.likes,
    required this.imageUrl,
    required this.description,
    required this.brandName,
    required this.shoeName,
    required this.price,
    required this.gender,
  }) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> with TickerProviderStateMixin {
  String? shoeSystem;
  String? shoeSize;
  List shoeSizeList = [37, 38, 39, 44, 45, 47];
  bool liked = false;
  late AnimationController _colorAnimationController;
  late Animation<Color?> _colorTween;
  Color _dominantColor = Colors.grey.shade100;
  Color _textColor = Colors.black;
  Color _backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _colorAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _updatePalette();
  }

  Future<void> _updatePalette() async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.imageUrl),
    );
    setState(() {
      _dominantColor = generator.dominantColor?.color ?? Colors.grey.shade100;
      _backgroundColor = _dominantColor.withOpacity(0.1);
      _textColor = _dominantColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
      _colorTween = ColorTween(begin: Colors.white, end: _backgroundColor)
          .animate(_colorAnimationController);
    });
    _colorAnimationController.forward();
  }

  @override
  void dispose() {
    _colorAnimationController.dispose();
    super.dispose();
  }

  Widget system(String value) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: shoeSystem == value ? _dominantColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        value,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: shoeSystem == value ? _textColor : _dominantColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorTween,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: _colorTween.value,
          body: child,
        );
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            floating: false,
            pinned: true,
            backgroundColor: _backgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.shoeName,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: _textColor,
                  shadows: [
                    Shadow(
                      offset: const Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
              ),
              background: Hero(
                tag: 'shoe_image_${widget.id}',
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: _textColor),
              onPressed: () => PersistentNavBarNavigator.pop(context),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: badges.Badge(
                  badgeAnimation: const badges.BadgeAnimation.rotation(
                    animationDuration: Duration(seconds: 1),
                    colorChangeAnimationDuration: Duration(seconds: 1),
                    loopAnimation: false,
                    curve: Curves.fastOutSlowIn,
                    colorChangeAnimationCurve: Curves.easeInCubic,
                  ),
                  badgeContent: Text('3', style: TextStyle(color: _backgroundColor)),
                  badgeStyle: badges.BadgeStyle(badgeColor: _dominantColor),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                    color: _textColor,
                  ),
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.brandName,
                        style: GoogleFonts.poppins(
                          color: _textColor.withOpacity(0.7),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _dominantColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: _dominantColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "4.7",
                              style: GoogleFonts.poppins(
                                color: _dominantColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "\$${widget.price.toStringAsFixed(2)}",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: _dominantColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Size:",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: _textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: ["UK", "US", "EU"]
                          .map((s) => Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: GestureDetector(
                                  onTap: () =>
                                      setState(() => shoeSystem = s),
                                  child: system(s),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 50,
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
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            alignment: Alignment.center,
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: shoeSize ==
                                      shoeSizeList[index].toString()
                                  ? _dominantColor
                                  : _backgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              shoeSizeList[index].toString(),
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: shoeSize ==
                                        shoeSizeList[index].toString()
                                    ? _textColor
                                    : _dominantColor,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Description",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: _textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: GoogleFonts.poppins(
                      color: _textColor.withOpacity(0.7),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Add to cart logic
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _dominantColor,
                            foregroundColor: _textColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(
                            "Add to Cart",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      AnimatedLikeButton(number: widget.likes, id: widget.id),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Globals.offers(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}