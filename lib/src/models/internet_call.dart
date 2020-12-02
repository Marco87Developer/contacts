import 'package:flutter/material.dart';

const String _internetCallKey = 'internetCall';
const String _labelKey = 'label';

/// This class models a reference to an internet call reference.
///
/// It **requires** these fields: `String` [internetCall] and `String` [label].
///
class InternetCall implements Comparable {
  const InternetCall({
    required this.internetCall,
    required this.label,
  });

  final String internetCall;
  final String label;

  InternetCall.fromMap(Map<String, dynamic> map)
      : internetCall = map[_internetCallKey],
        label = map[_labelKey];

  Map<String, dynamic> toMap() => {
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
    int comparison1 = label.compareTo(other.label);
    if (comparison1 != 0) return comparison1;

    // Last comparison
    int comparison2 = internetCall.compareTo(other.internetCall);
    return comparison2;
  }

  @override
  int get hashCode => hashValues(internetCall, label);

  bool operator <(covariant InternetCall other) => compareTo(other) < 0;

  bool operator <=(covariant InternetCall other) => compareTo(other) <= 0;

  bool operator ==(covariant InternetCall other) => compareTo(other) == 0;

  bool operator >=(covariant InternetCall other) => compareTo(other) >= 0;

  bool operator >(covariant InternetCall other) => compareTo(other) > 0;
}
