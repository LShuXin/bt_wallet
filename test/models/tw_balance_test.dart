import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bt_wallet/models/amount.dart';
import 'package:bt_wallet/models/tw_balance.dart';

void main() {
  group('TW Balance', () {
    test('Value should be 10000.00', () {
      final balance = TwBalance.fromJson({
        "balance": "1000000",
        "twpoint": {"name": "TWPointERC20Token", "symbol": "TWP", "decimal": 18}
      });

      expect(balance.amount, isA<Amount>());
      expect(balance.amount.value, Decimal.parse('10000'));
      expect(balance.amount.humanReadable, '10000.00');
    });

    test('Value should be 10000.12', () {
      final balance = TwBalance.fromJson({
        "balance": "1000012",
        "twpoint": {"name": "TWPointERC20Token", "symbol": "TWP", "decimal": 18}
      });

      expect(balance.amount, isA<Amount>());
      expect(balance.amount.value, Decimal.parse('10000.12'));
      expect(balance.amount.humanReadable, '10000.12');
    });

    test('Value should be 0.00', () {
      final balance = TwBalance.fromJson({
        "balance": "0",
        "twpoint": {"name": "TWPointERC20Token", "symbol": "TWP", "decimal": 18}
      });

      expect(balance.amount, isA<Amount>());
      expect(balance.amount.value, Decimal.parse('0'));
      expect(balance.amount.humanReadable, '0.00');
    });
  });
}
