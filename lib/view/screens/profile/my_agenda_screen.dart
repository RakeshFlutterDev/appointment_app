// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jazeera_paints/helper/responsive_helper.dart';
import 'package:jazeera_paints/util/dimensions.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:jazeera_paints/view/screens/address/address_screen.dart';
import 'package:jazeera_paints/view/screens/home/widget/weather_widget.dart';
import 'package:jazeera_paints/view/screens/profile/my_account_screen.dart';
import 'package:jazeera_paints/view/screens/profile/my_profile_screen.dart';
import 'package:jazeera_paints/view/screens/tabs/tab_bar.dart';
import 'package:jazeera_paints/view/screens/tabs/widgets/calendar_month.dart';

import '../test.dart';


class MyAgendaScreen extends StatefulWidget {
  const MyAgendaScreen({super.key});

  @override
  State<MyAgendaScreen> createState() => _MyAgendaScreenState();
}

class _MyAgendaScreenState extends State<MyAgendaScreen> {
  final ScrollController _scrollController = ScrollController();

  String get text => 'Deliver to ';
  String get appname => 'Jazeera Paints';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ResponsiveHelper.isDesktop(context) ? Colors.transparent : Theme.of(context).colorScheme.background,
        title: Text(appname,style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),
        actions: [
          Image(
            image: AssetImage('assets/images/logo.png'),
            height: 20,
            width: 20,
          ),
          IconButton(
            icon:  Icon(Icons.location_on_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressScreen()));
            },
          ),
          IconButton(
            icon:  Icon(Icons.account_circle_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfileScreen()));
            },
          ),
          IconButton(
            icon:  Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              // handle cart button press
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      'assets/images/avatar.png',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('John Doe',style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),)
                ],
              ),
            ),
            ListTile(
              leading:  Icon(Icons.person),
              title:  Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfileScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.language_outlined),
              title:  Text('Language'),
              onTap: () {
                // handle drawer item press
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_month),
              title:  Text('Calendar'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CalendarScreen()));
              },
            ),

            ListTile(
              leading: Icon(Icons.shopping_bag_outlined),
              title:  Text('Orders'),
              onTap: () {
                Navigator.pushNamed(context, '/orders');
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title:  Text('Help&Support'),
              onTap: () {
                // handle drawer item press
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Icon(Icons.help,size: 50),
                              content:
                              Text('Are you sure you want to log out?'),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: Text('Log Out'),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/login');
                                  },
                                ),
                                ElevatedButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),

                              ],
                            );
                          },
                        );
                      }, child: Text('LogOut')),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: ()async{},
          child: CustomScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(10.0),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                        width: 2.0,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Colour, Product and Categories...',
                        filled: true,
                        fillColor: Colors.white54,
                        prefixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              // TODO: Handle search button press
                            }),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 22.0,
                          vertical: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on,),
                      Text(text,style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault)),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddressScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("India",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: Colors.blue),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 1962,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      border: Border(),
                      color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'My Agenda',
                          style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeOverLarge),
                        ),
                      ),
                      const SizedBox(),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Here you will find all information about your tasks and your Calendar',
                          style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Center(
                          child: SizedBox(
                            height:52,
                            width: 190,
                            child: WeatherScreen(
                              locationName: 'India',
                              temperature: 38.5,
                              date: DateTime.now(),
                            ),
                          )),
                      const SizedBox(height: 10,),
                      const SizedBox(height: 1798, width: double.infinity, child: TabBarScreen()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
