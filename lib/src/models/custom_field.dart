import 'package:flutter/material.dart';

const String _contentKey = 'content';
const String _labelKey = 'label';

/// This class models a reference to a custom field.
///
class CustomField implements Comparable {
  /// A reference to a custom field.
  ///
  /// It **requires** these fields: `String` [content] and `String` [label].
  ///
  const CustomField({
    required this.content,
    required this.label,
  });

  /// Creates a `CustomField` instance starting from a `Map<String, dynamic>
  /// map`.
  ///
  /// This can be useful for retrieving the instance in a database.
  ///
  CustomField.fromMap(Map<String, dynamic> map)
      : content = map[_contentKey],
        label = map[_labelKey];

  /// The content of this field.
  final String content;

  /// The label of this field. It is useful for distinguishing different custom
  /// fields.
  final String label;

  /// Creates a `Map<String, dynamic> map` representation of this instance.
  ///
  /// This can be useful for saving the instance in a database.
  ///
  Map<String, dynamic> toMap() => {
        _contentKey: content,
        _labelKey: label,
      };

  /// The order of the comparisons is:
  ///
  /// 1. [label]
  /// 2. [content]
  ///
  @override
  int compareTo(covariant CustomField other) {
    // 1º comparison
    final int comparison1 = label.compareTo(other.label);
    if (comparison1 != 0) return comparison1;

    // Last comparison
    final int comparison2 = content.compareTo(other.content);
    return comparison2;
  }

  @override
  int get hashCode => hashValues(content, label);

  /// Returns if this instance is less than the [other].
  ///
  bool operator <(covariant CustomField other) => compareTo(other) < 0;

  /// Return if this instance is less than or equal to the [other].
  ///
  bool operator <=(covariant CustomField other) => compareTo(other) <= 0;

  @override
  bool operator ==(covariant CustomField other) => compareTo(other) == 0;

  /// Return if this instance is greater than or equal to the [other].
  ///
  bool operator >=(covariant CustomField other) => compareTo(other) >= 0;

  /// Return if this instance is greater than the [other].
  ///
  bool operator >(covariant CustomField other) => compareTo(other) > 0;
}
