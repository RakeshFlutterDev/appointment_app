import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jazeera_paints/helper/responsive_helper.dart';
import 'package:jazeera_paints/util/dimensions.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:jazeera_paints/view/screens/home/widget/web_app_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonExist;
  final Function onBackPressed;
  final bool showCart;
  const CustomAppBar({super.key, required this.title, this.isBackButtonExist = true,  required this.onBackPressed, this.showCart = false});

  @override
  Widget build(BuildContext context) {
    return GetPlatform.isDesktop ? const WebAppBar() : AppBar(
      title: Text(title, style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).textTheme.bodyLarge!.color)),
      centerTitle: true,
      leading: isBackButtonExist ? IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: Theme.of(context).textTheme.bodyLarge!.color,
        onPressed: () => onBackPressed != null ? onBackPressed() : Navigator.pop(context),
      ) : const SizedBox(),
      backgroundColor: Theme.of(context).cardColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size(Dimensions.WEB_MAX_WIDTH, GetPlatform.isDesktop ? 70 : 50);
}
