// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jazeera_paints/util/dimensions.dart';

class WebHomeScreen extends StatefulWidget {
  final ScrollController scrollController;
  const WebHomeScreen({Key? key, required this.scrollController})
      : super(key: key);

  @override
  State<WebHomeScreen> createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        controller: widget.scrollController,
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: Center(
                  child: SizedBox(
                      width: Dimensions.WEB_MAX_WIDTH,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                         Text('WB')
                          ],
                      ),
                  ),
              ),
          ),
        ]);
  }
}
