import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:bt_wallet/common/theme/font.dart';
import 'package:bt_wallet/common/theme/index.dart';
import 'package:bt_wallet/store/identity_store.dart';
import 'package:bt_wallet/modules/home/home/pages/home_page.dart';
import 'package:bt_wallet/modules/home/home/store/home_store.dart';

bool isValidDate(String input) {
  try {
    final date = DateTime.parse(input);
    return input == toOriginalFormatString(date) && isValidDateRange(date);
  } catch (e) {
    return false;
  }
}

String toOriginalFormatString(DateTime dateTime) {
  final y = dateTime.year.toString().padLeft(4, '0');
  final m = dateTime.month.toString().padLeft(2, '0');
  final d = dateTime.day.toString().padLeft(2, '0');
  return '$y-$m-$d';
}

bool isValidDateRange(DateTime date) {
  final DateTime today = DateTime.now();
  const int earliestYear = 1900;
  return date.year >= earliestYear && !today.isBefore(date);
}

void showDialogIfNoIdentity(BuildContext context, HomeStore homeStore) {
  final IdentityStore identityStore = Get.find<IdentityStore>();

  if (identityStore.identitiesWithoutDapp.isEmpty) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _showAddIdentityDialog(context, homeStore);
    });
  }
}

Future<void> _showAddIdentityDialog(
    BuildContext context, HomeStore homeStore) async {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      final ScreenUtil screenUtil = ScreenUtil();
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            width: screenUtil.setWidth(327).toDouble(),
            height: screenUtil.setHeight(555).toDouble(),
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: screenUtil.setHeight(155).toDouble(),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/new-identity.svg',
                    width: screenUtil.setWidth(118).toDouble(),
                    height: screenUtil.setHeight(115).toDouble(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenUtil.setHeight(38).toDouble(),
                    left: screenUtil.setWidth(71).toDouble(),
                    right: screenUtil.setWidth(71).toDouble(),
                  ),
                  child: Text(
                    '您还没有添加身份，请前往"身份"页面添加身份',
                    style: WalletFont.font_14(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenUtil.setWidth(20).toDouble(),
                    vertical: screenUtil.setHeight(48).toDouble(),
                  ),
                  child: WalletTheme.button(
                    text: '立即前往',
                    height: 44,
                    onPressed: () {
                      Navigator.pop(context);
                      homeStore.currentPage = HomeState.identityIndex;
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
