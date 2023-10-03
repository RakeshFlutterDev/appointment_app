import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jazeera_paints/helper/responsive_helper.dart';
import 'package:jazeera_paints/util/dimensions.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:jazeera_paints/view/screens/address/address_screen.dart';
import 'package:jazeera_paints/view/screens/profile/my_profile_screen.dart';

class AppBarBase extends StatefulWidget implements PreferredSizeWidget{
  const AppBarBase({Key? key}) : super(key: key);

  @override
  State<AppBarBase> createState() => _AppBarBaseState();

  @override
  Size get preferredSize => Size(Dimensions.WEB_MAX_WIDTH, GetPlatform.isDesktop ? 70 : 50);
}

class _AppBarBaseState extends State<AppBarBase>  {
  String get appname => 'Jazeera Paints';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ResponsiveHelper.isDesktop(context) ? Colors.transparent : Theme.of(context).colorScheme.background,
        title: Text(appname,style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),
        actions: [
          const Image(
            image: AssetImage('assets/images/logo.png'),
            height: 20,
            width: 20,
          ),
          IconButton(
            icon:  const Icon(Icons.location_on_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressScreen()));
            },
          ),
          IconButton(
            icon:  const Icon(Icons.account_circle_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfileScreen()));
            },
          ),
          IconButton(
            icon:  const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              // handle cart button press
            },
          ),
        ],
      ),
    );
  }
}


class AppBarBody extends StatefulWidget {
  const AppBarBody({Key? key}) : super(key: key);

  @override
  State<AppBarBody> createState() => _AppBarBodyState();
}

class _AppBarBodyState extends State<AppBarBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.location_on_outlined,),
            Text('Deliver to',style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault)),
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
      ],
    );
  }
}

