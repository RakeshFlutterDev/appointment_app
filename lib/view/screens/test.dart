// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jazeera_paints/util/styles.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
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
            title: Text('Appointments on ${DateFormat('dd-MM-yyyy').format(date)}'),
            content: Container(
              color: Colors.grey,
              height: 100,
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
            title: Text('Appointments on ${DateFormat('dd-MM-yyyy').format(date)}'),
            content:  Container(
                color: Colors.grey,
                height: 100,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Calendar', style: robotoBold.copyWith(fontSize: 20)),
                  SizedBox(height: 10),
                  Divider(height: 10, thickness: 3),
                  SizedBox(height: 10),
                  Row(
                    children: const [
                      SizedBox(width: 30,),
                      Text('From', style: TextStyle(fontSize: 16),),
                      SizedBox(width: 130,),
                      Text('To', style: TextStyle(fontSize: 16),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //    _selectDate(context, fromDateController, true);
                        },
                        child: Container(
                          height: 60,
                          width: 135,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.black12, width: 2),
                            color: Colors.white70,
                          ),
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: 'DD/MM/YYYY',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          //   _selectDate(context, toDateController, false);
                        },
                        child: Container(
                          height: 60,
                          width: 135,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.black12, width: 2),
                            color: Colors.white70,
                          ),
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: 'DD/MM/YYYY',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  _buildHeader(),
                  _buildCalendar(),
                  Row(
                    children:  [
                      SizedBox(width: 20,),
                      Icon(Icons.circle,size:22,color: Colors.blueGrey,),
                      Text('First Visit', style: TextStyle(fontSize: 16,color: Theme.of(context).disabledColor),),
                      SizedBox(width: 40,),
                      Icon(Icons.circle,size:22,color: Colors.yellow,),
                      Text('Paint Appointment', style: TextStyle(fontSize: 16,color: Theme.of(context).disabledColor),),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
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
              SizedBox(width: 50),
              IconButton(
                icon: Icon(Icons.chevron_left, color: Colors.blue),
                onPressed: () {
                  setState(() {
                    _selectedDate = _selectedDate.subtract(Duration(days: 31));
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.chevron_right, color: Colors.blue),
                onPressed: () {
                  setState(() {
                    _selectedDate = _selectedDate.add(Duration(days: 31));
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
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


//
// class CalendarScreen extends StatefulWidget {
//   const CalendarScreen({super.key});
//
//   @override
//   State<CalendarScreen> createState() => _CalendarScreenState();
// }
//
// class _CalendarScreenState extends State<CalendarScreen> {
//   late DateTime _selectedDate;
//   late List<String> _events;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedDate = DateTime.now();
//     _events = [
//       'Event 1 on ${DateFormat('yyyy-MM-dd').format(DateTime.now())}',
//       'Event 2 on ${DateFormat('yyyy-MM-dd').format(DateTime.now())}',
//     ];
//   }
//
//   void _onDateSelected(DateTime date) {
//     if (date.month != _selectedDate.month || date.year != _selectedDate.year) {
//       setState(() {
//         _selectedDate = date;
//         _events = [];
//       });
//     } else {
//       setState(() {
//         _selectedDate = date;
//         _events = [
//           'Event 1 on ${DateFormat('yyyy-MM-dd').format(date)}',
//           'Event 2 on ${DateFormat('yyyy-MM-dd').format(date)}',
//         ];
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: Container(
//             height: 600,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(5.0),
//               border: Border.all(color: Colors.blue,width: 2),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//
//                 children: [
//                   Text('Calendar', style: robotoBold.copyWith(fontSize: 20),),
//                   SizedBox(height: 10,),
//                   Divider(height: 10, thickness: 3,),
//                   SizedBox(height: 10),
//                   Row(
//                     children: const [
//                       SizedBox(width: 30,),
//                       Text('From', style: TextStyle(fontSize: 16),),
//                       SizedBox(width: 130,),
//                       Text('To', style: TextStyle(fontSize: 16),),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           //    _selectDate(context, fromDateController, true);
//                         },
//                         child: Container(
//                           height: 60,
//                           width: 135,
//                           padding: EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5.0),
//                             border: Border.all(color: Colors.black12, width: 2),
//                             color: Colors.white70,
//                           ),
//                           child: TextFormField(
//                             readOnly: true,
//                             decoration: InputDecoration(
//                               hintText: 'DD/MM/YYYY',
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       GestureDetector(
//                         onTap: () {
//                           //   _selectDate(context, toDateController, false);
//                         },
//                         child: Container(
//                           height: 60,
//                           width: 135,
//                           padding: EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5.0),
//                             border: Border.all(color: Colors.black12, width: 2),
//                             color: Colors.white70,
//                           ),
//                           child: TextFormField(
//                             readOnly: true,
//                             decoration: InputDecoration(
//                               hintText: 'DD/MM/YYYY',
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 15,),
//                   _buildHeader(),
//                   _buildCalendar(),
//                   Row(
//                     children:  [
//                       Icon(Icons.circle,size:22,color: Colors.blueGrey,),
//                       Text('First Visit', style: TextStyle(fontSize: 16,color: Theme.of(context).disabledColor),),
//                       SizedBox(width: 40,),
//                       Icon(Icons.circle,size:22,color: Colors.yellow,),
//                       Text('Paint Appointment', style: TextStyle(fontSize: 16,color: Theme.of(context).disabledColor),),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   //_buildEventList(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader() {
//     final List<String> weekdays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
//
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             children: [
//               Text(
//                 DateFormat('MMMM yyyy').format(_selectedDate),
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(width: 50),
//               IconButton(
//                 icon: Icon(Icons.chevron_left, color: Colors.blue),
//                 onPressed: () {
//                   setState(() {
//                     _selectedDate = _selectedDate.subtract(Duration(days: 31));
//                     _events = [];
//                   });
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.chevron_right, color: Colors.blue),
//                 onPressed: () {
//                   setState(() {
//                     _selectedDate = _selectedDate.add(Duration(days: 31));
//                     _events = [];
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 8),
//         Row(
//           children: [
//             for (var weekday in weekdays)
//               Expanded(
//                 child: Container(
//                   child: Center(
//                     child: Text(
//                       weekday,
//                       style: TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildCalendar() {
//     final daysInMonth = DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
//     final firstDayOfMonth = DateTime(_selectedDate.year, _selectedDate.month, 1).weekday;
//
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 7,
//         childAspectRatio: 1.3,
//       ),
//       itemBuilder: (BuildContext context, int index) {
//         final day = index + 1 - firstDayOfMonth;
//         final isCurrentMonth = day >= 1 && day <= daysInMonth;
//         final date = DateTime(_selectedDate.year, _selectedDate.month, day);
//
//         final isSelected = date.day == _selectedDate.day;
//         final isEventDay = date.day >= 18 && date.day <= 23 && date.month == 5; // Check if the date is in May
//
//         return Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5.0),
//             border: isSelected ? Border.all(color: Colors.blue) : null,
//             color: isSelected && isEventDay ? Colors.white : (isEventDay ? Colors.blueGrey : null),
//           ),
//           child: isCurrentMonth
//               ? InkWell(
//             onTap: () => _onDateSelected(date),
//             child: Center(
//               child: Text(
//                 day.toString(),
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: isSelected ? Colors.blue : Colors.black,
//                 ),
//               ),
//             ),
//           )
//               : null,
//         );
//       },
//       itemCount: 42,
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//     );
//   }
//
//
//
//
//
//
//   Widget _buildEventList() {
//     if (_events.isEmpty) {
//       return Text('No events for this day.');
//     } else {
//       return Column(
//         children: _events
//             .map(
//               (event) => Padding(
//             padding: EdgeInsets.symmetric(vertical: 4),
//             child: Text(event),
//           ),
//         )
//             .toList(),
//       );
//     }
//   }
// }
