// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jazeera_paints/helper/responsive_helper.dart';
import 'package:jazeera_paints/util/dimensions.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:jazeera_paints/view/base/custom_app_bar.dart';
import 'package:jazeera_paints/view/screens/faq/privacy_policy.dart';
import 'package:jazeera_paints/view/screens/faq/terms_conditions.dart';
import 'package:jazeera_paints/view/screens/forget/new_pass_screen.dart';
import 'package:jazeera_paints/view/screens/profile/my_account_screen.dart';
import 'package:jazeera_paints/view/screens/profile/update_profile_screen.dart';
import 'package:jazeera_paints/view/screens/profile/widgets/profile_bg_widget.dart';
import 'package:jazeera_paints/view/screens/profile/widgets/profile_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        body: Center(
          child: ProfileBgWidget(
            backButton: false,
            circularImage: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Theme.of(context).cardColor),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: ClipOval(
                child: Image(
                    image: AssetImage('assets/images/avatar.png'),
                    height: 100,
                    width: 100),
              ),
            ),
            mainWidget: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Center(
                child: Container(
                    width: 1170,
                    color: Theme.of(context).cardColor,
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    child: Column(children: [
                      Text(
                        'John Doe', style: robotoMedium.copyWith(fontSize: 20),
                      ),
                      SizedBox(height: 30),
                      ProfileButton(
                          icon: Icons.person,
                          title: 'My Account',
                          onTap: () {
                            Navigator.pushNamed(context, '/initialPage');
                          }),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      ProfileButton(
                          icon: Icons.language,
                          title: 'Language',
                          onTap: () {}),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      ProfileButton(
                          icon: Icons.edit,
                          title: 'Edit Profile',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditProfileScreen()));
                          }),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      ProfileButton(
                          icon: Icons.lock,
                          title: 'Change Password',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NewPassScreen()));
                          }),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      ProfileButton(
                          icon: Icons.list_outlined,
                          title: 'Terms&Conditions',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TermsConditions()));
                          }),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      ProfileButton(
                          icon: Icons.privacy_tip,
                          title: 'Privacy Policy',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicy()));
                          }),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      ProfileButton(
                        icon: Icons.logout,
                        title: 'LogOut',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Log Out'),
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
                        },
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${'Version'}:',style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall)),
                            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Text('1.0', style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeExtraSmall)),
                          ]),
                    ])),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
