import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class Contants {
  final BuildContext context;
  Contants({required this.context});

  double screenWidth() {
    double width = MediaQuery.of(context).size.width;
    return width;
  }
}
