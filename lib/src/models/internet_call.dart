import 'package:flutter/material.dart';

const String _internetCallKey = 'internetCall';
const String _labelKey = 'label';

/// This class models a reference to an internet call reference.
///
@immutable
class InternetCall implements Comparable<InternetCall> {
  /// A reference to an internet call reference.
  ///
  /// It **requires** these fields: `String` [internetCall] and
  /// `String` [label].
  ///
  const InternetCall({
    required this.internetCall,
    required this.label,
  });

  /// Creates an `InternetCall` instance starting from a
  /// `Map<String, dynamic> map`.
  ///
  /// This can be useful for retrieving the instance in a database.
  ///
  InternetCall.fromMap(Map<String, dynamic> map)
      : internetCall = '${map[_internetCallKey]}',
        label = '${map[_labelKey]}';

  /// The reference name for this Internet call.
  final String internetCall;

  /// The label of this Internet call. It is useful for distinguishing different
  /// Internet calls.
  final String label;

  /// Creates a `Map<String, dynamic> map` representation of this instance.
  ///
  /// This can be useful for saving the instance in a database.
  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
        _internetCallKey: internetCall,
        _labelKey: label,
      };

  /// The order of the comparisons is:
  ///
  /// 1. [label]
  /// 2. [internetCall]
  ///
  @override
  int compareTo(covariant InternetCall other) {
    // 1º comparison
    final int comparison1 = label.compareTo(other.label);
    if (comparison1 != 0) return comparison1;

    // Last comparison
    final int comparison2 = internetCall.compareTo(other.internetCall);
    return comparison2;
  }

  @override
  int get hashCode => hashValues(internetCall, label);

  /// Returns if this instance is less than the [other].
  ///
  bool operator <(covariant InternetCall other) => compareTo(other) < 0;

  /// Return if this instance is less than or equal to the [other].
  ///
  bool operator <=(covariant InternetCall other) => compareTo(other) <= 0;

  @override
  bool operator ==(covariant InternetCall other) => compareTo(other) == 0;

  /// Return if this instance is greater than or equal to the [other].
  ///
  bool operator >=(covariant InternetCall other) => compareTo(other) >= 0;

  /// Return if this instance is greater than the [other].
  ///
  bool operator >(covariant InternetCall other) => compareTo(other) > 0;
}
