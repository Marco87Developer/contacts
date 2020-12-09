import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const String _labelKey = 'label';
const String _urlKey = 'url';

/// This class models a reference to a website address.
///
class Website implements Comparable {
  /// A reference to a website address.
  ///
  /// It **requires** these fields: `String` [label] and `String` [url].
  ///
  const Website({
    required this.label,
    required this.url,
  });

  /// Creates a `Website` instance starting from a `Map<String, dynamic> map`.
  ///
  /// This can be useful for retrieving the instance in a database.
  ///
  Website.fromMap(Map<String, dynamic> map)
      : label = map[_labelKey],
        url = map[_urlKey];

  /// The website label. It is useful for distinguishing different websites.
  final String label;

  /// The URL of this website.
  final String url;

  /// Open this website.
  ///
  Future<bool> open({
    bool forceSafariVC = false,
    bool forceWebView = false,
  }) =>
      launch(
        '$uri',
        forceSafariVC: forceSafariVC,
        forceWebView: forceWebView,
      );

  /// Gets the corresponding `Uri` for this website URL.
  ///
  Uri get uri => Uri.parse(Uri.encodeFull(url));

  /// Creates a `Map<String, dynamic> map` representation of this instance.
  ///
  /// This can be useful for saving the instance in a database.
  ///
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
    final int comparison1 = label.compareTo(other.label);
    if (comparison1 != 0) return comparison1;

    // Last comparison
    final int comparison2 = url.compareTo(other.url);
    return comparison2;
  }

  @override
  int get hashCode => hashValues(label, url);

  /// Returns if this instance is less than the [other].
  ///
  bool operator <(covariant Website other) => compareTo(other) < 0;

  /// Return if this instance is less than or equal to the [other].
  ///
  bool operator <=(covariant Website other) => compareTo(other) <= 0;

  @override
  bool operator ==(covariant Website other) => compareTo(other) == 0;

  /// Return if this instance is greater than or equal to the [other].
  ///
  bool operator >=(covariant Website other) => compareTo(other) >= 0;

  /// Return if this instance is greater than the [other].
  ///
  bool operator >(covariant Website other) => compareTo(other) > 0;
}
