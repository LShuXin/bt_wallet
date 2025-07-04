import 'package:flutter_test/flutter_test.dart';
import 'package:bt_wallet/models/amount.dart';

void main() {
  group('Amount', () {
    test('Amount human readable should be 1.00', () {
      expect(Amount.parse('100').humanReadable, '1.00');
    });

    test('Amount human readable should be -1.00', () {
      expect(Amount.parse('-100').humanReadable, '-1.00');
    });

    test('Amount human readable with flag should be +1.00', () {
      expect(Amount.parse('100').humanReadableWithSign, '+￥1.00');
    });

    test('Amount human readable with flag should be -1.00', () {
      expect(Amount.parse('-100').humanReadableWithSign, '-￥1.00');
    });
  });
}
