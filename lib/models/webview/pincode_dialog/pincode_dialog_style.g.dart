// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pincode_dialog_style.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebviewPincodeDialogStyle> _$webviewPincodeDialogStyleSerializer =
    _$WebviewPincodeDialogStyleSerializer();

class _$WebviewPincodeDialogStyleSerializer
    implements StructuredSerializer<WebviewPincodeDialogStyle> {
  @override
  final Iterable<Type> types = const [
    WebviewPincodeDialogStyle,
    _$WebviewPincodeDialogStyle
  ];
  @override
  final String wireName = 'WebviewPincodeDialogStyle';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, WebviewPincodeDialogStyle object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'closeIcon',
      serializers.serialize(object.closeIcon,
          specifiedType: const FullType(WebviewPincodeDialogClose)),
      'errorMsg',
      serializers.serialize(object.errorMsg,
          specifiedType: const FullType(WebviewPincodeDialogErrorMsg)),
      'hintMsg',
      serializers.serialize(object.hintMsg,
          specifiedType: const FullType(WebviewPincodeDialogHint)),
      'inputFields',
      serializers.serialize(object.inputFields,
          specifiedType: const FullType(WebviewPincodeDialogInput)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(WebviewPincodeDialogTitle)),
    ];

    return result;
  }

  @override
  WebviewPincodeDialogStyle deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebviewPincodeDialogStyleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'closeIcon':
          result.closeIcon.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebviewPincodeDialogClose))!
              as WebviewPincodeDialogClose);
          break;
        case 'errorMsg':
          result.errorMsg.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebviewPincodeDialogErrorMsg))!
              as WebviewPincodeDialogErrorMsg);
          break;
        case 'hintMsg':
          result.hintMsg.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebviewPincodeDialogHint))!
              as WebviewPincodeDialogHint);
          break;
        case 'inputFields':
          result.inputFields.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebviewPincodeDialogInput))!
              as WebviewPincodeDialogInput);
          break;
        case 'title':
          result.title.replace(serializers.deserialize(value,
                  specifiedType: const FullType(WebviewPincodeDialogTitle))!
              as WebviewPincodeDialogTitle);
          break;
      }
    }

    return result.build();
  }
}

class _$WebviewPincodeDialogStyle extends WebviewPincodeDialogStyle {
  @override
  final WebviewPincodeDialogClose closeIcon;
  @override
  final WebviewPincodeDialogErrorMsg errorMsg;
  @override
  final WebviewPincodeDialogHint hintMsg;
  @override
  final WebviewPincodeDialogInput inputFields;
  @override
  final WebviewPincodeDialogTitle title;

  factory _$WebviewPincodeDialogStyle(
          [void Function(WebviewPincodeDialogStyleBuilder)? updates]) =>
      (WebviewPincodeDialogStyleBuilder()..update(updates))._build();

  _$WebviewPincodeDialogStyle._(
      {required this.closeIcon,
      required this.errorMsg,
      required this.hintMsg,
      required this.inputFields,
      required this.title})
      : super._();
  @override
  WebviewPincodeDialogStyle rebuild(
          void Function(WebviewPincodeDialogStyleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewPincodeDialogStyleBuilder toBuilder() =>
      WebviewPincodeDialogStyleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewPincodeDialogStyle &&
        closeIcon == other.closeIcon &&
        errorMsg == other.errorMsg &&
        hintMsg == other.hintMsg &&
        inputFields == other.inputFields &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, closeIcon.hashCode);
    _$hash = $jc(_$hash, errorMsg.hashCode);
    _$hash = $jc(_$hash, hintMsg.hashCode);
    _$hash = $jc(_$hash, inputFields.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WebviewPincodeDialogStyle')
          ..add('closeIcon', closeIcon)
          ..add('errorMsg', errorMsg)
          ..add('hintMsg', hintMsg)
          ..add('inputFields', inputFields)
          ..add('title', title))
        .toString();
  }
}

class WebviewPincodeDialogStyleBuilder
    implements
        Builder<WebviewPincodeDialogStyle, WebviewPincodeDialogStyleBuilder> {
  _$WebviewPincodeDialogStyle? _$v;

  WebviewPincodeDialogCloseBuilder? _closeIcon;
  WebviewPincodeDialogCloseBuilder get closeIcon =>
      _$this._closeIcon ??= WebviewPincodeDialogCloseBuilder();
  set closeIcon(WebviewPincodeDialogCloseBuilder? closeIcon) =>
      _$this._closeIcon = closeIcon;

  WebviewPincodeDialogErrorMsgBuilder? _errorMsg;
  WebviewPincodeDialogErrorMsgBuilder get errorMsg =>
      _$this._errorMsg ??= WebviewPincodeDialogErrorMsgBuilder();
  set errorMsg(WebviewPincodeDialogErrorMsgBuilder? errorMsg) =>
      _$this._errorMsg = errorMsg;

  WebviewPincodeDialogHintBuilder? _hintMsg;
  WebviewPincodeDialogHintBuilder get hintMsg =>
      _$this._hintMsg ??= WebviewPincodeDialogHintBuilder();
  set hintMsg(WebviewPincodeDialogHintBuilder? hintMsg) =>
      _$this._hintMsg = hintMsg;

  WebviewPincodeDialogInputBuilder? _inputFields;
  WebviewPincodeDialogInputBuilder get inputFields =>
      _$this._inputFields ??= WebviewPincodeDialogInputBuilder();
  set inputFields(WebviewPincodeDialogInputBuilder? inputFields) =>
      _$this._inputFields = inputFields;

  WebviewPincodeDialogTitleBuilder? _title;
  WebviewPincodeDialogTitleBuilder get title =>
      _$this._title ??= WebviewPincodeDialogTitleBuilder();
  set title(WebviewPincodeDialogTitleBuilder? title) => _$this._title = title;

  WebviewPincodeDialogStyleBuilder();

  WebviewPincodeDialogStyleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _closeIcon = $v.closeIcon.toBuilder();
      _errorMsg = $v.errorMsg.toBuilder();
      _hintMsg = $v.hintMsg.toBuilder();
      _inputFields = $v.inputFields.toBuilder();
      _title = $v.title.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebviewPincodeDialogStyle other) {
    _$v = other as _$WebviewPincodeDialogStyle;
  }

  @override
  void update(void Function(WebviewPincodeDialogStyleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebviewPincodeDialogStyle build() => _build();

  _$WebviewPincodeDialogStyle _build() {
    _$WebviewPincodeDialogStyle _$result;
    try {
      _$result = _$v ??
          _$WebviewPincodeDialogStyle._(
            closeIcon: closeIcon.build(),
            errorMsg: errorMsg.build(),
            hintMsg: hintMsg.build(),
            inputFields: inputFields.build(),
            title: title.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'closeIcon';
        closeIcon.build();
        _$failedField = 'errorMsg';
        errorMsg.build();
        _$failedField = 'hintMsg';
        hintMsg.build();
        _$failedField = 'inputFields';
        inputFields.build();
        _$failedField = 'title';
        title.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'WebviewPincodeDialogStyle', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
