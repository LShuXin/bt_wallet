// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_transaction_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SendTransactionRequest> _$sendTransactionRequestSerializer =
    _$SendTransactionRequestSerializer();

class _$SendTransactionRequestSerializer
    implements StructuredSerializer<SendTransactionRequest> {
  @override
  final Iterable<Type> types = const [
    SendTransactionRequest,
    _$SendTransactionRequest
  ];
  @override
  final String wireName = 'SendTransactionRequest';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SendTransactionRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'fromAddress',
      serializers.serialize(object.fromAddress,
          specifiedType: const FullType(String)),
      'fromPublicKey',
      serializers.serialize(object.fromPublicKey,
          specifiedType: const FullType(String)),
      'signedTransactionRawData',
      serializers.serialize(object.signedTransactionRawData,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SendTransactionRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SendTransactionRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'fromAddress':
          result.fromAddress = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'fromPublicKey':
          result.fromPublicKey = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'signedTransactionRawData':
          result.signedTransactionRawData = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SendTransactionRequest extends SendTransactionRequest {
  @override
  final String fromAddress;
  @override
  final String fromPublicKey;
  @override
  final String signedTransactionRawData;

  factory _$SendTransactionRequest(
          [void Function(SendTransactionRequestBuilder)? updates]) =>
      (SendTransactionRequestBuilder()..update(updates))._build();

  _$SendTransactionRequest._(
      {required this.fromAddress,
      required this.fromPublicKey,
      required this.signedTransactionRawData})
      : super._();
  @override
  SendTransactionRequest rebuild(
          void Function(SendTransactionRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendTransactionRequestBuilder toBuilder() =>
      SendTransactionRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendTransactionRequest &&
        fromAddress == other.fromAddress &&
        fromPublicKey == other.fromPublicKey &&
        signedTransactionRawData == other.signedTransactionRawData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fromAddress.hashCode);
    _$hash = $jc(_$hash, fromPublicKey.hashCode);
    _$hash = $jc(_$hash, signedTransactionRawData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SendTransactionRequest')
          ..add('fromAddress', fromAddress)
          ..add('fromPublicKey', fromPublicKey)
          ..add('signedTransactionRawData', signedTransactionRawData))
        .toString();
  }
}

class SendTransactionRequestBuilder
    implements Builder<SendTransactionRequest, SendTransactionRequestBuilder> {
  _$SendTransactionRequest? _$v;

  String? _fromAddress;
  String? get fromAddress => _$this._fromAddress;
  set fromAddress(String? fromAddress) => _$this._fromAddress = fromAddress;

  String? _fromPublicKey;
  String? get fromPublicKey => _$this._fromPublicKey;
  set fromPublicKey(String? fromPublicKey) =>
      _$this._fromPublicKey = fromPublicKey;

  String? _signedTransactionRawData;
  String? get signedTransactionRawData => _$this._signedTransactionRawData;
  set signedTransactionRawData(String? signedTransactionRawData) =>
      _$this._signedTransactionRawData = signedTransactionRawData;

  SendTransactionRequestBuilder();

  SendTransactionRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fromAddress = $v.fromAddress;
      _fromPublicKey = $v.fromPublicKey;
      _signedTransactionRawData = $v.signedTransactionRawData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SendTransactionRequest other) {
    _$v = other as _$SendTransactionRequest;
  }

  @override
  void update(void Function(SendTransactionRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SendTransactionRequest build() => _build();

  _$SendTransactionRequest _build() {
    final _$result = _$v ??
        _$SendTransactionRequest._(
          fromAddress: BuiltValueNullFieldError.checkNotNull(
              fromAddress, r'SendTransactionRequest', 'fromAddress'),
          fromPublicKey: BuiltValueNullFieldError.checkNotNull(
              fromPublicKey, r'SendTransactionRequest', 'fromPublicKey'),
          signedTransactionRawData: BuiltValueNullFieldError.checkNotNull(
              signedTransactionRawData,
              r'SendTransactionRequest',
              'signedTransactionRawData'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
