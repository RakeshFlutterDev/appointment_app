// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jazeera_paints/helper/responsive_helper.dart';
import 'package:jazeera_paints/util/dimensions.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:jazeera_paints/view/screens/address/address_screen.dart';
import 'package:jazeera_paints/view/screens/profile/update_profile_screen.dart';
import 'package:jazeera_paints/view/screens/tabs/widgets/calendar_month.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final ScrollController _scrollController = ScrollController();

  String get text => 'Deliver to ';
  String get appname => 'Jazeera Paints';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ResponsiveHelper.isDesktop(context) ? Colors.transparent : Theme.of(context).cardColor,
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddressScreen()));
            },
          ),
          IconButton(
            icon:  Icon(Icons.account_circle_outlined),
            onPressed: () {
              // handle cart button press
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
                  Text('User Name',style: TextStyle(
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
           //     Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccountScreen()));
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
                        onTap: (){},
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
                  height: 1390,
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
                            Text('My Profile', style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeOverLarge),),
                            const SizedBox(),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('This information will be publicly so be careful what you share!', style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                OutlinedButton(
                                  onPressed: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditProfileScreen()));
                                  },
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Icon(Icons.edit_outlined, color: Colors.blue), // set the icon of the button
                                      SizedBox(width: 2), // add some space between the icon and text
                                      Text('Edit Profile', style: TextStyle(color: Colors.blue, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage(
                                    'assets/images/avatar.png',
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Text('John Doe',style: robotoRegular.copyWith(fontSize: 25),),
                                ],
                            ),
                            const SizedBox(height: 10.0),
                            Text('Interior Professional Painter',style: robotoRegular.copyWith(fontSize: 20),),
                            const SizedBox(height: 10.0),
                            Row(
                              children: const[
                                Icon(Icons.star,color: Colors.blue,),
                                Icon(Icons.star,color: Colors.blue,),
                                Icon(Icons.star,color: Colors.blue,),
                                Icon(Icons.star,color: Colors.blue,),
                                Icon(Icons.star_half,color: Colors.blue,),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Text('Years Of Experience | 5years',style: robotoRegular.copyWith(fontSize: 16),),
                            SizedBox(height: 35,),
                            Text('Introduction',style: robotoRegular.copyWith(fontSize: 16),),
                            SizedBox(height: 25,),
                            Text('As a seasoned professional in the painting industry, I possess the skills and expertise to deliver outstanding results. With a meticulous approach, I bring precision, creativity, and attention to detail to every project. Customer satisfaction is my top priority, and I strive to exceed expectations by providing exceptional craftsmanship and a seamless painting experience. Trust me to transform your space into a work of art with my professionalism, reliability, and commitment to delivering the highest quality work.',style: robotoRegular.copyWith(fontSize: 16),),
                            SizedBox(height: 45,),
                            Text('More Information',style: robotoRegular.copyWith(fontSize: 16),),
                            SizedBox(height: 35,),
                            Text('Expert In:',style: robotoRegular.copyWith(fontSize: 16),),
                            Row(
                              children: [
                                TextButton(onPressed: (){}, child: Text('Interior')),
                                SizedBox(width: 40,),
                                TextButton(onPressed: (){}, child: Text('Decorative')),
                                SizedBox(width: 40,),
                                TextButton(onPressed: (){}, child: Text('Plastaring'))
                              ],
                            ),
                            SizedBox(height: 35,),
                            Text('Specific Products:',style: robotoRegular.copyWith(fontSize: 16),),
                            Row(
                              children: [
                                TextButton(onPressed: (){}, child: Text('Wood')),
                                SizedBox(width: 40,),
                                TextButton(onPressed: (){}, child: Text('Concrete')),
                              ],
                            ),
                            SizedBox(height: 25,),
                            Center(child: Text('Work Gallery',style: robotoRegular.copyWith(fontSize: 20))),
                            SizedBox(height: 15,),
                            Center(child: Text('No works have been added yet',style: robotoRegular.copyWith(fontSize: 16))),
                            SizedBox(height: 15,),
                            Center(child: Text('Add your first one so the clients can select you',style: robotoRegular.copyWith(fontSize: 14))),
                            SizedBox(height: 15,),
                            Center(child: ElevatedButton(onPressed: (){}, child: Text('+ Add your first one',style: robotoRegular.copyWith(fontSize: 14,color: Colors.white)))),
                            SizedBox(height: 25,),
                            Center(child: Text('Reviews',style: robotoRegular.copyWith(fontSize: 20))),
                            SizedBox(height: 25,),
                            Center(child: Text('4.3',style: robotoRegular.copyWith(fontSize: 20))),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const[
                                Icon(Icons.star,color: Colors.blue,),
                                Icon(Icons.star,color: Colors.blue,),
                                Icon(Icons.star,color: Colors.blue,),
                                Icon(Icons.star,color: Colors.blue,),
                                Icon(Icons.star_half,color: Colors.blue,),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Center(child:TextButton(
                              onPressed: (){},
                                child:Text('(102 reviews)',style: robotoRegular.copyWith(fontSize: 16))),
                            ),
                            SizedBox(height: 10,),
                            Center(child:ElevatedButton(
                                onPressed: (){},
                                child:Text('Write a review',style: robotoRegular.copyWith(fontSize: 16,color: Colors.white70))),
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
    );
  }
}
