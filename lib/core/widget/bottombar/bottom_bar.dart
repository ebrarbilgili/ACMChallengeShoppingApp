import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

class HomeBottomNavBarWidget extends StatelessWidget {
  const HomeBottomNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: context.normalRadius, topRight: context.normalRadius),
        color: context.colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            color: context.colorScheme.onBackground,
            padding: context.horizontalPaddingMedium,
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.home),
          ),
          IconButton(
            color: context.colorScheme.onBackground,
            padding: context.horizontalPaddingMedium,
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.shoppingBag),
          ),
          IconButton(
            color: context.colorScheme.onBackground,
            padding: context.horizontalPaddingMedium,
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.star),
          ),
          IconButton(
            color: context.colorScheme.onBackground,
            padding: context.horizontalPaddingMedium,
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.user),
          ),
        ],
      ),
    );
  }
}
