import 'package:flutter/material.dart';

import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/service/dapp.dart';
import 'package:bt_wallet/modules/home/home/store/home_store.dart';
import 'package:bt_wallet/modules/home/home_default/pages/home_default_page.dart';
import 'package:bt_wallet/modules/home/discovery/pages/discovery_page.dart';
import 'package:bt_wallet/modules/home/identity/pages/identity_page.dart';
import 'package:bt_wallet/modules/home/mine/pages/mine_page.dart';

class Home extends StatefulWidget {
  const Home({super.key, this.defaultIndex = 0});

  final int defaultIndex;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  HomeState();

  static int get identityIndex => 2;

  static final Map<String, Map<String, String>> iconPaths = {
    'home': {
      'unselected': 'assets/icons/bottom_bar/home.svg',
      'selected': 'assets/icons/bottom_bar/home_selected.svg',
    },
    'discovery': {
      'unselected': 'assets/icons/bottom_bar/discovery.svg',
      'selected': 'assets/icons/bottom_bar/discovery_selected.svg',
    },
    'identity': {
      'unselected': 'assets/icons/bottom_bar/identity.svg',
      'selected': 'assets/icons/bottom_bar/identity_selected.svg',
    },
    'me': {
      'unselected': 'assets/icons/bottom_bar/me.svg',
      'selected': 'assets/icons/bottom_bar/me_selected.svg',
    }
  };

  static SvgPicture svgIcon(String path) => SvgPicture.asset(path);

  static final List<BottomNavigationBarItem> _barItems = [
    BottomNavigationBarItem(
      icon: svgIcon(iconPaths['home']!['unselected']!),
      activeIcon: svgIcon(iconPaths['home']!['selected']!),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: svgIcon(iconPaths['discovery']!['unselected']!),
      activeIcon: svgIcon(iconPaths['discovery']!['selected']!),
      label: 'Discover',
    ),
    BottomNavigationBarItem(
      icon: svgIcon(iconPaths['identity']!['unselected']!),
      activeIcon: svgIcon(iconPaths['identity']!['selected']!),
      label: 'Role',
    ),
    BottomNavigationBarItem(
      icon: svgIcon(iconPaths['me']!['unselected']!),
      activeIcon: svgIcon(iconPaths['me']!['selected']!),
      label: 'Profile', //我
    ),
  ];

  final HomeStore homeStore = HomeStore();

  List<Widget>? _pages;

  @override
  void initState() {
    super.initState();
    homeStore.currentPage = widget.defaultIndex;
    _pages = [
      HomeDefaultPage(homeStore),
      DiscoveryPage(homeStore),
      IdentityPage(),
      MyPage(homeStore)
    ];
  }

  @override
  Widget build(BuildContext context) {
    DAppService.context = context;
    YYDialog.init(context);

    return Scaffold(
      backgroundColor: WalletColor.primary,
      body: Observer(
        builder: (_) => SafeArea(child: _pages![homeStore.currentPage]),
      ),
      bottomNavigationBar: Observer(
        builder: (_) => BottomNavigationBar(
          items: _barItems,
          currentIndex: homeStore.currentPage,
          type: BottomNavigationBarType.fixed,
          fixedColor: WalletColor.primary,
          selectedFontSize: 12,
          onTap: (int index) {
            homeStore.currentPage = index;
          },
        ),
      ),
    );
  }
}
