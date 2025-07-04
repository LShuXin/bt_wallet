import 'package:flutter/material.dart';

import 'package:bt_wallet/common/application.dart';

class IconBackButton extends StatelessWidget {
  const IconBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            iconSize: 28,
            onPressed: () {
              Application.router.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
