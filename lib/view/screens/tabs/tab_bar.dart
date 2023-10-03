import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jazeera_paints/view/screens/tabs/widgets/calendar_day.dart';
import 'package:jazeera_paints/view/screens/tabs/widgets/calendar_month.dart';
import 'package:jazeera_paints/view/screens/tabs/widgets/calendar_week.dart';
import 'package:jazeera_paints/view/screens/tabs/widgets/modify_widget.dart';
import 'package:jazeera_paints/view/screens/tabs/widgets/task_widget.dart';

enum ViewOption { day, week, month }

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DateTime _selectedDate = DateTime.now();
  ViewOption _selectedView = ViewOption.day;

  void changeDate(int days) {
    setState(() {
      _selectedDate = _selectedDate.add(Duration(days: days));
    });
  }

  void onViewOptionChanged(ViewOption? option) {
    setState(() {
      _selectedView = option ?? ViewOption.day;
      if (_selectedView == ViewOption.month) {
      } else {}
    });
  }

  void changeView(ViewOption option) {
    setState(() {
      _selectedView = option;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateFormat formatter;
    if (_selectedView == ViewOption.month) {
      formatter = DateFormat('MMMM y');
    } else {
      formatter = DateFormat('EEEE, MMMM d, y');
    }
    String formattedDate = formatter.format(_selectedDate);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Center(
            child: Container(
              width: 1150,
              color: Colors.white,
              child: TabBar(controller: _tabController,
                  indicatorColor: Theme.of(context).primaryColor,
                  indicatorWeight: 3,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Theme.of(context).disabledColor, tabs: const [
                Tab(
                  text: 'Tasks',
                ),
                Tab(text: 'Calendar'),
              ]),
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(children: [
                  TaskWidget(),
                ],),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          formattedDate,
                          style: const TextStyle(fontSize: 26),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_circle_left,size: 30,),
                              color: Colors.indigo,
                              onPressed: _selectedView == ViewOption.month
                                  ? null
                                  : () => changeDate(-1),
                            ),
                            IconButton(
                              icon: const Icon(Icons.arrow_circle_right, size: 30,),
                              color: Colors.indigo,
                              onPressed: _selectedView == ViewOption.month
                                  ? null
                                  : () => changeDate(1),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<ViewOption>(
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  alignment: Alignment.centerRight, // center the icon and text horizontally
                                  iconSize: 40,
                                  style: TextStyle(color: Colors.black, fontSize: 18),
                                  value: _selectedView,
                                  onChanged: onViewOptionChanged,
                                  items: const [
                                    DropdownMenuItem(
                                      value: ViewOption.day,
                                      child: Text('Day'),
                                    ),
                                    DropdownMenuItem(
                                      value: ViewOption.week,
                                      child: Text('Week'),
                                    ),
                                    DropdownMenuItem(
                                      value: ViewOption.month,
                                      child: Text('Month'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 190,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: OutlinedButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  ModifyAvailabilityScreen()));
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10), // set the border radius of the button
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.edit_outlined, color: Colors.blue), // set the icon of the button
                                     SizedBox(width: 2), // add some space between the icon and text
                                 Text('Modify Availability', style: TextStyle(color: Colors.blue, fontSize: 15),
                                 ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16.0),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _buildCalendar(),
                  ),
                ],
              ),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget _buildCalendar() {
    switch (_selectedView) {
      case ViewOption.day:
        return _buildDayView();
      case ViewOption.week:
        return _buildWeekView();
      case ViewOption.month:
        return _buildMonthView();
    }
  }

  Widget _buildDayView() {
    return const CalendarDay();
  }

  Widget _buildWeekView() {
    return const CalendarWeek();
  }

  Widget _buildMonthView() {
    return const CalendarMonth();
  }
}
