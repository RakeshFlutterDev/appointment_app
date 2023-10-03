// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ModifyAvailabilityScreen extends StatefulWidget {
  const ModifyAvailabilityScreen({super.key});

  @override
  State<ModifyAvailabilityScreen> createState() =>
      _ModifyAvailabilityScreenState();
}

class _ModifyAvailabilityScreenState extends State<ModifyAvailabilityScreen> {
  final List<TimeRegion> _timeRegions = <TimeRegion>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title: Text('Modify Availability'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              Text(
                'Edit or create new one with your availability',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20,),
              const Text('Setup your unavailable hours'),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 192,
                  width: 350,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'This Week',
                        style: robotoMedium.copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _buildContainer(
                        'Your have not added any Unavailable hours ',
                        DateTime.now(),
                        DateTime.now().add(Duration(days: 6)),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 192,
                width: 350,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next Week',
                      style: robotoMedium.copyWith(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _buildContainer(
                      'Your have not added any Unavailable hours ',
                      DateTime.now(),
                      DateTime.now().add(Duration(days: 6)),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 192,
                width: 350,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Two Weeks Later',
                      style: robotoMedium.copyWith(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _buildContainer(
                      'Your have not added any Unavailable hours ',
                      DateTime.now(),
                      DateTime.now().add(Duration(days: 6)),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(String title, DateTime startDate, DateTime endDate) {
    return GestureDetector(
      onTap: () => _openCalendar(startDate, endDate),
      child: Container(
        width: 370,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            SizedBox(height: 8),
            OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(color: Colors.blue),
                ),
              ),
              onPressed: () => _openCalendar(startDate, endDate),
              child: Text(
                '+ Add New',
                style: robotoRegular.copyWith(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openCalendar(DateTime startDate, DateTime endDate) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).cardColor,
            title: Text('Modify Unavailable Times'),
          ),
          body: SfCalendar(
            view: CalendarView.week,
            monthViewSettings: MonthViewSettings(
              showAgenda: true,
            ),
            dataSource: AvailabilityDataSource(_timeRegions),
            initialDisplayDate: startDate,
            headerStyle: CalendarHeaderStyle(
              textAlign: TextAlign.center,
              textStyle: TextStyle(fontSize: 18),
            ),
            onTap: (CalendarTapDetails details) {
              if (details.targetElement == CalendarElement.header) {
                // Do nothing when tapping on the header row
              } else if (details.targetElement ==
                  CalendarElement.calendarCell) {
                _addNewTimeRegion(
                    details.date!, details.date!.add(Duration(hours: 1)));
              }
            },
          ),
        ),
      ),
    );
  }

  void _addNewTimeRegion(DateTime startDate, DateTime endDate) {
    setState(() {
      _timeRegions.add(TimeRegion(
        startTime: startDate,
        endTime: endDate,
        color: Colors.green.withOpacity(0.3),
      ));
    });
  }
}

class AvailabilityDataSource extends CalendarDataSource {
  AvailabilityDataSource(List<TimeRegion> source) {
    appointments = source;
  }
}
