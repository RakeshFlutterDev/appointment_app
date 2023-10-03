// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:jazeera_paints/view/screens/tabs/widgets/calendar_widget.dart';
import 'package:jazeera_paints/view/screens/tabs/widgets/upcoming_data_widget.dart';

import 'history_widget.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool showUpcomingData = false;
  bool showHistoryData = false;
  bool isButton1Pressed = false;
  bool isButton2Pressed = false;

  void _onTapped() async {
    setState(() {
      showUpcomingData = true;
      showHistoryData = false;
      isButton1Pressed = true;
      isButton2Pressed = false;
    });
  }

  void _onPressed() async {
    setState(() {
      showUpcomingData = false;
      showHistoryData = true;
      isButton1Pressed = false;
      isButton2Pressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 52,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return isButton1Pressed ? Colors.blue : Colors.white;
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: Colors.blue),
                    ),
                  ),
                  onPressed: _onTapped,
                  child: Text(
                    'Upcoming',
                    style: robotoRegular.copyWith(color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        return isButton2Pressed ? Colors.blue : Colors.white;
                      },
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: Colors.blue),
                    ),
                  ),
                  onPressed: _onPressed,
                  child: Text(
                    'History',
                    style: robotoRegular.copyWith(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        showUpcomingData ? CalendarWidget() : showHistoryData ? CalendarWidget() : SizedBox(),
        SizedBox(height: 20),
        Text('This Week',style: robotoRegular.copyWith(fontSize: 20),),
        SizedBox(height: 30),
        showUpcomingData ? UpcomingDataWidget() : showHistoryData ? HistoryWidget() :
        Center(child: Text('No data available',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )),
        SizedBox(height: 20),
        showUpcomingData ? UpcomingTaskWidget() : showHistoryData ? HistoryWidget(): SizedBox(),
        SizedBox(height: 20,),
        showUpcomingData ? UpcomingTaskWidget() : showHistoryData ? HistoryWidget2() : SizedBox(),
      ],
    );
  }
}
