import 'package:flutter/material.dart';

const String _countryRegionKey = 'countryRegion';
const String _streetKey = 'street';
const String _postalCodeKey = 'postalCode';
const String _cityKey = 'city';
const String _provinceKey = 'province';
const String _postOfficeBoxKey = 'postOfficeBox';
const String _labelKey = 'label';

/// This class models a reference to an address.
///
class Address implements Comparable {
  /// A reference to an address.
  ///
  /// It **requires** these fields: `String` [city], `String` [countryRegion],
  /// `String` [province] and `String` [street].
  ///
  /// Also, it has *optional* fields: `String` [label], `String` [postalCode]
  /// and `String` [postOfficeBox].
  ///
  const Address({
    required this.city,
    required this.countryRegion,
    this.label = '',
    this.postalCode = '',
    this.postOfficeBox = '',
    required this.province,
    required this.street,
  });

  /// Creates an `Address` instance starting from a `Map<String, dynamic> map`.
  ///
  /// This can be useful for retrieving the instance in a database.
  ///
  Address.fromMap(Map<String, dynamic> map)
      : city = map[_cityKey],
        countryRegion = map[_countryRegionKey],
        label = map[_labelKey],
        postalCode = map[_postalCodeKey],
        postOfficeBox = map[_postOfficeBoxKey],
        province = map[_provinceKey],
        street = map[_streetKey];

  /// The city. In some regions it is given by the municipality.
  final String city;

  /// The country or region. It can be understood as the nation.
  final String countryRegion;

  /// The address label. It is useful for distinguishing different addresses
  /// that belong to the same person.
  final String label;

  /// The postcode. Useful when you have to send something to the address.
  final String postalCode;

  /// A post office box is a uniquely addressable lockable box located on the
  /// premises of a post office station.
  final String postOfficeBox;

  /// The province is a political region that oversees several municipalities.
  final String province;

  /// The street of the address.
  final String street;

  /// Creates a `Map<String, dynamic> map` representation of this instance.
  ///
  /// This can be useful for saving the instance in a database.
  ///
  Map<String, dynamic> toMap() => {
        _cityKey: city,
        _countryRegionKey: countryRegion,
        _labelKey: label,
        _postalCodeKey: postalCode,
        _postOfficeBoxKey: postOfficeBox,
        _provinceKey: province,
        _streetKey: street,
      };

  /// The order of the comparisons is:
  ///
  /// 1. [countryRegion]
  /// 2. [province]
  /// 3. [city]
  /// 4. [postalCode]
  /// 5. [street]
  /// 6. [postOfficeBox]
  /// 7. [label]
  ///
  @override
  int compareTo(covariant Address other) {
    // 1º comparison
    final int comparison1 = countryRegion.compareTo(other.countryRegion);
    if (comparison1 != 0) return comparison1;

    // 2º comparison
    final int comparison2 = province.compareTo(other.province);
    if (comparison2 != 0) return comparison2;

    // 3º comparison
    final int comparison3 = city.compareTo(other.city);
    if (comparison3 != 0) return comparison3;

    // 4º comparison
    final int comparison4 = postalCode.compareTo(other.postalCode);
    if (comparison4 != 0) return comparison4;

    // 5º comparison
    final int comparison5 = street.compareTo(other.street);
    if (comparison5 != 0) return comparison5;

    // 6º comparison
    final int comparison6 = postOfficeBox.compareTo(other.postOfficeBox);
    if (comparison6 != 0) return comparison6;

    // 7º comparison
    final int comparison7 = label.compareTo(other.label);
    return comparison7;
  }

  @override
  int get hashCode => hashValues(
        city,
        countryRegion,
        label,
        postalCode,
        postOfficeBox,
        province,
        street,
      );

  /// Returns if this instance is less than the [other].
  ///
  bool operator <(covariant Address other) => compareTo(other) < 0;

  /// Return if this instance is less than or equal to the [other].
  ///
  bool operator <=(covariant Address other) => compareTo(other) <= 0;

  @override
  bool operator ==(covariant Address other) => compareTo(other) == 0;

  /// Return if this instance is greater than or equal to the [other].
  ///
  bool operator >=(covariant Address other) => compareTo(other) >= 0;

  /// Return if this instance is greater than the [other].
  ///
  bool operator >(covariant Address other) => compareTo(other) > 0;
}
