import 'dart:convert';

import 'package:geos/geos.dart';
import 'package:meta/meta.dart';

const String _cityKey = 'city';
const String _countryRegionKey = 'countryRegion';
const String _labelKey = 'label';
const String _poBoxKey = 'poBox';
const String _postalCodeKey = 'postalCode';
const String _provinceDepartmentKey = 'provinceDepartment';
const String _streetAddressKey = 'streetAddress';
const String _streetAddressLine2Key = 'streetAddressLine2';

/// An address.
///
@immutable
class Address {
  /// An address.
  ///
  const Address({
    required this.countryRegion,
    this.streetAddress,
    this.streetAddressLine2,
    this.postalCode,
    this.city,
    this.provinceDepartment,
    this.poBox,
    this.label,
  });

  /// Constructs an [Address] instance **from a [json] string**.
  ///
  factory Address.fromJson(final String json) =>
      Address.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs an [Address] instance **from a [map]**.
  ///
  Address.fromMap(final Map<String, dynamic> map)
      : countryRegion = Country.parse('${map[_countryRegionKey]}'),
        streetAddress =
            map[_streetAddressKey] == null ? null : '${map[_streetAddressKey]}',
        streetAddressLine2 = map[_streetAddressLine2Key] == null
            ? null
            : '${map[_streetAddressLine2Key]}',
        postalCode =
            map[_postalCodeKey] == null ? null : '${map[_postalCodeKey]}',
        city = map[_cityKey] == null ? null : '${map[_cityKey]}',
        provinceDepartment = map[_provinceDepartmentKey] == null
            ? null
            : '${map[_provinceDepartmentKey]}',
        poBox = map[_poBoxKey] == null ? null : '${map[_poBoxKey]}',
        label = map[_labelKey] == null ? null : '${map[_labelKey]}';

  /// The country or region.
  final Country countryRegion;

  /// The street address.
  final String? streetAddress;

  /// The street address (line 2).
  final String? streetAddressLine2;

  /// The postal code.
  final String? postalCode;

  /// The city.
  final String? city;

  /// The province or department.
  final String? provinceDepartment;

  /// The post office box.
  final String? poBox;

  /// The label.
  final String? label;

  /// Creates a **copy** of this [Address] instance but with the **given fields
  /// replaced** with the new values.
  ///
  Address copyWith({
    final Country? countryRegion,
    final String? streetAddress,
    final String? streetAddressLine2,
    final String? postalCode,
    final String? city,
    final String? provinceDepartment,
    final String? poBox,
    final String? label,
  }) =>
      Address(
        countryRegion: countryRegion ?? this.countryRegion,
        streetAddress: streetAddress ?? this.streetAddress,
        streetAddressLine2: streetAddressLine2 ?? this.streetAddressLine2,
        postalCode: postalCode ?? this.postalCode,
        city: city ?? this.city,
        provinceDepartment: provinceDepartment ?? this.provinceDepartment,
        poBox: poBox ?? this.poBox,
        label: label ?? this.label,
      );

  /// Creates a **JSON string representing** this [Address] instance.
  ///
  /// The resulting JSON string can be parsed back using [Address.fromJson].
  ///
  String toJson() => jsonEncode(toMap());

  /// Creates a **[Map<String, dynamic>] representing** this [Address] instance.
  ///
  /// The resulting map can be parsed back using [Address.fromMap].
  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
        _countryRegionKey: '$countryRegion',
        _streetAddressKey: streetAddress,
        _streetAddressLine2Key: streetAddressLine2,
        _postalCodeKey: postalCode,
        _cityKey: city,
        _provinceDepartmentKey: provinceDepartment,
        _poBoxKey: poBox,
        _labelKey: label,
      };

  @override
  int get hashCode => Object.hashAll(<Object?>[
        countryRegion,
        streetAddress,
        streetAddressLine2,
        postalCode,
        city,
        provinceDepartment,
        poBox,
        label,
      ]);

  @override
  String toString() => 'Address(countryRegion: $countryRegion, streetAddress:'
      ' $streetAddress, streetAddressLine2: $streetAddressLine2, postalCode:'
      ' $postalCode, city: $city, provinceDepartment: $provinceDepartment,'
      ' poBox: $poBox, label: $label)';

  @override
  bool operator ==(covariant final Address other) {
    if (identical(this, other)) return true;

    return other.countryRegion == countryRegion &&
        other.streetAddress == streetAddress &&
        other.streetAddressLine2 == streetAddressLine2 &&
        other.postalCode == postalCode &&
        other.city == city &&
        other.provinceDepartment == provinceDepartment &&
        other.poBox == poBox &&
        other.label == label;
  }
}
