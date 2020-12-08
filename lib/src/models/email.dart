import 'package:flutter/material.dart';

const String _addressKey = 'address';
const String _labelKey = 'label';

/// This class models a reference to an email address.
///
class Email implements Comparable {
  /// A reference to an email address.
  ///
  /// It **requires** these fields: `String` [address], `String` [label].
  ///
  const Email({
    required this.address,
    required this.label,
  });

  /// Creates an `Email` instance starting from a `Map<String, dynamic> map`.
  ///
  /// This can be useful for retrieving the instance in a database.
  ///
  Email.fromMap(Map<String, dynamic> map)
      : address = map[_addressKey],
        label = map[_labelKey];

  /// The email address.
  final String address;

  /// The label of this email. It is useful for distinguishing different email
  /// addresses.
  final String label;

  /// Creates a `Map<String, dynamic> map` representation of this instance.
  ///
  /// This can be useful for saving the instance in a database.
  ///
  Map<String, dynamic> toMap() => {
        _addressKey: address,
        _labelKey: label,
      };

  /// The order of the comparisons is:
  ///
  /// 1. [label]
  /// 2. [address]
  ///
  @override
  int compareTo(covariant Email other) {
    // 1º comparison
    final int comparison1 = label.compareTo(other.label);
    if (comparison1 != 0) return comparison1;

    // Last comparison
    final int comparison2 = address.compareTo(other.address);
    return comparison2;
  }

  @override
  int get hashCode => hashValues(address, label);

  /// Returns if this instance is less than the [other].
  ///
  bool operator <(covariant Email other) => compareTo(other) < 0;

  /// Return if this instance is less than or equal to the [other].
  ///
  bool operator <=(covariant Email other) => compareTo(other) <= 0;

  @override
  bool operator ==(covariant Email other) => compareTo(other) == 0;

  /// Return if this instance is greater than or equal to the [other].
  ///
  bool operator >=(covariant Email other) => compareTo(other) >= 0;

  /// Return if this instance is greater than the [other].
  ///
  bool operator >(covariant Email other) => compareTo(other) > 0;
}
