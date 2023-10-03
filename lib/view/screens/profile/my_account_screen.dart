// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jazeera_paints/helper/responsive_helper.dart';
import 'package:jazeera_paints/util/dimensions.dart';
import 'package:jazeera_paints/util/images.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:jazeera_paints/view/base/custom_box.dart';
import 'package:jazeera_paints/view/screens/address/address_screen.dart';
import 'package:jazeera_paints/view/screens/favorite/favorite_screen.dart';
import 'package:jazeera_paints/view/screens/order/order_screen.dart';
import 'package:jazeera_paints/view/screens/profile/my_agenda_screen.dart';
import 'package:jazeera_paints/view/screens/profile/my_profile_screen.dart';
import 'package:jazeera_paints/view/screens/profile/my_works_screen.dart';
import 'package:jazeera_paints/view/screens/reviews/reviews_screen.dart';
import 'package:jazeera_paints/view/screens/tabs/widgets/calendar_month.dart';
import 'package:jazeera_paints/view/screens/wallet/wallet_screen.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  final ScrollController _scrollController = ScrollController();

  String get text => 'Deliver to ';
  String get appname => 'Jazeera Paints';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfileScreen()));
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CalendarMonth()));
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
            onRefresh: () async {},
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
                    height: 510,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        border: Border(), color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('My Account', style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeOverLarge),),
                              const SizedBox(),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text('Hey,John Doe Welcome to your account! Please edit your profile and availability below', style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomBoxWidget(
                                    onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) =>MyAgendaScreen())); },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: Icon(Icons.hourglass_empty_outlined,size: 35),
                                        ),
                                        SizedBox(height: 10),
                                        Text('My Agenda',),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  CustomBoxWidget(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfileScreen()));
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:  [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: Image.asset(Images.avatar_circle),
                                        ),
                                        SizedBox(height: 10),
                                        Text('My Profile'),                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10.0,),
                                  CustomBoxWidget(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => OrderScreen()));
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:  [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: Image.asset(Images.tracking),
                                        ),
                                        SizedBox(height: 10),
                                        Text('My Orders'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomBoxWidget(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyWorksScreen()));
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:  const [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: Icon(Icons.hourglass_empty_outlined,size: 35,),
                                        ),
                                        SizedBox(height: 10),
                                        Text('My Works'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10.0,),
                                  CustomBoxWidget(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewsScreen()));
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:  [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: Image.asset(Images.reviews,height: 30,width: 30,),
                                        ),
                                        SizedBox(height: 10),
                                        Text('Reviews'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10.0,),
                                  CustomBoxWidget(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen()));
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:  [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: Image.asset(Images.favorite,height: 30,width: 30,),
                                        ),
                                        SizedBox(height: 10),
                                        Text('My Favorites'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomBoxWidget(
                                    onTap: () { print('Clicked Loyalty Program'); },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:  [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: Image.asset(Images.loyal),
                                        ),
                                        SizedBox(height: 10),
                                        Text('Loyalty'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  CustomBoxWidget(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddressScreen()));
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:  [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: Image.asset(Images.location,height: 35,width: 35,),
                                        ),
                                        SizedBox(height: 10),
                                        Text('My Addresses'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10.0,),
                                  CustomBoxWidget(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => WalletScreen()));
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:  [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: Image.asset(Images.wallet,height: 35,width: 35,),
                                        ),
                                        SizedBox(height: 10),
                                        Text('My Wallet'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomBoxWidget(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfileScreen()));
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:  [
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: Image.asset(Images.settings,height: 35,width: 35,),
                                        ),
                                        SizedBox(height: 10),
                                        Text('Settings'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
