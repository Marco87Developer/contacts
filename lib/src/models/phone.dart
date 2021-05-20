import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const String _countryCodeKey = 'countryCode';
const String _labelKey = 'label';
const String _localKey = 'local';

/// This class models a reference to a phone’s number.
///
@immutable
class Phone implements Comparable<Phone> {
  /// A reference to a phone’s number.
  ///
  /// It **requires** these fields: `String` [countryCode], `String` [label] and
  /// `String` [local].
  ///
  const Phone({
    required this.countryCode,
    required this.label,
    required this.local,
  });

  /// Creates a `Phone` instance starting from a `Map<String, dynamic> map`.
  ///
  /// This can be useful for retrieving the instance in a database.
  ///
  Phone.fromMap(Map<String, dynamic> map)
      : countryCode = '${map[_countryCodeKey]}',
        label = '${map[_labelKey]}',
        local = '${map[_localKey]}';

  /// The country code. For example, for USA it will be `'1'` and for Italy it
  /// will be `'39'`.
  final String countryCode;

  /// The label of this phone number. It is useful for distinguishing different
  /// phone numbers.
  final String label;

  /// The local part of this phone number.
  final String local;

  /// Gets the number string in the “+[countryCode] [local]” format.
  ///
  String get number => '+$countryCode $local'.trim();

  /// Calls to this phone number.
  ///
  Future<bool> call() {
    final Uri uri = Uri(
      path: number,
      scheme: 'tel',
    );

    return launch('$uri');
  }

  /// Sends a SMS to this phone number. It requires a [body].
  ///
  Future<bool> sms({
    required String body,
  }) {
    final Uri uri = Uri(
      path: number,
      queryParameters: <String, dynamic>{
        'body': body,
      },
      scheme: 'sms',
    );

    return launch('$uri');
  }

  /// Creates a `Map<String, dynamic> map` representation of this instance.
  ///
  /// This can be useful for saving the instance in a database.
  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
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
    final int comparison1 = countryCode.compareTo(other.countryCode);
    if (comparison1 != 0) return comparison1;

    // 2º comparison
    final int comparison2 = local.compareTo(other.local);
    if (comparison2 != 0) return comparison2;

    // Last comparison
    final int comparison3 = label.compareTo(other.label);
    return comparison3;
  }

  @override
  int get hashCode => hashValues(countryCode, label, local);

  @override
  String toString() => '($label)$number';

  /// Returns if this instance is less than the [other].
  ///
  bool operator <(covariant Phone other) => compareTo(other) < 0;

  /// Return if this instance is less than or equal to the [other].
  ///
  bool operator <=(covariant Phone other) => compareTo(other) <= 0;

  @override
  bool operator ==(covariant Phone other) => compareTo(other) == 0;

  /// Return if this instance is greater than or equal to the [other].
  ///
  bool operator >=(covariant Phone other) => compareTo(other) >= 0;

  /// Return if this instance is greater than the [other].
  ///
  bool operator >(covariant Phone other) => compareTo(other) > 0;
}
