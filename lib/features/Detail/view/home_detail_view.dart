import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/locale/locale_key.g.dart';
import '../../../core/widget/card/like_button.dart';
import '../../../core/widget/text/locale_text.dart';
import '../viewmodel/home_detail_viewmodel.dart';

class HomeDetailView extends StatelessWidget {
  HomeDetailView({
    Key? key,
    required this.image,
    required this.prodName,
    required this.prodStar,
    required this.prodDesc,
    required this.prodPrice,
    required this.isLiked,
  }) : super(key: key);

  final String? image;
  final String? prodName;
  final double? prodStar;
  final String? prodDesc;
  final double? prodPrice;
  final bool? isLiked;

  final viewModel = HomeDetailViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  Column buildBody(BuildContext context) {
    return Column(
      children: [
        buildProdImage(context),
        buildColumnBody(context),
      ],
    );
  }

  Expanded buildColumnBody(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: buildBoxDecorationContainer(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDivider(context),
            buildProdName(context),
            buildStarAndCounter(context),
            buildColors(context),
            buildProdDesc(context),
            buildProdPrice(context),
            buildBottomButtons(context),
          ],
        ),
      ),
    );
  }

  Expanded buildBottomButtons(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: context.horizontalPaddingNormal,
        child: Row(
          children: [buildShopBagButton(context), buildBuyButton(context)],
        ),
      ),
    );
  }

  Expanded buildShopBagButton(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: buildShopBagButtonStyle(context),
        child: FaIcon(
          FontAwesomeIcons.shoppingBag,
          color: context.colorScheme.primary,
        ),
      ),
    );
  }

  Expanded buildBuyButton(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ElevatedButton(
        onPressed: () {},
        child: LocaleText(
          text: LocaleKeys.home_buy,
          style: context.textTheme.bodyText1!
              .copyWith(color: context.colorScheme.onBackground, fontSize: 20),
        ),
      ),
    );
  }

  ButtonStyle buildShopBagButtonStyle(BuildContext context) {
    return ButtonStyle(
      shape: MaterialStateProperty.all(CircleBorder()),
      backgroundColor:
          MaterialStateProperty.all(context.colorScheme.background),
    );
  }

  Expanded buildProdPrice(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: context.paddingNormal,
        child: AutoSizeText(
          '$prodPrice',
          style: context.textTheme.headline5!.copyWith(
            color: context.colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Expanded buildProdDesc(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: context.paddingNormal,
        child: AutoSizeText(prodDesc!),
      ),
    );
  }

  Expanded buildColors(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: context.horizontalPaddingNormal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LocaleText(
              text: LocaleKeys.home_detail_color,
              style: context.textTheme.headline5!.copyWith(
                color: context.colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(
              flex: 4,
            ),
            CircleAvatar(
              backgroundColor: context.colorScheme.error,
              radius: context.dynamicHeight(0.02),
            ),
            Spacer(),
            CircleAvatar(
              backgroundColor: context.colorScheme.primary,
              radius: context.dynamicHeight(0.02),
            ),
            Spacer(),
            CircleAvatar(
              backgroundColor: context.colorScheme.onSecondary,
              radius: context.dynamicHeight(0.02),
            ),
            Spacer(),
            CircleAvatar(
              backgroundColor: context.colorScheme.secondaryVariant,
              radius: context.dynamicHeight(0.02),
            ),
            Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }

  Divider buildDivider(BuildContext context) {
    return Divider(
      height: context.dynamicHeight(0.03),
      color: context.colorScheme.onBackground,
    );
  }

  Expanded buildProdName(BuildContext context) => Expanded(
        child: Padding(
          padding: context.horizontalPaddingNormal,
          child: AutoSizeText(
            prodName!,
            style: context.textTheme.headline5!.copyWith(
              color: context.colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  Expanded buildStarAndCounter(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: context.horizontalPaddingNormal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              label: Text(
                '$prodStar',
                style: context.textTheme.bodyText1!.copyWith(
                  color: context.colorScheme.onBackground,
                ),
              ),
              icon: FaIcon(FontAwesomeIcons.solidStar),
            ),
            Wrap(
              children: [
                ElevatedButton(
                  onPressed: () {
                    viewModel.decrement();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      context.colorScheme.secondaryVariant,
                    ),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.minus,
                    color: context.colorScheme.background,
                  ),
                ),
                Container(
                    margin: context.paddingLow,
                    color: context.colorScheme.background,
                    child: Observer(
                      builder: (context) => Text(
                        '${viewModel.counter}',
                        style: context.textTheme.headline5!.copyWith(
                          color: context.colorScheme.secondary,
                        ),
                      ),
                    )),
                ElevatedButton(
                  onPressed: () {
                    viewModel.increment();
                  },
                  child: FaIcon(
                    FontAwesomeIcons.plus,
                    color: context.colorScheme.background,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildProdImage(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: context.highBorderRadius,
          image: DecorationImage(
            image: NetworkImage(image!),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecorationContainer(BuildContext context) {
    return BoxDecoration(
      color: context.colorScheme.onBackground,
      borderRadius: BorderRadius.only(
        topLeft: context.normalRadius * 2,
        topRight: context.normalRadius * 2,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: LocaleText(
        text: LocaleKeys.home_detail_detail_product,
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.primary),
      ),
      automaticallyImplyLeading: true,
      actions: [LikeButton(isLiked: isLiked!)],
    );
  }
}
