import 'package:flutter/material.dart';

class TrackOrderModel {
  IconData icon;
  String title;
  String subtitle;
  String time;

  TrackOrderModel({required this.icon, required this.title, required this.subtitle, required this.time});

  TrackOrderModel.fromJson(Map<String, dynamic> json)
      : icon = IconData(json['icon'], fontFamily: 'MaterialIcons'),
        title = json['title'],
        subtitle = json['subtitle'],
        time = json['time'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon.codePoint;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['time'] = time;
    return data;
  }
}
