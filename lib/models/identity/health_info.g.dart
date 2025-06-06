// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HealthInfo> _$healthInfoSerializer = _$HealthInfoSerializer();

class _$HealthInfoSerializer implements StructuredSerializer<HealthInfo> {
  @override
  final Iterable<Type> types = const [HealthInfo, _$HealthInfo];
  @override
  final String wireName = 'HealthInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, HealthInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.healthCertificateStatus;
    if (value != null) {
      result
        ..add('healthCertificateStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.healthStatus;
    if (value != null) {
      result
        ..add('healthStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  HealthInfo deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = HealthInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'healthCertificateStatus':
          result.healthCertificateStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'healthStatus':
          result.healthStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$HealthInfo extends HealthInfo {
  @override
  final String? healthCertificateStatus;
  @override
  final String? healthStatus;

  factory _$HealthInfo([void Function(HealthInfoBuilder)? updates]) =>
      (HealthInfoBuilder()..update(updates))._build();

  _$HealthInfo._({this.healthCertificateStatus, this.healthStatus}) : super._();
  @override
  HealthInfo rebuild(void Function(HealthInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthInfoBuilder toBuilder() => HealthInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthInfo &&
        healthCertificateStatus == other.healthCertificateStatus &&
        healthStatus == other.healthStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, healthCertificateStatus.hashCode);
    _$hash = $jc(_$hash, healthStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HealthInfo')
          ..add('healthCertificateStatus', healthCertificateStatus)
          ..add('healthStatus', healthStatus))
        .toString();
  }
}

class HealthInfoBuilder implements Builder<HealthInfo, HealthInfoBuilder> {
  _$HealthInfo? _$v;

  String? _healthCertificateStatus;
  String? get healthCertificateStatus => _$this._healthCertificateStatus;
  set healthCertificateStatus(String? healthCertificateStatus) =>
      _$this._healthCertificateStatus = healthCertificateStatus;

  String? _healthStatus;
  String? get healthStatus => _$this._healthStatus;
  set healthStatus(String? healthStatus) => _$this._healthStatus = healthStatus;

  HealthInfoBuilder();

  HealthInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _healthCertificateStatus = $v.healthCertificateStatus;
      _healthStatus = $v.healthStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthInfo other) {
    _$v = other as _$HealthInfo;
  }

  @override
  void update(void Function(HealthInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HealthInfo build() => _build();

  _$HealthInfo _build() {
    final _$result = _$v ??
        _$HealthInfo._(
          healthCertificateStatus: healthCertificateStatus,
          healthStatus: healthStatus,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
