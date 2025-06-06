// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pincode_dialog_close.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebviewPincodeDialogClose> _$webviewPincodeDialogCloseSerializer =
    _$WebviewPincodeDialogCloseSerializer();

class _$WebviewPincodeDialogCloseSerializer
    implements StructuredSerializer<WebviewPincodeDialogClose> {
  @override
  final Iterable<Type> types = const [
    WebviewPincodeDialogClose,
    _$WebviewPincodeDialogClose
  ];
  @override
  final String wireName = 'WebviewPincodeDialogClose';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, WebviewPincodeDialogClose object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'color',
      serializers.serialize(object.color,
          specifiedType: const FullType(String)),
      'size',
      serializers.serialize(object.size, specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  WebviewPincodeDialogClose deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebviewPincodeDialogCloseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$WebviewPincodeDialogClose extends WebviewPincodeDialogClose {
  @override
  final String color;
  @override
  final double size;

  factory _$WebviewPincodeDialogClose(
          [void Function(WebviewPincodeDialogCloseBuilder)? updates]) =>
      (WebviewPincodeDialogCloseBuilder()..update(updates))._build();

  _$WebviewPincodeDialogClose._({required this.color, required this.size})
      : super._();
  @override
  WebviewPincodeDialogClose rebuild(
          void Function(WebviewPincodeDialogCloseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewPincodeDialogCloseBuilder toBuilder() =>
      WebviewPincodeDialogCloseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewPincodeDialogClose &&
        color == other.color &&
        size == other.size;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, color.hashCode);
    _$hash = $jc(_$hash, size.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WebviewPincodeDialogClose')
          ..add('color', color)
          ..add('size', size))
        .toString();
  }
}

class WebviewPincodeDialogCloseBuilder
    implements
        Builder<WebviewPincodeDialogClose, WebviewPincodeDialogCloseBuilder> {
  _$WebviewPincodeDialogClose? _$v;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  double? _size;
  double? get size => _$this._size;
  set size(double? size) => _$this._size = size;

  WebviewPincodeDialogCloseBuilder() {
    WebviewPincodeDialogClose._initializeBuilder(this);
  }

  WebviewPincodeDialogCloseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _color = $v.color;
      _size = $v.size;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebviewPincodeDialogClose other) {
    _$v = other as _$WebviewPincodeDialogClose;
  }

  @override
  void update(void Function(WebviewPincodeDialogCloseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebviewPincodeDialogClose build() => _build();

  _$WebviewPincodeDialogClose _build() {
    final _$result = _$v ??
        _$WebviewPincodeDialogClose._(
          color: BuiltValueNullFieldError.checkNotNull(
              color, r'WebviewPincodeDialogClose', 'color'),
          size: BuiltValueNullFieldError.checkNotNull(
              size, r'WebviewPincodeDialogClose', 'size'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
