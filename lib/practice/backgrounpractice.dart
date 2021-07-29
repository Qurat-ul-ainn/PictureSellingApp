// import 'package:flutter/material.dart';
// import 'package:streamo/practice/ui_comp.dart';
//
//
// class ImageTesterPage extends StatefulWidget {
//   @override
//   _ImageTesterPageState createState() => _ImageTesterPageState();
// }
//
// class _ImageTesterPageState extends State<ImageTesterPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Container(
//         child: ListView(
//           shrinkWrap: true,
//           physics: ClampingScrollPhysics(),
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(right: 30.0),
//                   width: MediaQuery.of(context).size.width,
//                   child: Image.asset('assets/images/onboarding-bg.png',color: Colors.grey[200],
//                     fit: BoxFit.cover,),
//                 ),
//
//                 Positioned(
//                   top: 150,
//                   left: 00,
//                   right: 00,
//                   child: Container(
//                     alignment: Alignment.center,
//                     width: 200,
//                     height: 200,
//                     child:  Image.asset('assets/images/onboarding-inventory.png',
//                       fit: BoxFit.cover,height:350,),
//                   ),
//                 ),
//                 Positioned(
//                   top: 380,
//                   left: 65,
//                   child:Column(
//                     children: [
//                       Text("Biz Roznamcha",
//                         style:TextStyle(
//                             color:  Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 40.0),
//                       ),
//                       SizedBox(height: 10,),
//                       Text(
//                         "The simpler way to manage your\nshop accounts and stock.",
//                         textAlign: TextAlign.center,
//                         style:TextStyle(
//                             color:  Colors.white,
//                             fontSize: 20.0
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//              Padding(
//                padding: const EdgeInsets.only(top: 180),
//                child: Column(
//                 children: [
//                   CustomButton(
//                     // btnClr: Colors.deepOrangeAccent,
//                     btnClr: Colors.deepOrange[300],
//                     btnTxt: "Getting Started",
//                     btnWidth: 200.0,
//                     btnFunction: (){
//                     },
//                   ),
//                   SizedBox(
//                     height:  50,
//                   ),
//                   Text(
//                     "Already have account?",
//                   ),
//
//                   CustomGestureText(
//                     onTapFunction: (){
//
//                     },
//                     txt: "Login here",
//
//                   ),
//
//                 ],
//             ),
//              ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class SliderTittle extends StatelessWidget {
//   final String imageAssetPath, tittle, description;
//   SliderTittle({this.imageAssetPath, this.tittle, this.description});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         margin: EdgeInsets.only(bottom: 30.0, right: 40.0, left: 40.0,top: 20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               alignment: Alignment.centerRight,
//               child: CustomGestureText(
//                 onTapFunction: () {},
//                 txt: "Skip",
//               ),
//             ),
//             Image.asset(imageAssetPath),
//             SizedBox(
//               height: 200,
//             ),
//             Text(
//               tittle,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontWeight: FontWeight.w900,
//                 fontSize: 28,
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Text(
//               description,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18, color: Colors.grey),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// // Page Index Indicator Widget
// Widget pageIndicator(bool isCurrentPage) {
//   return Container(
//     margin: EdgeInsets.symmetric(horizontal: 4.5),
//     height: 8.0,
//     width: 8.0,
//     decoration: BoxDecoration(
//       color: isCurrentPage ? Colors.grey[600] : Colors.grey[400],
//       borderRadius: BorderRadius.circular(12),
//     ),
//   );
// }
