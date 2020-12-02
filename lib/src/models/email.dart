import 'package:flutter/material.dart';

const String _addressKey = 'address';
const String _labelKey = 'label';

/// This class models a reference to an email address.
///
/// It **requires** these fields: `String` [address], `String` [label].
///
class Email implements Comparable {
  const Email({
    required this.address,
    required this.label,
  });

  final String address;
  final String label;

  Email.fromMap(Map<String, dynamic> map)
      : address = map[_addressKey],
        label = map[_labelKey];

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
    int comparison1 = label.compareTo(other.label);
    if (comparison1 != 0) return comparison1;

    // Last comparison
    int comparison2 = address.compareTo(other.address);
    return comparison2;
  }

  @override
  int get hashCode => hashValues(address, label);

  bool operator <(covariant Email other) => compareTo(other) < 0;

  bool operator <=(covariant Email other) => compareTo(other) <= 0;

  bool operator ==(covariant Email other) => compareTo(other) == 0;

  bool operator >=(covariant Email other) => compareTo(other) >= 0;

  bool operator >(covariant Email other) => compareTo(other) > 0;
}
