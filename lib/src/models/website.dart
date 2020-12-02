import 'package:flutter/material.dart';

const String _labelKey = 'label';
const String _urlKey = 'url';

/// This class models a reference to a website address.
///
/// It **requires** these fields: `String` [label] and `String` [url].
///
class Website implements Comparable {
  const Website({
    required this.label,
    required this.url,
  });

  final String label;
  final String url;

  Website.fromMap(Map<String, dynamic> map)
      : label = map[_labelKey],
        url = map[_urlKey];

  /// Gets the corresponding `Uri` for this website URL.
  ///
  Uri get uri => Uri.parse(Uri.encodeFull(url));

  Map<String, dynamic> toMap() => {
        _labelKey: label,
        _urlKey: url,
      };

  /// The order of the comparisons is:
  ///
  /// 1. [label]
  /// 2. [url]
  ///
  @override
  int compareTo(covariant Website other) {
    // 1º comparison
    int comparison1 = label.compareTo(other.label);
    if (comparison1 != 0) return comparison1;

    // Last comparison
    int comparison2 = url.compareTo(other.url);
    return comparison2;
  }

  @override
  int get hashCode => hashValues(label, url);

  bool operator <(covariant Website other) => compareTo(other) < 0;

  bool operator <=(covariant Website other) => compareTo(other) <= 0;

  bool operator ==(covariant Website other) => compareTo(other) == 0;

  bool operator >=(covariant Website other) => compareTo(other) >= 0;

  bool operator >(covariant Website other) => compareTo(other) > 0;
}
