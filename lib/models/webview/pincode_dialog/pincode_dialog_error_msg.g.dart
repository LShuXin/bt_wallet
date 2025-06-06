// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pincode_dialog_error_msg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebviewPincodeDialogErrorMsg>
    _$webviewPincodeDialogErrorMsgSerializer =
    _$WebviewPincodeDialogErrorMsgSerializer();

class _$WebviewPincodeDialogErrorMsgSerializer
    implements StructuredSerializer<WebviewPincodeDialogErrorMsg> {
  @override
  final Iterable<Type> types = const [
    WebviewPincodeDialogErrorMsg,
    _$WebviewPincodeDialogErrorMsg
  ];
  @override
  final String wireName = 'WebviewPincodeDialogErrorMsg';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, WebviewPincodeDialogErrorMsg object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'color',
      serializers.serialize(object.color,
          specifiedType: const FullType(String)),
      'fontSize',
      serializers.serialize(object.fontSize,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  WebviewPincodeDialogErrorMsg deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebviewPincodeDialogErrorMsgBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'fontSize':
          result.fontSize = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$WebviewPincodeDialogErrorMsg extends WebviewPincodeDialogErrorMsg {
  @override
  final String text;
  @override
  final String color;
  @override
  final double fontSize;

  factory _$WebviewPincodeDialogErrorMsg(
          [void Function(WebviewPincodeDialogErrorMsgBuilder)? updates]) =>
      (WebviewPincodeDialogErrorMsgBuilder()..update(updates))._build();

  _$WebviewPincodeDialogErrorMsg._(
      {required this.text, required this.color, required this.fontSize})
      : super._();
  @override
  WebviewPincodeDialogErrorMsg rebuild(
          void Function(WebviewPincodeDialogErrorMsgBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewPincodeDialogErrorMsgBuilder toBuilder() =>
      WebviewPincodeDialogErrorMsgBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewPincodeDialogErrorMsg &&
        text == other.text &&
        color == other.color &&
        fontSize == other.fontSize;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jc(_$hash, fontSize.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WebviewPincodeDialogErrorMsg')
          ..add('text', text)
          ..add('color', color)
          ..add('fontSize', fontSize))
        .toString();
  }
}

class WebviewPincodeDialogErrorMsgBuilder
    implements
        Builder<WebviewPincodeDialogErrorMsg,
            WebviewPincodeDialogErrorMsgBuilder> {
  _$WebviewPincodeDialogErrorMsg? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  double? _fontSize;
  double? get fontSize => _$this._fontSize;
  set fontSize(double? fontSize) => _$this._fontSize = fontSize;

  WebviewPincodeDialogErrorMsgBuilder() {
    WebviewPincodeDialogErrorMsg._initializeBuilder(this);
  }

  WebviewPincodeDialogErrorMsgBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _color = $v.color;
      _fontSize = $v.fontSize;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebviewPincodeDialogErrorMsg other) {
    _$v = other as _$WebviewPincodeDialogErrorMsg;
  }

  @override
  void update(void Function(WebviewPincodeDialogErrorMsgBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebviewPincodeDialogErrorMsg build() => _build();

  _$WebviewPincodeDialogErrorMsg _build() {
    final _$result = _$v ??
        _$WebviewPincodeDialogErrorMsg._(
          text: BuiltValueNullFieldError.checkNotNull(
              text, r'WebviewPincodeDialogErrorMsg', 'text'),
          color: BuiltValueNullFieldError.checkNotNull(
              color, r'WebviewPincodeDialogErrorMsg', 'color'),
          fontSize: BuiltValueNullFieldError.checkNotNull(
              fontSize, r'WebviewPincodeDialogErrorMsg', 'fontSize'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
