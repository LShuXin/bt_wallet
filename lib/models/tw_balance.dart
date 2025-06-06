import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:decimal/decimal.dart';
import 'package:get/get.dart';
import 'package:optional/optional.dart';
import 'package:bt_wallet_flutter_01/models/amount.dart';
import 'package:bt_wallet_flutter_01/models/serializer.dart';
import 'package:bt_wallet_flutter_01/service/api_provider.dart';

part 'tw_balance.g.dart';

abstract class TwBalance extends Object
    implements Built<TwBalance, TwBalanceBuilder> {
  static Serializer<TwBalance> get serializer => _$twBalanceSerializer;

  @BuiltValueField(wireName: 'balance')
  Amount get amount;

  @memoized
  Decimal get original => amount.original;

  factory TwBalance([void Function(TwBalanceBuilder) updates]) = _$TwBalance;
  TwBalance._();

  factory TwBalance.fromJson(dynamic serialized) {
    return serializers.deserialize(
      serialized,
      specifiedType: const FullType(TwBalance),
    ) as TwBalance;
  }

  static Future<Optional<TwBalance>> fetchBalance(
      {required String address, required bool withLoading}) async {
    return Get.find<ApiProvider>()
        .fetchPointV1(address: address, withLoading: withLoading);
  }

  static TwBalance zero = TwBalance((builder) => builder.amount = Amount.zero);
}
