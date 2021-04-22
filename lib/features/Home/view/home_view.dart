import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/enum/service_path.dart';
import '../../../core/constants/locale/locale_key.g.dart';
import '../../../core/extensions/assets_extensions.dart';
import '../../../core/extensions/locale_extensions.dart';
import '../../../core/widget/bottombar/bottom_bar.dart';
import '../../../core/widget/card/card_widget.dart';
import '../../../core/widget/tabbar/tabbar_widget.dart';
import '../../../core/widget/text/locale_text.dart';
import '../model/home_model.dart';
import '../service/home_service.dart';
import '../viewmodel/home_viewmodel.dart';

part '../extensions/string_extensions.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final viewModel = HomeViewModel(
    homeService: HomeService(baseUrl: ServicePath.BASEURL.values),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildListView(context),
      bottomNavigationBar: buildHomeBottomNavBarWidget,
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView(
      children: [
        buildListTile(context),
        Divider(),
        buildRow(context),
        buildTabBar(context),
        buildFutureBuilder
      ],
    );
  }

  HomeBottomNavBarWidget get buildHomeBottomNavBarWidget =>
      HomeBottomNavBarWidget();

  FutureBuilder<List<HomeModel>> get buildFutureBuilder {
    return FutureBuilder(
      future: viewModel.getHomeModelData(),
      builder: (context, snapshot) {
        return buildGridView(context);
      },
    );
  }

  Container buildGridView(BuildContext context) {
    return Container(
      height: context.dynamicHeight(2),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: viewModel.list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: context.dynamicHeight(0.02),
            crossAxisSpacing: context.dynamicHeight(0.006),
            childAspectRatio: 0.75),
        itemBuilder: (context, index) {
          return HomeCardWidget(
            list: viewModel.list,
            index: index,
            isLiked: viewModel.list[index].isLike!,
          );
        },
      ),
    );
  }

  Widget buildTabBar(BuildContext context) {
    return HomeTabBarWidget(
      chair: _StringPathEnum.CHAIR.rawValue,
      all: _StringPathEnum.ALL.rawValue,
      sofa: _StringPathEnum.SOFA.rawValue,
      table: _StringPathEnum.TABLE.rawValue,
      lamp: _StringPathEnum.LAMP.rawValue,
      furniture: _StringPathEnum.FURNITURE.rawValue,
    );
  }

  Row buildRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTextField(context),
        buildSettingsButton(context),
      ],
    );
  }

  Expanded buildSettingsButton(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: context.horizontalPaddingNormal,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: context.lowBorderRadius,
            color: context.colorScheme.onBackground,
          ),
          child: IconButton(
            icon: FaIcon(FontAwesomeIcons.cog),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  Expanded buildTextField(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: context.horizontalPaddingNormal,
        child: Container(
          padding: context.horizontalPaddingNormal,
          decoration: BoxDecoration(
            borderRadius: context.lowBorderRadius,
            color: context.colorScheme.onBackground,
          ),
          child: TextField(
            maxLines: 1,
            decoration: InputDecoration(
              hintText: _StringPathEnum.SEARCH.rawValue.locale,
              icon: FaIcon(FontAwesomeIcons.search),
            ),
          ),
        ),
      ),
    );
  }

  ListTile buildListTile(BuildContext context) {
    return ListTile(
      leading: buildProfileImage(context),
      title: LocaleText(
        text: _StringPathEnum.WELCOME.rawValue,
        style: context.textTheme.caption!.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: AutoSizeText(
        _StringPathEnum.FULL_NAME.rawValue,
        style:
            context.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: buildNotificationsButton(context),
    );
  }

  Stack buildNotificationsButton(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        CircleAvatar(
          radius: context.dynamicHeight(0.006),
          backgroundColor: context.colorScheme.error,
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.bell),
          onPressed: () {},
        ),
      ],
    );
  }

  CircleAvatar buildProfileImage(BuildContext context) {
    return CircleAvatar(
      radius: context.dynamicHeight(0.03),
      backgroundImage: NetworkImage(AssetPathEnum.STATIC_RANDOM_IMAGE.rawValue),
    );
  }
}
