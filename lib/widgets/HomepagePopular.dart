import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndula/widgets/AppHeight.dart';
import 'package:ndula/widgets/AppWidth.dart';

Widget popular(context) {
  List shoes = [
    "https://www.kickgame.com/cdn/shop/products/DR5415-103.1.png?v=1678364171&width=1024"
     "https://www.kickgame.com/cdn/shop/products/DR5415-103.1.png?v=1678364171&width=1024",
     "https://wp.clutchpoints.com/wp-content/uploads/2024/02/Wade-All-City-12-Sunshine-State-PinkWhite.jpg",
    "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw4b815cdf/nk/347/8/5/2/6/9/34785269_a422_4181_bf0f_c692c10d325e.png?sw=520&sh=520&sm=fit",
    "https://www.nike.sa/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw651f0e1f/nk/b73/9/7/c/2/e/b7397c2e_a99a_41a8_b445_de9ded82681a.png",
    "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw2cf9ce95/nk/51d/3/b/e/b/a/51d3beba_ea5c_4ee6_b702_ba54167ac880.png?sw=520&sh=520&sm=fit",
 
  ];
  return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(AppWidth(context, 0.04))),
      margin: EdgeInsets.symmetric(
          
          horizontal: AppWidth(
            context,
            0.02,
          )),
      height: AppHeight(context, 0.371),
      width: AppWidth(context, 1),
      child: ListView.builder(
          itemCount: shoes.length,
          physics: BouncingScrollPhysics(
              parent: ScrollPhysics(),
              decelerationRate: ScrollDecelerationRate.normal),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int Index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppWidth(context, 0.02))),
              margin: EdgeInsets.only(
                  left: AppWidth(context, 0.04),
                  right: AppWidth(context, 0.01),
                  top: AppWidth(context, 0.04),
                  bottom: AppWidth(context, 0.04)),
              width: AppWidth(context, 0.45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: AppWidth(context, 0.01)),
                      width: AppWidth(context, 0.4),
                      height: AppHeight(context, 0.18),
                      child: Image.network(
                        shoes[Index],
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: AppHeight(context, 0.002),
                        horizontal: AppHeight(context, 0.005)),
                    child: Text(
                      "Best Seller",
                      style: GoogleFonts.brunoAce(
                          textStyle: TextStyle(
                              fontSize: AppWidth(context, 0.04),
                              color: const Color.fromARGB(255, 153, 194, 228))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: AppHeight(context, 0.002),
                        horizontal: AppHeight(context, 0.005)),
                    child: Text(
                      "Nike Air Jordan 4",
                      style: GoogleFonts.brunoAce(
                          textStyle: TextStyle(
                              fontSize: AppWidth(context, 0.045),
                              color: Colors.black)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: AppHeight(context, 0.002),
                        horizontal: AppHeight(context, 0.005)),
                    child: Text(
                      "\$450",
                      style: GoogleFonts.brunoAce(
                          textStyle: TextStyle(
                              fontSize: AppWidth(context, 0.04),
                              color: Colors.black)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          height: AppHeight(context, 0.06),
                          width: AppWidth(context, 0.12),
                          decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(AppWidth(context, 0.03)),
                                  bottomLeft:
                                      Radius.circular(AppWidth(context, 0.03)),
                                  bottomRight: Radius.circular(
                                      AppWidth(context, 0.03)))),
                          child: Icon(
                            CupertinoIcons.plus,
                            color: Colors.white,
                            size: AppHeight(context, 0.03),
                          )),
                    ],
                  )
                ],
              ),
            );
          }));
}
