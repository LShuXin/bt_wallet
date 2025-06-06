import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:bt_wallet_flutter_01/common/application.dart';
import 'package:bt_wallet_flutter_01/common/theme/color.dart';
import 'package:bt_wallet_flutter_01/common/theme/font.dart';
import 'package:bt_wallet_flutter_01/common/theme/index.dart';
import 'package:bt_wallet_flutter_01/service/progress_dialog.dart';
import 'package:bt_wallet_flutter_01/views/home/identity/identity_new_store.dart';
import 'package:bt_wallet_flutter_01/widgets/avatar.dart';
import 'package:bt_wallet_flutter_01/widgets/error_row.dart';
import 'package:bt_wallet_flutter_01/widgets/hint_dialog.dart';
import 'package:bt_wallet_flutter_01/widgets/layouts/common_layout.dart';

class IdentityNewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IdentityNewPageState();
}

class _IdentityNewPageState extends State<IdentityNewPage> {
  bool isAdding = false;
  final IdentityNewStore store = IdentityNewStore();
  final ProgressDialog _dialog = Get.find();

  @override
  void initState() {
    super.initState();
    store.setErrorResetDispatchers();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  bool btnDisabled() {
    return store.name.isEmpty;
  }

  Future<void> _addOnPressed() async {
    store.validateAll();
    if (!store.error.hasErrors && !isAdding) {
      isAdding = true;
      _dialog.show();
      await store.addIdentity().then((success) {
        store.clearError();
        _dialog.dismiss();
        if (success as bool) {
          showDialogSimple(DialogType.success, '创建成功')
              .then((_) => Application.router.pop(context));
        }
        isAdding = false;
      });
    }
  }

  InputDecoration buildInputDecoration(
      {required String assetIcon,
      required String labelText,
      required String hintText}) {
    return InputDecoration(
      icon: SvgPicture.asset(assetIcon),
      labelText: labelText,
      labelStyle:
          WalletFont.font_14(textStyle: TextStyle(color: WalletColor.grey)),
      hintText: hintText,
      counterText: '',
      border: InputBorder.none,
    );
  }

  Widget buildInputField({required Widget textFieldChild, String? errorText}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: textFieldChild),
                ],
              ),
            ],
          ),
          Container(
            height: 1,
            color:
                errorText != null ? WalletColor.accent : WalletColor.middleGrey,
            margin: const EdgeInsets.only(top: 6),
          ),
          if (errorText != null) ErrorRowWidget(errorText: errorText)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => CommonLayout(
        title: '个人信息',
        bottomBackColor: WalletColor.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(40),
              alignment: Alignment.center,
              child: const AvatarWidget(width: 80),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: WalletColor.white,
                ),
                child: Form(
                  child: ListView(
                    children: <Widget>[
                      buildInputField(
                        textFieldChild: TextField(
                          maxLength: 16,
                          keyboardType: TextInputType.text,
                          onChanged: (String value) =>
                              store.name = value.trim(),
                          decoration: buildInputDecoration(
                            assetIcon: 'assets/icons/name.svg',
                            labelText: '名称*',
                            hintText: '输入名称',
                          ),
                        ),
                        errorText: store.error.username,
                      ),
                      buildInputField(
                        textFieldChild: TextField(
                          onChanged: (value) => store.email = value,
                          keyboardType: TextInputType.emailAddress,
                          decoration: buildInputDecoration(
                            assetIcon: 'assets/icons/email.svg',
                            labelText: '邮箱',
                            hintText: '输入邮箱',
                          ),
                        ),
                        errorText: store.error.email,
                      ),
                      buildInputField(
                        textFieldChild: TextField(
                          onChanged: (value) => store.phone = value,
                          keyboardType: TextInputType.phone,
                          decoration: buildInputDecoration(
                            assetIcon: 'assets/icons/phone.svg',
                            labelText: '手机',
                            hintText: '输入手机号',
                          ),
                        ),
                        errorText: store.error.phone,
                      ),
                      buildInputField(
                        textFieldChild: TextField(
                          onChanged: (value) => store.birthday = value,
                          keyboardType: TextInputType.datetime,
                          decoration: buildInputDecoration(
                            assetIcon: 'assets/icons/birth.svg',
                            labelText: '生日',
                            hintText: 'YYYY-MM-DD',
                          ),
                        ),
                        errorText: store.error.birthday,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 100),
                        child: WalletTheme.button(
                          text: '确定创建身份',
                          onPressed:
                              btnDisabled() || isAdding ? null : _addOnPressed,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
