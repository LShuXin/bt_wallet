import 'package:flutter/material.dart';
import 'package:flutter_ble_lib_ios_15/flutter_ble_lib.dart';
import 'package:bt_wallet_flutter_01/widgets/layouts/common_layout.dart';

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({super.key, this.state});

  final BluetoothState? state;

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: '蓝牙不可用',
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.bluetooth_disabled,
              size: 200.0,
              color: Colors.white54,
            ),
            Text(
              '蓝牙不可用，请打开蓝牙功能',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
