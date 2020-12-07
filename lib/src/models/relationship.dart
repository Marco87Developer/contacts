import 'package:flutter/material.dart';

const String _labelKey = 'label';
const String _nameKey = 'name';

/// This class models a reference to a personal relationship.
///
/// It **requires** these fields: `String` [label] and `String` [name].
///
class Relationship implements Comparable {
  const Relationship({
    required this.label,
    required this.name,
  });

  final String label;
  final String name;

  /// Creates a `Relationship` instance starting from a `Map<String, dynamic>
  /// map`.
  ///
  /// This can be useful for retrieving the instance in a database.
  ///
  Relationship.fromMap(Map<String, dynamic> map)
      : label = map[_labelKey],
        name = map[_nameKey];

  /// Creates a `Map<String, dynamic> map` representation of this instance.
  ///
  /// This can be useful for saving the instance in a database.
  ///
  Map<String, dynamic> toMap() => {
        _labelKey: label,
        _nameKey: name,
      };

  /// The order of the comparisons is:
  ///
  /// 1. [name]
  /// 2. [label]
  ///
  @override
  int compareTo(covariant Relationship other) {
    // 1º comparison
    int comparison1 = name.compareTo(other.name);
    if (comparison1 != 0) return comparison1;

    // Last comparison
    int comparison2 = label.compareTo(other.label);
    return comparison2;
  }

  @override
  int get hashCode => hashValues(label, name);

  bool operator <(covariant Relationship other) => compareTo(other) < 0;

  bool operator <=(covariant Relationship other) => compareTo(other) <= 0;

  bool operator ==(covariant Relationship other) => compareTo(other) == 0;

  bool operator >=(covariant Relationship other) => compareTo(other) >= 0;

  bool operator >(covariant Relationship other) => compareTo(other) > 0;
}
