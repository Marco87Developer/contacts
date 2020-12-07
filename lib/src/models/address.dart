import 'package:flutter/material.dart';

const String _countryRegionKey = 'countryRegion';
const String _descriptionKey = 'description';
const String _streetKey = 'street';
const String _postalCodeKey = 'postalCode';
const String _cityKey = 'city';
const String _provinceKey = 'province';
const String _postOfficeBoxKey = 'postOfficeBox';
const String _labelKey = 'label';

/// This class models a reference to an address.
///
/// It **requires** these fields: `String` [city], `String` [countryRegion],
/// `String` [province] and `String` [street].
///
/// Also, it has *optional* fields: `String` [description], `String` [label],
/// `String` [postalOffice] and `String` [postOfficeBox].
///
class Address implements Comparable {
  const Address({
    required this.city,
    required this.countryRegion,
    this.description = '',
    this.label = '',
    this.postalCode = '',
    this.postOfficeBox = '',
    required this.province,
    required this.street,
  });

  final String city;
  final String countryRegion;
  final String description;
  final String label;
  final String postalCode;
  final String postOfficeBox;
  final String province;
  final String street;

  /// Creates an `Address` instance starting from a `Map<String, dynamic> map`.
  ///
  /// This can be useful for retrieving the instance in a database.
  ///
  Address.fromMap(Map<String, dynamic> map)
      : city = map[_cityKey],
        countryRegion = map[_countryRegionKey],
        description = map[_descriptionKey],
        label = map[_labelKey],
        postalCode = map[_postalCodeKey],
        postOfficeBox = map[_postOfficeBoxKey],
        province = map[_provinceKey],
        street = map[_streetKey];

  /// Creates a `Map<String, dynamic> map` representation of this instance.
  ///
  /// This can be useful for saving the instance in a database.
  ///
  Map<String, dynamic> toMap() => {
        _cityKey: city,
        _countryRegionKey: countryRegion,
        _descriptionKey: description,
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
  /// 8. [description]
  ///
  @override
  int compareTo(covariant Address other) {
    // 1º comparison
    int comparison1 = countryRegion.compareTo(other.countryRegion);
    if (comparison1 != 0) return comparison1;

    // 2º comparison
    int comparison2 = province.compareTo(other.province);
    if (comparison2 != 0) return comparison2;

    // 3º comparison
    int comparison3 = city.compareTo(other.city);
    if (comparison3 != 0) return comparison3;

    // 4º comparison
    int comparison4 = postalCode.compareTo(other.postalCode);
    if (comparison4 != 0) return comparison4;

    // 5º comparison
    int comparison5 = street.compareTo(other.street);
    if (comparison5 != 0) return comparison5;

    // 6º comparison
    int comparison6 = postOfficeBox.compareTo(other.postOfficeBox);
    if (comparison6 != 0) return comparison6;

    // 7º comparison
    int comparison7 = label.compareTo(other.label);
    if (comparison7 != 0) return comparison7;

    // Last comparison
    int comparison8 = description.compareTo(other.description);
    return comparison8;
  }

  @override
  int get hashCode => hashValues(
        city,
        countryRegion,
        description,
        label,
        postalCode,
        postOfficeBox,
        province,
        street,
      );

  bool operator <(covariant Address other) => compareTo(other) < 0;

  bool operator <=(covariant Address other) => compareTo(other) <= 0;

  bool operator ==(covariant Address other) => compareTo(other) == 0;

  bool operator >=(covariant Address other) => compareTo(other) >= 0;

  bool operator >(covariant Address other) => compareTo(other) > 0;
}
