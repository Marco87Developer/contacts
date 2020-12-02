import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const String _countryCodeKey = 'countryCode';
const String _labelKey = 'label';
const String _localKey = 'local';

/// This class models a reference to a phone’s number.
///
/// It **requires** these fields: `String` [countryCode], `String` [label] and
/// `String` [local].
///
class Phone implements Comparable {
  const Phone({
    required this.countryCode,
    required this.label,
    required this.local,
  });

  final String countryCode;
  final String label;
  final String local;

  Phone.fromMap(Map<String, dynamic> map)
      : countryCode = map[_countryCodeKey],
        label = map[_labelKey],
        local = map[_localKey];

  /// Gets the number string in the “+[countryCode][local]” format.
  ///
  String get number => '+$countryCode$local'.trim();

  /// Calls to this phone number.
  ///
  Future<bool> call() => launch('tel://$number');

  Map<String, dynamic> toMap() => {
        _countryCodeKey: countryCode,
        _labelKey: label,
        _localKey: local,
      };

  /// The order of the comparisons is:
  ///
  /// 1. [countryCode]
  /// 2. [local]
  /// 3. [label]
  ///
  @override
  int compareTo(covariant Phone other) {
    // 1º comparison
    int comparison1 = countryCode.compareTo(other.countryCode);
    if (comparison1 != 0) return comparison1;

    // 2º comparison
    int comparison2 = local.compareTo(other.local);
    if (comparison2 != 0) return comparison2;

    // Last comparison
    int comparison3 = label.compareTo(other.label);
    return comparison3;
  }

  @override
  int get hashCode => hashValues(countryCode, label, local);

  @override
  String toString() => '($label)$number';

  bool operator <(covariant Phone other) => compareTo(other) < 0;

  bool operator <=(covariant Phone other) => compareTo(other) <= 0;

  bool operator ==(covariant Phone other) => compareTo(other) == 0;

  bool operator >=(covariant Phone other) => compareTo(other) >= 0;

  bool operator >(covariant Phone other) => compareTo(other) > 0;
}
