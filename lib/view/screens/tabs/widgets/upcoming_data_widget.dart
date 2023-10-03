// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:jazeera_paints/view/base/custom_snack_bar.dart';
import 'package:jazeera_paints/view/screens/order/order_tracking_screen.dart';

class UpcomingDataWidget extends StatelessWidget {
  const UpcomingDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 375,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(DateFormat('EE dd/MM/yyyy').format(DateTime.now()),
                  style: robotoRegular.copyWith(fontSize: 20),),
                SizedBox(width: 20.0),
                Container(
                  height: 25,
                  width: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.lightBlueAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.change_circle_outlined,size: 16,color: Colors.white,),
                      Text('in Progress',style: robotoRegular.copyWith(fontSize: 14,color: Colors.white),)
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.access_time,),
                SizedBox(width: 5.0),
                Text('10.00-16.00',style:robotoRegular.copyWith(fontSize: 16),),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.circle,size: 20,color: Colors.orangeAccent,),
                SizedBox(width: 5.0),
                Text('Paint Appointment',style:robotoRegular.copyWith(fontSize: 16,color: Theme.of(context).disabledColor),),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.account_circle_outlined,size: 25,color: Theme.of(context).disabledColor,),
                SizedBox(width: 5.0),
                Text('Customer',style:robotoRegular.copyWith(fontSize: 16,color: Theme.of(context).disabledColor),),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text('Mr.Ahmed Saud',style:robotoRegular.copyWith(fontSize: 16),),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.call_outlined,size: 25,color: Theme.of(context).disabledColor,),
                SizedBox(width: 5.0),
                Text('Contack Info',style:robotoRegular.copyWith(fontSize: 16,color: Theme.of(context).disabledColor),),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text('+633 9327182',style:robotoRegular.copyWith(fontSize: 16),),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.location_on_outlined,size: 25,color: Theme.of(context).disabledColor,),
                SizedBox(width: 5.0),
                Text('Address',style:robotoRegular.copyWith(fontSize: 16,color: Theme.of(context).disabledColor),),
                SizedBox(width: 45.0),
                TextButton(onPressed: (){
                  showCustomSnackBar('Directions Not Found');
                },
                    child: Text('Get Directions >',style:robotoRegular.copyWith(fontSize: 16,color:Colors.blue)))
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text('Prince Musaed Bin Jelwai St, Dabba',style:robotoRegular.copyWith(fontSize: 16),),
              ],
            ),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(onPressed: (){
               //   Navigator.push(context, MaterialPageRoute(builder: (context) => OrderTrackingScreen()));
                }, child: Center(
                  child: Icon(Icons.chevron_right),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UpcomingTaskWidget extends StatelessWidget {
  const UpcomingTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 375,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(DateFormat('EE dd/MM/yyyy').format(DateTime.now()),
                  style: robotoRegular.copyWith(fontSize: 20),),
                SizedBox(width: 17.0),
                Container(
                  height: 25,
                  width: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.black12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.remove_circle_outline,size: 16,color: Colors.white,),
                      Text('Not Started',style: robotoRegular.copyWith(fontSize: 14,color: Colors.white),)
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.access_time,),
                SizedBox(width: 5.0),
                Text('10.00-16.00',style:robotoRegular.copyWith(fontSize: 16),),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.circle,size: 20,color: Colors.orangeAccent,),
                SizedBox(width: 5.0),
                Text('Paint Appointment',style:robotoRegular.copyWith(fontSize: 16,color: Theme.of(context).disabledColor),),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.account_circle_outlined,size: 25,color: Theme.of(context).disabledColor,),
                SizedBox(width: 5.0),
                Text('Customer',style:robotoRegular.copyWith(fontSize: 16,color: Theme.of(context).disabledColor),),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text('Mr.Ahmed Saud',style:robotoRegular.copyWith(fontSize: 16),),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.call_outlined,size: 25,color: Theme.of(context).disabledColor,),
                SizedBox(width: 5.0),
                Text('Contack Info',style:robotoRegular.copyWith(fontSize: 16,color: Theme.of(context).disabledColor),),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text('+633 9327182',style:robotoRegular.copyWith(fontSize: 16),),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.location_on_outlined,size: 25,color: Theme.of(context).disabledColor,),
                SizedBox(width: 5.0),
                Text('Address',style:robotoRegular.copyWith(fontSize: 14,color: Theme.of(context).disabledColor),),
                SizedBox(width: 45.0),
                TextButton(onPressed: (){
                  showCustomSnackBar('Directions Not Found');
                },
                    child: Text('Get Directions >',style:robotoRegular.copyWith(fontSize: 16,color:Colors.blue)))
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text('Prince Musaed Bin Jelwai St, Dabba',style:robotoRegular.copyWith(fontSize: 16),),
              ],
            ),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(onPressed: (){}, child: Center(
                  child: Icon(Icons.chevron_right),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
