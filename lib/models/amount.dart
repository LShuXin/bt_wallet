import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:decimal/decimal.dart';
import 'package:bt_wallet_flutter_01/common/application.dart';
import 'package:bt_wallet_flutter_01/common/util.dart';

class Amount {
  const Amount(this.value);
  final Decimal value;

  Decimal get original =>
      value * Decimal.parse(Decimal.fromInt(10).pow(Application.globalEnv.tokenPrecision).toString());
  String get humanReadable => Util.formatDecimal(
        value,
        Application.globalEnv.tokenHumanReadablePrecision,
      );

  String get humanReadableWithSymbol =>
      '${Application.globalEnv.tokenSymbol}$humanReadable';

  String get humanReadableWithSign {
    if (value < Decimal.zero) {
      return '-${Application.globalEnv.tokenSymbol}${humanReadable.substring(1)}';
    }
    return '+${Application.globalEnv.tokenSymbol}$humanReadable';
  }

  @override
  String toString() {
    return humanReadable;
  }

  factory Amount.parse(dynamic value) {
    return Amount(
     (Decimal.parse(value as String) / Decimal.parse(Decimal.fromInt(10).pow(Application.globalEnv.tokenPrecision).toString())).toDecimal(),
    );
  }

  static Amount zero = Amount(Decimal.zero);
}

class AmountSerializer implements PrimitiveSerializer<Amount> {
  @override
  Amount deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return Amount.parse(serialized);
  }

  @override
  Object serialize(Serializers serializers, Amount amount,
      {FullType specifiedType = FullType.unspecified}) {
    return amount.toString();
  }

  @override
  Iterable<Type> get types => BuiltList<Type>([Amount]);

  @override
  String get wireName => 'Amount';
}
