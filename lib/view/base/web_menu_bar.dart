// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jazeera_paints/util/dimensions.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:jazeera_paints/view/screens/dashboard/dashboard_screen.dart';
import 'package:jazeera_paints/view/screens/favorite/favorite_screen.dart';
import 'package:jazeera_paints/view/screens/home/home_screen.dart';
import 'package:jazeera_paints/view/screens/order/order_screen.dart';
import 'package:jazeera_paints/view/screens/profile/profile_screen.dart';


class WebMenuBar extends StatelessWidget implements PreferredSizeWidget {
  const WebMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Dimensions.WEB_MAX_WIDTH,
        color: Theme.of(context).cardColor,
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
        child: Row(
          children: [
            Expanded(child: SizedBox()),
            MenuButton(icon: Icons.home_filled, title: 'Home', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen(exitFromApp: true,)))),
            SizedBox(width: 20),
            MenuButton(icon: Icons.search, title: 'Search', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>FavoriteScreen()))),
            SizedBox(width: 20),
            MenuButton(icon: Icons.favorite, title: 'Favourite', onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>FavoriteScreen()))),
            SizedBox(width: 20),
            MenuButton(icon: Icons.shopping_bag, title: 'Orders',  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderScreen()))),
            SizedBox(width: 20),
            MenuButton(icon: Icons.menu, title: 'Menu', onTap: () {
              Get.bottomSheet(ProfileScreen(), backgroundColor: Colors.transparent, isScrollControlled: true);
            }),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(Dimensions.WEB_MAX_WIDTH, 70);
}

class MenuButton extends StatelessWidget{
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const MenuButton({super.key, required this.icon, required this.title,  required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(icon,size: 20,),
            ],
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),

          Text(title, style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),

        ],
      ),
    );
  }

}
