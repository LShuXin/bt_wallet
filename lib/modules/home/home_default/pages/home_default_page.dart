import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

import 'package:bt_wallet/common/application.dart';
import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/models/identity/decentralized_identity.dart';
import 'package:bt_wallet/modules/home/home_default/widgets/tab_view_assets.dart';
import 'package:bt_wallet/modules/home/home_default/widgets/tab_view_certification.dart';
import 'package:bt_wallet/modules/home/home_default/widgets/tab_view_point.dart';
import 'package:bt_wallet/modules/home/home_default/widgets/tab_view_ticket.dart';
import 'package:bt_wallet/modules/home/home/store/home_store.dart';
import 'package:bt_wallet/router/routers.dart';
import 'package:bt_wallet/store/identity_store.dart';
import 'package:bt_wallet/widgets/avatar.dart';
import 'package:bt_wallet/widgets/identity_selection_sheet.dart';
import '../widgets/home_default_header.dart';
import '../widgets/tab_item.dart';
import '../../home/helper.dart';

class HomeDefaultPage extends StatefulWidget {
  const HomeDefaultPage(this.homeStore, {super.key});

  final HomeStore homeStore;

  @override
  State<HomeDefaultPage> createState() => _HomeDefaultPageState();
}

class _HomeDefaultPageState extends State<HomeDefaultPage>
  with SingleTickerProviderStateMixin {

  _HomeDefaultPageState();

  final IdentityStore _identityStore = Get.find();

  static const _tabs = [
    HomePageTab(
      text: 'CBDC',
      icon: ImageIcon(AssetImage('assets/icons/tab-assets.png'), size: 32),
    ),
    HomePageTab(
      text: '票券',
      icon: ImageIcon(AssetImage('assets/icons/tab-package.png'), size: 32),
    ),
    HomePageTab(
      text: '证书',
      icon: ImageIcon(AssetImage('assets/icons/tab-package.png'), size: 32),
    ),
    HomePageTab(
      text: '资产',
      icon: ImageIcon(AssetImage('assets/icons/tab-package.png'), size: 32),
    ),
  ];

  static final _tabViews = [
    const PointTab(),
    const TicketTab(),
    const CertificationTab(),
    const AssetTab()
  ];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    showDialogIfNoIdentity(
      context,
      widget.homeStore,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Column(
        children: <Widget>[
          HomePageHeader(
            name: _identityStore.selectedIdentity
              .map((identity) => identity.profileInfo.name)
              .orElse(''),
            avatar: const AvatarWidget(width: 80),
            tabBar: TabBar(
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
              ),
              labelColor: WalletColor.primary,
              unselectedLabelColor: Colors.white,
              controller: _tabController,
              tabs: _tabs,
            ),
            onAvatarTap: () => _onAvatarTap(context),
            onChangeIdentityTap: () => _onChangeIdentityTap(context),
          ),
          Expanded(
            child: Container(
              color: WalletColor.backgroundWhite,
              child: TabBarView(
                controller: _tabController,
                children: _tabViews,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onAvatarTap(BuildContext context) {
    _identityStore.selectedIdentity.ifPresent((identity) {
      final path = '${Routes.identityDetail}?id=${identity.id}';
      Application.router.navigateTo(context, path);
    });
  }

  Future<void> _onChangeIdentityTap(BuildContext context) {
    final ids = _identityStore.identitiesExceptSelected;
    final selectedIdentity = _identityStore.selectedIdentity;

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return IdentitySelectionSheet(
          identities: ids,
          onSheetItemTap: (index) => _onIdentityCardTap(context, ids[index]),
          selectedIdentity: selectedIdentity.value,
        );
      },
    );
  }

  void _onIdentityCardTap(
      BuildContext context, DecentralizedIdentity identity) {
    _identityStore.selectIdentity(identity);
    Navigator.pop(context);
  }
}
