import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndula/widgets/AppHeight.dart';
import 'package:ndula/widgets/AppWidth.dart';

class Stock extends StatefulWidget {
  const Stock({super.key});

  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  @override
  Widget build(BuildContext context) {
    final shoes = [
      "https://media.istockphoto.com/id/956501428/photo/sport-shoes-on-isolated-white-background.webp?b=1&s=170667a&w=0&k=20&c=zQ0Dsy90DcfSH5YR3yZFR26FgkBx2z_LxIhx3M-JxKg=",
      "https://www.kickgame.com/cdn/shop/products/DR5415-103.1.png?v=1678364171&width=1024",
      "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw4b815cdf/nk/347/8/5/2/6/9/34785269_a422_4181_bf0f_c692c10d325e.png?sw=520&sh=520&sm=fit",
      "https://www.nike.sa/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw651f0e1f/nk/b73/9/7/c/2/e/b7397c2e_a99a_41a8_b445_de9ded82681a.png",
      "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw2cf9ce95/nk/51d/3/b/e/b/a/51d3beba_ea5c_4ee6_b702_ba54167ac880.png?sw=520&sh=520&sm=fit",
    "https://www.simplemost.com/wp-content/uploads/2022/08/Screen-Shot-2023-05-03-at-1.39.31-PM.png"
    ];
    return Container(
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
            margin: EdgeInsets.all(AppHeight(context, 0.01)),
            child: Text(
              "Stock",
              style: GoogleFonts.brunoAce(
                  textStyle: TextStyle(fontSize: AppHeight(context, 0.02))),
            ),),
            Container(
                height: AppHeight(context, 1),
               width: AppWidth(context, 1),

              child: GridView.builder(
              
                  physics:BouncingScrollPhysics(),
                  itemCount: shoes.length,
                  gridDelegate: FlutterzillaFixedGridView(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      height: AppHeight(context, 0.371)),
                  itemBuilder: (context, int index) {
                    return Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Container(
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
                              shoes[index],
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
                  
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
