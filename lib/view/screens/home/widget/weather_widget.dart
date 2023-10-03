// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends StatelessWidget {
  final String locationName;
  final double temperature;
  final DateTime date;

  const WeatherScreen({super.key,
    required this.locationName,
    required this.temperature,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 86,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white54,
          border: Border.all(
            color: Colors.black12,
            width: 1.0,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/weatherImage.png',
                  height: 40,
                  width: 40,
                ),
                Text(
                  '${temperature.toStringAsFixed(1)}°C',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,size: 16,),
                        Text(
                          locationName,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      DateFormat(' d/MM/yyyy').format(date),
                      style: TextStyle(fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
