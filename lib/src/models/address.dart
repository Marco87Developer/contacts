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
/// {@template contacts.address.oncecreatednopropertiesmaybechanged}
/// Once created, no properties of an [Address] object may be changed.
/// {@endtemplate}
///
@immutable
class Address {
  /// Constructs an [Address] instance.
  ///
  /// {@macro contacts.address.oncecreatednopropertiesmaybechanged}
  ///
  const Address({
    this.city,
    required this.countryRegion,
    this.label,
    this.poBox,
    this.postalCode,
    this.provinceDepartment,
    this.streetAddress,
    this.streetAddressLine2,
  });

  /// Constructs an [Address] instance **from a [json] string**.
  ///
  /// {@macro contacts.address.oncecreatednopropertiesmaybechanged}
  ///
  factory Address.fromJson(final String json) =>
      Address.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs an [Address] instance **from a [map]**.
  ///
  /// {@macro contacts.address.oncecreatednopropertiesmaybechanged}
  ///
  Address.fromMap(final Map<String, dynamic> map)
      : city = map[_cityKey] == null ? null : '${map[_cityKey]}',
        countryRegion = Country.parse('${map[_countryRegionKey]}'),
        label = map[_labelKey] == null ? null : '${map[_labelKey]}',
        poBox = map[_poBoxKey] == null ? null : '${map[_poBoxKey]}',
        postalCode =
            map[_postalCodeKey] == null ? null : '${map[_postalCodeKey]}',
        provinceDepartment = map[_provinceDepartmentKey] == null
            ? null
            : '${map[_provinceDepartmentKey]}',
        streetAddress =
            map[_streetAddressKey] == null ? null : '${map[_streetAddressKey]}',
        streetAddressLine2 = map[_streetAddressLine2Key] == null
            ? null
            : '${map[_streetAddressLine2Key]}';

  /// The city.
  final String? city;

  /// The country or region.
  final Country countryRegion;

  /// The label.
  final String? label;

  /// The post office box.
  final String? poBox;

  /// The postal code.
  final String? postalCode;

  /// The province or department.
  final String? provinceDepartment;

  /// The street address.
  final String? streetAddress;

  /// The street address (line 2).
  final String? streetAddressLine2;

  /// Creates a **copy** of this [Address] instance but with the **given fields
  /// replaced** with the new values.
  ///
  Address copyWith({
    final String? city,
    final Country? countryRegion,
    final String? label,
    final String? poBox,
    final String? postalCode,
    final String? provinceDepartment,
    final String? streetAddress,
    final String? streetAddressLine2,
  }) =>
      Address(
        city: city ?? this.city,
        countryRegion: countryRegion ?? this.countryRegion,
        label: label ?? this.label,
        poBox: poBox ?? this.poBox,
        postalCode: postalCode ?? this.postalCode,
        provinceDepartment: provinceDepartment ?? this.provinceDepartment,
        streetAddress: streetAddress ?? this.streetAddress,
        streetAddressLine2: streetAddressLine2 ?? this.streetAddressLine2,
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
        _cityKey: city,
        _countryRegionKey: '$countryRegion',
        _labelKey: label,
        _poBoxKey: poBox,
        _postalCodeKey: postalCode,
        _provinceDepartmentKey: provinceDepartment,
        _streetAddressKey: streetAddress,
        _streetAddressLine2Key: streetAddressLine2,
      };

  @override
  int get hashCode => Object.hashAll([
        city,
        countryRegion,
        label,
        poBox,
        postalCode,
        provinceDepartment,
        streetAddress,
        streetAddressLine2,
      ]);

  @override
  String toString() => 'Address(city: $city, countryRegion: $countryRegion,'
      ' label: $label, poBox: $poBox, postalCode: $postalCode,'
      ' provinceDepartment: $provinceDepartment, streetAddress: $streetAddress,'
      ' streetAddressLine2: $streetAddressLine2)';

  @override
  bool operator ==(covariant final Address other) {
    if (identical(this, other)) return true;

    return other.city == city &&
        other.countryRegion == countryRegion &&
        other.label == label &&
        other.poBox == poBox &&
        other.postalCode == postalCode &&
        other.provinceDepartment == provinceDepartment &&
        other.streetAddress == streetAddress &&
        other.streetAddressLine2 == streetAddressLine2;
  }
}
