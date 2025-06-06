// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebviewTransactionInfo> _$webviewTransactionInfoSerializer =
    _$WebviewTransactionInfoSerializer();

class _$WebviewTransactionInfoSerializer
    implements StructuredSerializer<WebviewTransactionInfo> {
  @override
  final Iterable<Type> types = const [
    WebviewTransactionInfo,
    _$WebviewTransactionInfo
  ];
  @override
  final String wireName = 'WebviewTransactionInfo';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, WebviewTransactionInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'accountId',
      serializers.serialize(object.accountId,
          specifiedType: const FullType(String)),
      'rpcUrl',
      serializers.serialize(object.rpcUrl,
          specifiedType: const FullType(String)),
      'contractName',
      serializers.serialize(object.contractName,
          specifiedType: const FullType(String)),
      'contractAddress',
      serializers.serialize(object.contractAddress,
          specifiedType: const FullType(String)),
      'contractAbi',
      serializers.serialize(object.contractAbi,
          specifiedType: const FullType(String)),
      'functionName',
      serializers.serialize(object.functionName,
          specifiedType: const FullType(String)),
      'gasPrice',
      serializers.serialize(object.gasPrice,
          specifiedType: const FullType(BigInt)),
      'maxGas',
      serializers.serialize(object.maxGas, specifiedType: const FullType(int)),
      'parameters',
      serializers.serialize(object.parameters,
          specifiedType: const FullType(
              BuiltList, const [const FullType(WebviewParameter)])),
    ];

    return result;
  }

  @override
  WebviewTransactionInfo deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebviewTransactionInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'accountId':
          result.accountId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'rpcUrl':
          result.rpcUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'contractName':
          result.contractName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'contractAddress':
          result.contractAddress = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'contractAbi':
          result.contractAbi = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'functionName':
          result.functionName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'gasPrice':
          result.gasPrice = serializers.deserialize(value,
              specifiedType: const FullType(BigInt))! as BigInt;
          break;
        case 'maxGas':
          result.maxGas = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'parameters':
          result.parameters.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(WebviewParameter)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$WebviewTransactionInfo extends WebviewTransactionInfo {
  @override
  final String accountId;
  @override
  final String rpcUrl;
  @override
  final String contractName;
  @override
  final String contractAddress;
  @override
  final String contractAbi;
  @override
  final String functionName;
  @override
  final BigInt gasPrice;
  @override
  final int maxGas;
  @override
  final BuiltList<WebviewParameter> parameters;

  factory _$WebviewTransactionInfo(
          [void Function(WebviewTransactionInfoBuilder)? updates]) =>
      (WebviewTransactionInfoBuilder()..update(updates))._build();

  _$WebviewTransactionInfo._(
      {required this.accountId,
      required this.rpcUrl,
      required this.contractName,
      required this.contractAddress,
      required this.contractAbi,
      required this.functionName,
      required this.gasPrice,
      required this.maxGas,
      required this.parameters})
      : super._();
  @override
  WebviewTransactionInfo rebuild(
          void Function(WebviewTransactionInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewTransactionInfoBuilder toBuilder() =>
      WebviewTransactionInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewTransactionInfo &&
        accountId == other.accountId &&
        rpcUrl == other.rpcUrl &&
        contractName == other.contractName &&
        contractAddress == other.contractAddress &&
        contractAbi == other.contractAbi &&
        functionName == other.functionName &&
        gasPrice == other.gasPrice &&
        maxGas == other.maxGas &&
        parameters == other.parameters;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accountId.hashCode);
    _$hash = $jc(_$hash, rpcUrl.hashCode);
    _$hash = $jc(_$hash, contractName.hashCode);
    _$hash = $jc(_$hash, contractAddress.hashCode);
    _$hash = $jc(_$hash, contractAbi.hashCode);
    _$hash = $jc(_$hash, functionName.hashCode);
    _$hash = $jc(_$hash, gasPrice.hashCode);
    _$hash = $jc(_$hash, maxGas.hashCode);
    _$hash = $jc(_$hash, parameters.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WebviewTransactionInfo')
          ..add('accountId', accountId)
          ..add('rpcUrl', rpcUrl)
          ..add('contractName', contractName)
          ..add('contractAddress', contractAddress)
          ..add('contractAbi', contractAbi)
          ..add('functionName', functionName)
          ..add('gasPrice', gasPrice)
          ..add('maxGas', maxGas)
          ..add('parameters', parameters))
        .toString();
  }
}

class WebviewTransactionInfoBuilder
    implements Builder<WebviewTransactionInfo, WebviewTransactionInfoBuilder> {
  _$WebviewTransactionInfo? _$v;

  String? _accountId;
  String? get accountId => _$this._accountId;
  set accountId(String? accountId) => _$this._accountId = accountId;

  String? _rpcUrl;
  String? get rpcUrl => _$this._rpcUrl;
  set rpcUrl(String? rpcUrl) => _$this._rpcUrl = rpcUrl;

  String? _contractName;
  String? get contractName => _$this._contractName;
  set contractName(String? contractName) => _$this._contractName = contractName;

  String? _contractAddress;
  String? get contractAddress => _$this._contractAddress;
  set contractAddress(String? contractAddress) =>
      _$this._contractAddress = contractAddress;

  String? _contractAbi;
  String? get contractAbi => _$this._contractAbi;
  set contractAbi(String? contractAbi) => _$this._contractAbi = contractAbi;

  String? _functionName;
  String? get functionName => _$this._functionName;
  set functionName(String? functionName) => _$this._functionName = functionName;

  BigInt? _gasPrice;
  BigInt? get gasPrice => _$this._gasPrice;
  set gasPrice(BigInt? gasPrice) => _$this._gasPrice = gasPrice;

  int? _maxGas;
  int? get maxGas => _$this._maxGas;
  set maxGas(int? maxGas) => _$this._maxGas = maxGas;

  ListBuilder<WebviewParameter>? _parameters;
  ListBuilder<WebviewParameter> get parameters =>
      _$this._parameters ??= ListBuilder<WebviewParameter>();
  set parameters(ListBuilder<WebviewParameter>? parameters) =>
      _$this._parameters = parameters;

  WebviewTransactionInfoBuilder();

  WebviewTransactionInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accountId = $v.accountId;
      _rpcUrl = $v.rpcUrl;
      _contractName = $v.contractName;
      _contractAddress = $v.contractAddress;
      _contractAbi = $v.contractAbi;
      _functionName = $v.functionName;
      _gasPrice = $v.gasPrice;
      _maxGas = $v.maxGas;
      _parameters = $v.parameters.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebviewTransactionInfo other) {
    _$v = other as _$WebviewTransactionInfo;
  }

  @override
  void update(void Function(WebviewTransactionInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebviewTransactionInfo build() => _build();

  _$WebviewTransactionInfo _build() {
    _$WebviewTransactionInfo _$result;
    try {
      _$result = _$v ??
          _$WebviewTransactionInfo._(
            accountId: BuiltValueNullFieldError.checkNotNull(
                accountId, r'WebviewTransactionInfo', 'accountId'),
            rpcUrl: BuiltValueNullFieldError.checkNotNull(
                rpcUrl, r'WebviewTransactionInfo', 'rpcUrl'),
            contractName: BuiltValueNullFieldError.checkNotNull(
                contractName, r'WebviewTransactionInfo', 'contractName'),
            contractAddress: BuiltValueNullFieldError.checkNotNull(
                contractAddress, r'WebviewTransactionInfo', 'contractAddress'),
            contractAbi: BuiltValueNullFieldError.checkNotNull(
                contractAbi, r'WebviewTransactionInfo', 'contractAbi'),
            functionName: BuiltValueNullFieldError.checkNotNull(
                functionName, r'WebviewTransactionInfo', 'functionName'),
            gasPrice: BuiltValueNullFieldError.checkNotNull(
                gasPrice, r'WebviewTransactionInfo', 'gasPrice'),
            maxGas: BuiltValueNullFieldError.checkNotNull(
                maxGas, r'WebviewTransactionInfo', 'maxGas'),
            parameters: parameters.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'parameters';
        parameters.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WebviewTransactionInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
