import 'package:flutter/material.dart';

const String _labelKey = 'label';
const String _nameKey = 'name';

/// This class models a reference to a personal relationship.
///
class Relationship implements Comparable {
  /// A reference to a personal relationship.
  ///
  /// It **requires** these fields: `String` [label] and `String` [name].
  ///
  const Relationship({
    required this.label,
    required this.name,
  });

  /// Creates a `Relationship` instance starting from a `Map<String, dynamic>
  /// map`.
  ///
  /// This can be useful for retrieving the instance in a database.
  ///
  Relationship.fromMap(Map<String, dynamic> map)
      : label = map[_labelKey],
        name = map[_nameKey];

  /// The relationship label. It is useful for distinguishing different
  /// relationships that belong to the same person.
  final String label;

  /// The name of the person with whom the relationship is established.
  final String name;

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
    final int comparison1 = name.compareTo(other.name);
    if (comparison1 != 0) return comparison1;

    // Last comparison
    final int comparison2 = label.compareTo(other.label);
    return comparison2;
  }

  @override
  int get hashCode => hashValues(label, name);

  /// Returns if this instance is less than the [other].
  ///
  bool operator <(covariant Relationship other) => compareTo(other) < 0;

  /// Return if this instance is less than or equal to the [other].
  ///
  bool operator <=(covariant Relationship other) => compareTo(other) <= 0;

  @override
  bool operator ==(covariant Relationship other) => compareTo(other) == 0;

  /// Return if this instance is greater than or equal to the [other].
  ///
  bool operator >=(covariant Relationship other) => compareTo(other) >= 0;

  /// Return if this instance is greater than the [other].
  ///
  bool operator >(covariant Relationship other) => compareTo(other) > 0;
}
