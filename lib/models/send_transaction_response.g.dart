// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_transaction_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SendTransactionResponse> _$sendTransactionResponseSerializer =
    _$SendTransactionResponseSerializer();

class _$SendTransactionResponseSerializer
    implements StructuredSerializer<SendTransactionResponse> {
  @override
  final Iterable<Type> types = const [
    SendTransactionResponse,
    _$SendTransactionResponse
  ];
  @override
  final String wireName = 'SendTransactionResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SendTransactionResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'hash',
      serializers.serialize(object.hash, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SendTransactionResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = SendTransactionResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'hash':
          result.hash = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SendTransactionResponse extends SendTransactionResponse {
  @override
  final String hash;

  factory _$SendTransactionResponse(
          [void Function(SendTransactionResponseBuilder)? updates]) =>
      (SendTransactionResponseBuilder()..update(updates))._build();

  _$SendTransactionResponse._({required this.hash}) : super._();
  @override
  SendTransactionResponse rebuild(
          void Function(SendTransactionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendTransactionResponseBuilder toBuilder() =>
      SendTransactionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendTransactionResponse && hash == other.hash;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, hash.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SendTransactionResponse')
          ..add('hash', hash))
        .toString();
  }
}

class SendTransactionResponseBuilder
    implements
        Builder<SendTransactionResponse, SendTransactionResponseBuilder> {
  _$SendTransactionResponse? _$v;

  String? _hash;
  String? get hash => _$this._hash;
  set hash(String? hash) => _$this._hash = hash;

  SendTransactionResponseBuilder();

  SendTransactionResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hash = $v.hash;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SendTransactionResponse other) {
    _$v = other as _$SendTransactionResponse;
  }

  @override
  void update(void Function(SendTransactionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SendTransactionResponse build() => _build();

  _$SendTransactionResponse _build() {
    final _$result = _$v ??
        _$SendTransactionResponse._(
          hash: BuiltValueNullFieldError.checkNotNull(
              hash, r'SendTransactionResponse', 'hash'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
