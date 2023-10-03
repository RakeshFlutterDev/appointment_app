// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jazeera_paints/util/dimensions.dart';
import 'package:jazeera_paints/util/styles.dart';


class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late DateTime _selectedDate;
  late Map<DateTime, List<String>> _events;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _events = {
      DateTime(2023, 5, 18): ['Paint Appointment','First Visit'],
      DateTime(2023, 5, 19): ['First Visit'],
      DateTime(2023, 5, 20): ['Paint Appointment'],
      DateTime(2023, 5, 21): ['First Visit'],
      DateTime(2023, 5, 22): ['First Visit'],
      DateTime(2023, 5, 23): ['Paint Appointment'],
    };
  }

  void _onDateSelected(DateTime date) {
    if (_events.containsKey(date)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Appointments on ${DateFormat('dd-MM-yyyy').format(date)}',style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),
            content: Container(
              color: Colors.grey,
              height: 70,
              width: 70,
              child: Center(child: SingleChildScrollView(child: _buildEventList(date))),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Done'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content:  Container(
                color: Colors.grey,
                height: 30,
                width: 60,
                child: Center(child: Text('Unavailable',style: robotoMedium.copyWith(color: Colors.white70),))),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Done'),
              ),
            ],
          );
        },
      );
    }
  }


  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  void showCalendarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            height: 440,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Calendar', style: robotoBold.copyWith(fontSize: 20)),
                  SizedBox(height: 10),
                  Divider(height: 10, thickness: 3),
                  SizedBox(height: 16.0),
                  SizedBox(height: 10),
                  Row(
                    children: const [
                      SizedBox(width: 20,),
                      Text('From', style: TextStyle(fontSize: 16),),
                      SizedBox(width: 100,),
                      Text('To', style: TextStyle(fontSize: 16),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // _selectDate(context, fromDateController, true);
                        },
                        child: Container(
                          height: 60,
                          width: 110,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.black12, width: 2),
                            color: Colors.white70,
                          ),
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: 'dd/mm/yyyy',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          // _selectDate(context, toDateController, false);
                        },
                        child: Container(
                          height: 60,
                          width: 110,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.black12, width: 2),
                            color: Colors.white70,
                          ),
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: 'dd/mm/yyyy',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  _buildHeader(),
                  _buildCalendar(),
                  Row(
                    children:  [
                      Icon(Icons.circle, size: 18, color: Colors.blueGrey,),
                      Text('First Visit', style: TextStyle(fontSize: 14, color: Theme.of(context).disabledColor),),
                      Spacer(),
                      Icon(Icons.circle, size: 18, color: Colors.yellow,),
                      Text('Paint Appointment', style: TextStyle(fontSize: 14, color: Theme.of(context).disabledColor),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void changeToNextMonth() {
    setState(() {
      _selectedDate = DateTime(
          _selectedDate.year, _selectedDate.month + 1, _selectedDate.day);
    });
  }

  void changeToPreviousMonth() {
    setState(() {
      _selectedDate = DateTime(
          _selectedDate.year, _selectedDate.month - 1, _selectedDate.day);
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedMonthYear = DateFormat('MMMM yyyy').format(_selectedDate);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 224,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.blue, width: 2),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Calendar',
                style: robotoRegular.copyWith(fontSize: 20),
              ),
              SizedBox(height: 10,),
              Divider(height: 10, thickness: 3,),
              SizedBox(height: 10),
              Row(
                children: const [
                  SizedBox(width: 15,),
                  Center(child: Text('From', style: TextStyle(fontSize: 16),)),
                  SizedBox(width: 100,),
                  Center(child: Text('To', style: TextStyle(fontSize: 16),)),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showCalendarDialog(context);
                      },
                    child: Container(
                        height: 60,
                        width: 120,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.black12, width: 2),
                          color: Colors.white70,
                        ),
                        child: Center(child: Text('DD/MM/YYYY',style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall,color: Theme.of(context).disabledColor),)),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      showCalendarDialog(context);
                    },
                    child: Container(
                      height: 60,
                      width: 120,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.black12, width: 2),
                        color: Colors.white70,
                      ),
                      child: Center(child: Text('DD/MM/YYYY',style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeSmall,color: Theme.of(context).disabledColor),)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    formattedMonthYear,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 30,),
                  IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 30,
                    ),
                    onPressed: changeToPreviousMonth,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.chevron_right,
                      size: 30,
                    ),
                    onPressed: changeToNextMonth,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final List<String> weekdays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                DateFormat('MMMM yyyy').format(_selectedDate),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
               SizedBox(width: 30),
              // IconButton(
              //   icon: Icon(Icons.chevron_left, color: Colors.blue),
              //   onPressed: () {
              //     setState(() {
              //       _selectedDate = _selectedDate.subtract(Duration(days: 31));
              //     });
              //   },
              // ),
              // IconButton(
              //   icon: Icon(Icons.chevron_right, color: Colors.blue),
              //   onPressed: () {
              //     setState(() {
              //       _selectedDate = _selectedDate.add(Duration(days: 31));
              //     });
              //   },
              // ),
            ],
          ),
        ),
        SizedBox(height: 18),
        Row(
          children: [
            for (var weekday in weekdays)
              Expanded(
                child: Center(
                  child: Text(
                    weekday,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    final daysInMonth = DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
    final firstDayOfMonth = DateTime(_selectedDate.year, _selectedDate.month, 1).weekday;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1.3,
      ),
      itemBuilder: (BuildContext context, int index) {
        final day = index + 1 - firstDayOfMonth;
        final isCurrentMonth = day >= 1 && day <= daysInMonth;
        final date = DateTime(_selectedDate.year, _selectedDate.month, day);

        final isSelected = date.day == _selectedDate.day;
        final isEventDay = _events.containsKey(date);

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: isSelected ? Border.all(color: Colors.blue) : null,
            color: isSelected && isEventDay ? Colors.white : (isEventDay ? Colors.blueGrey : null),
          ),
          child: isCurrentMonth
              ? InkWell(
            onTap: () => _onDateSelected(date),
            child: Center(
              child: Text(
                day.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.blue : Colors.black,
                ),
              ),
            ),
          )
              : null,
        );
      },
      itemCount: 42,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  Widget _buildEventList(DateTime date) {
    final events = _events[date] ?? [];

    if (events.isEmpty) {
      return Text('No events for this day.');
    } else {
      return Column(
        children: events
            .map(
              (event) => Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text(
              event,
              style: TextStyle(color: Colors.white70),
            ),
          ),
        )
            .toList(),
      );
    }
  }
}

