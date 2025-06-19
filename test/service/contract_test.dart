import 'package:flutter_test/flutter_test.dart';
import 'package:bt_wallet/models/contract.dart';

void main() {
  group('Contract', () {
    test('Contract deserialize should be successful', () {
      final Map<String, dynamic> _serialized = {
        'address': 'address',
        'name': 'name',
        'abi': 'abi'
      };
      expect(Contract.fromJson(_serialized), isA<Contract>());
    });
  });
}
