import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import 'package:tuple/tuple.dart';
import 'package:get/get.dart';

import 'package:bt_wallet/common/application.dart';
import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/common/theme/font.dart';
import 'package:bt_wallet/store/mnemonics.dart';
import 'package:bt_wallet/views/confirm_hd_wallet/widgets/word_button.dart';
import 'package:bt_wallet/views/home/home.dart';
import 'package:bt_wallet/widgets/hint_dialog.dart';
import 'package:bt_wallet/widgets/layouts/common_layout.dart';

class ConfirmHDWalletPage extends StatefulWidget {
  const ConfirmHDWalletPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ConfirmHDWalletPageState();
  }
}

class ConfirmHDWalletPageState extends State<ConfirmHDWalletPage> {
  final MnemonicsStore _store = Get.find<MnemonicsStore>();
  final List<Tuple2<int, String>> _selectedWords = [];
  List<String> _words = [];

  Widget buildWords() {
    final List<Widget> wordWidgets = [];
    for (final Tuple2<int, String> tag in _selectedWords) {
      wordWidgets.add(
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(tag.item2, style: WalletFont.font_16()),
        ),
      );
    }
    return Wrap(children: wordWidgets);
  }

  Widget buildWordButtons(MnemonicsStore mnemonics) {
    final List<Widget> wordButtons = [];
    _words.asMap().forEach((index, word) {
      wordButtons.add(
        WordButton(
          text: word,
          onPressed: () {
            final Tuple2<int, String> tag = Tuple2(index, word);
            if (!_selectedWords.contains(tag)) {
              setState(() {
                _selectedWords.add(tag);
              });
            } else {
              final tagIndex = _selectedWords.indexOf(tag);
              setState(() {
                _selectedWords.removeAt(tagIndex);
              });
            }
          },
        ),
      );
    });
    return Wrap(children: wordButtons);
  }

  Widget buildInfoTipButton() {
    return Positioned(
      top: -6,
      right: 0,
      child: GestureDetector(
        onTap: () => hintDialogHelper(
          context,
          DialogType.none,
          '使用纸和笔正确抄写助记词。\n请勿将助记词告诉任何人，妥善保管至隔离网络的安全地方。\n如果您的手机丢失、被盗、损坏，助记词可以恢复您的资产。',
          title: '备份提示',
        ),
        child: const Image(
          image: AssetImage('assets/images/info-black.png'),
          width: 40,
          height: 40,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_words.isEmpty) {
      _words = _store.mnemonics.split(' ');
      _words.shuffle();
    }

    final bool buttonDisabled = _selectedWords.map((tuple) => tuple.item2).toList().join(' ') != _store.mnemonics;

    return CommonLayout(
      withBottomBtn: true,
      btnOnPressed: buttonDisabled
        ? null
        : () async {
            return _store.save().then((_) {
              if (!context.mounted) {
                return;
              }
              Application.router.navigateTo(
                context,
                '/home?index=${HomeState.identityIndex}',
                transition: TransitionType.native,
                clearStack: true,
              );
            });
          },
      bottomBackColor: WalletColor.white,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: WalletColor.white,
        ),
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        '确认助记词',
                        style: WalletFont.font_20(),
                      ),
                    ),
                    buildInfoTipButton()
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Text(
                '-请按顺序点击下方助记词，确认您的正确备份-',
                style: WalletFont.font_14(),
                textAlign: TextAlign.center,
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 200),
              child: Container(
                margin: const EdgeInsets.only(top: 24),
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: WalletColor.lightGrey,
                ),
                child: buildWords(),
              ),
            ),
            Container(
              height: 1,
              margin: const EdgeInsets.only(top: 24),
              color: WalletColor.middleGrey,
            ),
            Container(
              margin: const EdgeInsets.only(top: 14),
              child: buildWordButtons(_store),
            )
          ],
        ),
      ),
    );
  }
}
