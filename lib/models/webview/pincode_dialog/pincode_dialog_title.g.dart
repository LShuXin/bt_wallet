// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pincode_dialog_title.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebviewPincodeDialogTitle> _$webviewPincodeDialogTitleSerializer =
    _$WebviewPincodeDialogTitleSerializer();

class _$WebviewPincodeDialogTitleSerializer
    implements StructuredSerializer<WebviewPincodeDialogTitle> {
  @override
  final Iterable<Type> types = const [
    WebviewPincodeDialogTitle,
    _$WebviewPincodeDialogTitle
  ];
  @override
  final String wireName = 'WebviewPincodeDialogTitle';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, WebviewPincodeDialogTitle object,
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
  WebviewPincodeDialogTitle deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebviewPincodeDialogTitleBuilder();

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

class _$WebviewPincodeDialogTitle extends WebviewPincodeDialogTitle {
  @override
  final String text;
  @override
  final String color;
  @override
  final double fontSize;

  factory _$WebviewPincodeDialogTitle(
          [void Function(WebviewPincodeDialogTitleBuilder)? updates]) =>
      (WebviewPincodeDialogTitleBuilder()..update(updates))._build();

  _$WebviewPincodeDialogTitle._(
      {required this.text, required this.color, required this.fontSize})
      : super._();
  @override
  WebviewPincodeDialogTitle rebuild(
          void Function(WebviewPincodeDialogTitleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewPincodeDialogTitleBuilder toBuilder() =>
      WebviewPincodeDialogTitleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewPincodeDialogTitle &&
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
    return (newBuiltValueToStringHelper(r'WebviewPincodeDialogTitle')
          ..add('text', text)
          ..add('color', color)
          ..add('fontSize', fontSize))
        .toString();
  }
}

class WebviewPincodeDialogTitleBuilder
    implements
        Builder<WebviewPincodeDialogTitle, WebviewPincodeDialogTitleBuilder> {
  _$WebviewPincodeDialogTitle? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  double? _fontSize;
  double? get fontSize => _$this._fontSize;
  set fontSize(double? fontSize) => _$this._fontSize = fontSize;

  WebviewPincodeDialogTitleBuilder() {
    WebviewPincodeDialogTitle._initializeBuilder(this);
  }

  WebviewPincodeDialogTitleBuilder get _$this {
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
  void replace(WebviewPincodeDialogTitle other) {
    _$v = other as _$WebviewPincodeDialogTitle;
  }

  @override
  void update(void Function(WebviewPincodeDialogTitleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebviewPincodeDialogTitle build() => _build();

  _$WebviewPincodeDialogTitle _build() {
    final _$result = _$v ??
        _$WebviewPincodeDialogTitle._(
          text: BuiltValueNullFieldError.checkNotNull(
              text, r'WebviewPincodeDialogTitle', 'text'),
          color: BuiltValueNullFieldError.checkNotNull(
              color, r'WebviewPincodeDialogTitle', 'color'),
          fontSize: BuiltValueNullFieldError.checkNotNull(
              fontSize, r'WebviewPincodeDialogTitle', 'fontSize'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
