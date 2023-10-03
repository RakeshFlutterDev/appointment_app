// import 'package:flutter/material.dart';
// import 'package:im_stepper/stepper.dart';
// import 'package:jazeera_paints/data/model/track_order_model.dart';
// import 'package:jazeera_paints/util/color_resources.dart';
// import 'package:jazeera_paints/util/dimensions.dart';
// import 'package:jazeera_paints/util/styles.dart';
// import 'package:jazeera_paints/view/base/app_bar_base.dart';
// import 'package:jazeera_paints/view/screens/order/widget/TrackingStepperWidget.dart';
// import 'package:jazeera_paints/view/screens/test.dart';
//
// class OrderTrackingScreen extends StatefulWidget {
//   const OrderTrackingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
// }
//
// class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const AppBarBase(),
//       body: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children:  [
//             const AppBarBody(),
//             SizedBox(height: 10.0),
//             Text('Mr.Anton Omar',style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeOverLarge),),
//             SizedBox(height: 10.0),
//             Text('First Visit',style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge,color: Theme.of(context).disabledColor),),
//             SizedBox(height: 10.0),
//             Container(
//               height: 25,
//               width: 107,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20.0),
//                 color: Colors.lightBlueAccent,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.change_circle_outlined,size: 20,color: Colors.white,),
//                   SizedBox(width: 5,),
//                   Text('in Progress',style: robotoMedium.copyWith(fontSize: 14,color: Colors.white),)
//                 ],
//               ),
//             ),
//             SizedBox(height: 10.0,),
//             Container(
//               height: 360,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: BorderRadius.circular(10.0)
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(18.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Appointment Progress',style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeExtraExtraLarge),),
//                     SizedBox(height: 10.0),
//                     Row(
//                       children: [
//                         Container(
//                           height: MediaQuery.of(context).size.height / 2.8,
//                           width: MediaQuery.of(context).size.width / 7,
//                           child: IconStepper(
//                             direction: Axis.vertical,
//                             enableNextPreviousButtons: false,
//                             enableStepTapping: false,
//                             stepColor: Colors.blue,
//                             activeStepBorderColor: Colors.white,
//                             activeStepBorderWidth: 2.0,
//                             activeStepBorderPadding: 1.0,
//                             lineColor: Colors.green,
//                             lineLength: 19.0,
//                             lineDotRadius: 2.0,
//                             stepRadius: 16.0,
//                             icons: [
//                               Icon(Icons.radio_button_checked, color: Colors.blue),
//                               Icon(Icons.check, color: Colors.white),
//                               Icon(Icons.check, color: Colors.white),
//                               Icon(Icons.check, color: Colors.white),
//                               Icon(Icons.check, color: Colors.white),
//                             ],
//                           ),
//                         ),
//                     Expanded(
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         padding: EdgeInsets.zero,
//                         itemCount: trackOrderList.length,
//                         itemBuilder: (context, index) {
//                           return Row(
//                             children: [
//                               Container(
//                                 height:MediaQuery.of(context).size.width / 7.4,
//                                 width: MediaQuery.of(context).size.width / 1.5,
//                                 child: ListTile(
//                                   contentPadding:
//                                   EdgeInsets.symmetric(vertical: 18.0),
//                                   title: Text(
//                                     trackOrderList[index].title,
//                                     style: TextStyle(fontSize: 18.0),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// final trackOrderList = [
//   TrackOrderModel(
//       icon: Icons.card_travel,
//       title: "First Visit",
//       subtitle: "Order from E-Commerce",
//       time: "08.00"),
//   TrackOrderModel(
//       icon: Icons.person,
//       title: "Suggested Products",
//       subtitle: "We are preparing your order",
//       time: "09.50"),
//   TrackOrderModel(
//       icon: Icons.payment,
//       title: "Payment of extra products",
//       subtitle: "Awaiting Confirmation",
//       time: "11.30"),
//   TrackOrderModel(
//       icon: Icons.receipt,
//       title: "Delivery",
//       subtitle: "We have received your order",
//       time: "02.15"),
//   TrackOrderModel(
//       icon: Icons.receipt,
//       title: "Painting Appointment",
//       subtitle: "We have received your order",
//       time: "02.15"),
// ];
