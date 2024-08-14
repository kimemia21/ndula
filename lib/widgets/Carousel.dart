// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ndula/widgets/BrandBar.dart';
// import 'package:ndula/widgets/Homepage.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class loginCarousel extends StatefulWidget {
//   const loginCarousel({super.key});

//   @override
//   State<loginCarousel> createState() => _loginCarouselState();
// }

// class _loginCarouselState extends State<loginCarousel> {
//   int activeIndex = 0;
//   final List imageUrl = [
//     "https://www.kickgame.com/cdn/shop/products/DR5415-103.1.png?v=1678364171&width=1024",
//     "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw4b815cdf/nk/347/8/5/2/6/9/34785269_a422_4181_bf0f_c692c10d325e.png?sw=520&sh=520&sm=fit",
//     "https://www.nike.sa/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw651f0e1f/nk/b73/9/7/c/2/e/b7397c2e_a99a_41a8_b445_de9ded82681a.png",
//     "https://www.nike.ae/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw2cf9ce95/nk/51d/3/b/e/b/a/51d3beba_ea5c_4ee6_b702_ba54167ac880.png?sw=520&sh=520&sm=fit",
//   ];

//   Widget buildIndicator() => Container(
//         margin:
//             EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.025),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedSmoothIndicator(
//                 effect: ExpandingDotsEffect(
//                     paintStyle: PaintingStyle.fill,
//                     dotWidth: MediaQuery.of(context).size.width * 0.04,
//                     dotHeight: MediaQuery.of(context).size.height * 0.0039,
//                     activeDotColor: Colors.black),
//                 activeIndex: activeIndex,
//                 count: imageUrl.length),
//           ],
//         ),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding:EdgeInsets.all(10),

//       child:TopBar()
//       // Stack(children: [
//       //   Positioned(child:Text("Login"))
//       // ],)

//       // Column(
//       //   crossAxisAlignment: CrossAxisAlignment.start,
//       //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       //   children: [
//       //     CarouselSlider.builder(
//       //         itemCount: imageUrl.length,
//       //         itemBuilder: (context, index, realindex) {
//       //           final urlImage = imageUrl[index];
//       //           return Container(child: buildImage(context, urlImage, index));
//       //         },
//       //         options: CarouselOptions(
//       //             onPageChanged: (index, reason) =>
//       //                 setState(() => activeIndex = index),
//       //             enableInfiniteScroll: true,
//       //             autoPlay: true,
//       //             autoPlayInterval: Duration(seconds: 2),
//       //             autoPlayAnimationDuration: Duration(seconds: 1),
//       //             autoPlayCurve: Curves.decelerate,
//       //             height: MediaQuery.of(context).size.height * 0.5)),
//       //     buildIndicator(),
//       //     buildText(context),
//       //   ],
//       // ),

//     );
//   }
// }



// Widget buildImage(context, String urlImage, int index) {
//   return Container(
//     margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//     decoration: BoxDecoration(color: Colors.white),
//     child: Container(
//       margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
//       child: Image.network(
//         urlImage,
//         fit: BoxFit.contain,
//       ),
//     ),
//   );
// }

// Widget buildText(context,) {
//   return Container(
//     height: MediaQuery.of(context).size.height * 0.35,
//     width: MediaQuery.of(context).size.width,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           margin: EdgeInsets.only(
//               top: MediaQuery.of(context).size.height * 0.01,
//               left: MediaQuery.of(context).size.height * 0.02,
//               bottom: MediaQuery.of(context).size.height * 0.02),
//           child: Text(
//             "Start a Journey With Nike",
//             style: GoogleFonts.brunoAce(
//                 textStyle: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black,
//                     fontSize: MediaQuery.of(context).size.height * 0.05)),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(
//             left: MediaQuery.of(context).size.height * 0.02,
//           ),
//           child: Text(
//             "Smart,Gorgeous & fashionable collection",
//             style: GoogleFonts.abel(
//                 textStyle: TextStyle(
//                     fontWeight: FontWeight.normal,
//                     letterSpacing: 1,
//                     color: const Color.fromARGB(255, 82, 82, 82),
//                     fontSize: MediaQuery.of(context).size.height * 0.03)),
//           ),
//         ),
//         Container(
    
          
//           margin: EdgeInsets.only(left: 20,top:20),
//           alignment: Alignment.center,
//           width: MediaQuery.of(context).size.width * 0.38,
//           height: MediaQuery.of(context).size.height * 0.065,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(22), color: Colors.blue[300]),
//           child:
//           TextButton(onPressed: (){
//             Navigator.push(context,MaterialPageRoute(builder: (context)=>
//             Homepage()));
//           },
//           child: Text(
//             "Get Started",
//             style: GoogleFonts.abel(
//                 textStyle: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: MediaQuery.of(context).size.height * 0.032)),
//           ),)
          
          
//         )
//       ],
//     ),
//   );
// }
