// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webview_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebviewRequest> _$webviewRequestSerializer =
    _$WebviewRequestSerializer();

class _$WebviewRequestSerializer
    implements StructuredSerializer<WebviewRequest> {
  @override
  final Iterable<Type> types = const [WebviewRequest, _$WebviewRequest];
  @override
  final String wireName = 'WebviewRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebviewRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'method',
      serializers.serialize(object.method,
          specifiedType: const FullType(WebviewRequestMethod)),
    ];
    Object? value;
    value = object.param;
    if (value != null) {
      result
        ..add('param')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  WebviewRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = WebviewRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'method':
          result.method = serializers.deserialize(value,
                  specifiedType: const FullType(WebviewRequestMethod))!
              as WebviewRequestMethod;
          break;
        case 'param':
          result.param = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$WebviewRequest extends WebviewRequest {
  @override
  final String id;
  @override
  final WebviewRequestMethod method;
  @override
  final String? param;

  factory _$WebviewRequest([void Function(WebviewRequestBuilder)? updates]) =>
      (WebviewRequestBuilder()..update(updates))._build();

  _$WebviewRequest._({required this.id, required this.method, this.param})
      : super._();
  @override
  WebviewRequest rebuild(void Function(WebviewRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewRequestBuilder toBuilder() => WebviewRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewRequest &&
        id == other.id &&
        method == other.method &&
        param == other.param;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, method.hashCode);
    _$hash = $jc(_$hash, param.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WebviewRequest')
          ..add('id', id)
          ..add('method', method)
          ..add('param', param))
        .toString();
  }
}

class WebviewRequestBuilder
    implements Builder<WebviewRequest, WebviewRequestBuilder> {
  _$WebviewRequest? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  WebviewRequestMethod? _method;
  WebviewRequestMethod? get method => _$this._method;
  set method(WebviewRequestMethod? method) => _$this._method = method;

  String? _param;
  String? get param => _$this._param;
  set param(String? param) => _$this._param = param;

  WebviewRequestBuilder();

  WebviewRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _method = $v.method;
      _param = $v.param;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebviewRequest other) {
    _$v = other as _$WebviewRequest;
  }

  @override
  void update(void Function(WebviewRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebviewRequest build() => _build();

  _$WebviewRequest _build() {
    final _$result = _$v ??
        _$WebviewRequest._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'WebviewRequest', 'id'),
          method: BuiltValueNullFieldError.checkNotNull(
              method, r'WebviewRequest', 'method'),
          param: param,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
