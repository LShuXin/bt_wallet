// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc_type_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VcType> _$vcTypeSerializer = _$VcTypeSerializer();

class _$VcTypeSerializer implements StructuredSerializer<VcType> {
  @override
  final Iterable<Type> types = const [VcType, _$VcType];
  @override
  final String wireName = 'VcType';

  @override
  Iterable<Object?> serialize(Serializers serializers, VcType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'content',
      serializers.serialize(object.content,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  VcType deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = VcTypeBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'content':
          result.content.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$VcType extends VcType {
  @override
  final String id;
  @override
  final String name;
  @override
  final String url;
  @override
  final BuiltList<String> content;

  factory _$VcType([void Function(VcTypeBuilder)? updates]) =>
      (VcTypeBuilder()..update(updates))._build();

  _$VcType._(
      {required this.id,
      required this.name,
      required this.url,
      required this.content})
      : super._();
  @override
  VcType rebuild(void Function(VcTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VcTypeBuilder toBuilder() => VcTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VcType &&
        id == other.id &&
        name == other.name &&
        url == other.url &&
        content == other.content;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VcType')
          ..add('id', id)
          ..add('name', name)
          ..add('url', url)
          ..add('content', content))
        .toString();
  }
}

class VcTypeBuilder implements Builder<VcType, VcTypeBuilder> {
  _$VcType? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  ListBuilder<String>? _content;
  ListBuilder<String> get content => _$this._content ??= ListBuilder<String>();
  set content(ListBuilder<String>? content) => _$this._content = content;

  VcTypeBuilder();

  VcTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _url = $v.url;
      _content = $v.content.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VcType other) {
    _$v = other as _$VcType;
  }

  @override
  void update(void Function(VcTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VcType build() => _build();

  _$VcType _build() {
    _$VcType _$result;
    try {
      _$result = _$v ??
          _$VcType._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'VcType', 'id'),
            name:
                BuiltValueNullFieldError.checkNotNull(name, r'VcType', 'name'),
            url: BuiltValueNullFieldError.checkNotNull(url, r'VcType', 'url'),
            content: content.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'content';
        content.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'VcType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
