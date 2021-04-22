import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../text/locale_text.dart';

class HomeTabBarWidget extends StatelessWidget {
  const HomeTabBarWidget({
    Key? key,
    required this.chair,
    required this.all,
    required this.sofa,
    required this.table,
    required this.lamp,
    required this.furniture,
  }) : super(key: key);
  final String chair;
  final String all;
  final String sofa;
  final String table;
  final String lamp;
  final String furniture;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.1),
      child: DefaultTabController(
        length: 6,
        child: TabBar(
          isScrollable: true,
          tabs: [
            builTab(chair),
            builTab(all),
            builTab(sofa),
            builTab(table),
            builTab(lamp),
            builTab(furniture),
          ],
        ),
      ),
    );
  }

  Tab builTab(String text) => Tab(child: LocaleText(text: text));
}
