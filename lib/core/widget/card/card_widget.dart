import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../features/Detail/view/home_detail_view.dart';
import '../../../features/Home/model/home_model.dart';
import '../../extensions/assets_extensions.dart';
import 'like_button.dart';

class HomeCardWidget extends StatelessWidget {
  HomeCardWidget({
    Key? key,
    required this.list,
    required this.index,
    required this.isLiked,
  }) : super(key: key);

  final List<HomeModel> list;
  final int index;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigation.push(MaterialPageRoute(
          builder: (context) => HomeDetailView(
            image: image,
            prodName: list[index].name ?? '',
            prodStar: list[index].star ?? 0.0,
            prodDesc: list[index].description ?? '',
            prodPrice: list[index].price ?? 0.0,
            isLiked: isLiked,
          ),
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
        child: buildColumn(context),
      ),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildImage(context),
        buildName(context),
        buildPrice(context),
        buildStars(context),
        buildBuyButton(context),
      ],
    );
  }

  Expanded buildBuyButton(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: context.horizontalPaddingLow,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: AutoSizeText(
                  'Buy',
                  style: context.textTheme.bodyText1!
                      .copyWith(color: context.colorScheme.background),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildStars(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: context.horizontalPaddingLow,
        child: Row(
          children: [
            FaIcon(
              FontAwesomeIcons.solidStar,
              color: context.colorScheme.onPrimary,
            ),
            AutoSizeText(
              '${list[index].star.toString()}',
              style: context.textTheme.bodyText1!
                  .copyWith(color: context.colorScheme.secondary),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildPrice(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: context.horizontalPaddingLow,
        child: AutoSizeText(
          '${list[index].price.toString()}',
          style: context.textTheme.caption!
              .copyWith(color: context.colorScheme.secondary),
        ),
      ),
    );
  }

  Expanded buildName(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: context.horizontalPaddingLow,
        child: AutoSizeText(
          list[index].name ?? '',
          style: context.textTheme.headline6!
              .copyWith(color: context.colorScheme.secondary),
        ),
      ),
    );
  }

  Expanded buildImage(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Stack(
        children: [
          Padding(
            padding: context.paddingLow,
            child: buildProductImageContainer(context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: context.paddingLow,
                child: CircleAvatar(
                    backgroundColor: context.colorScheme.background,
                    child: LikeButton(isLiked: isLiked)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildProductImageContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: context.normalBorderRadius,
        image: buildProductImage,
      ),
    );
  }

  DecorationImage get buildProductImage {
    return DecorationImage(
      image: NetworkImage(image),
      fit: BoxFit.cover,
    );
  }

  final String image = AssetPathEnum.STATIC_RANDOM_IMAGE.rawValue;
}
