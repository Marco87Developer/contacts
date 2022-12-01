import 'dart:convert';

import 'package:meta/meta.dart';

const String _labelKey = 'label';
const String _websiteKey = 'website';

/// A website.
///
/// {@template contacts.website.oncecreatednopropertiesmaybechanged}
/// Once created, no properties of an [Website] object may be changed.
/// {@endtemplate}
///
@immutable
class Website {
  /// Constructs a [Website] instance.
  ///
  /// {@macro contacts.website.oncecreatednopropertiesmaybechanged}
  ///
  const Website({
    this.label,
    required this.website,
  });

  /// Constructs a [Website] instance **from a [json] string**.
  ///
  /// {@macro contacts.website.oncecreatednopropertiesmaybechanged}
  ///
  factory Website.fromJson(final String json) =>
      Website.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs a [Website] instance **from a [map]**.
  ///
  /// {@macro contacts.website.oncecreatednopropertiesmaybechanged}
  ///
  Website.fromMap(final Map<String, dynamic> map)
      : label = map[_labelKey] == null ? null : '${map[_labelKey]}',
        website = '${map[_websiteKey]}';

  /// The label.
  final String? label;

  /// The URL of the website.
  final String website;

  /// Creates a **copy** of this [Website] instance but with the **given fields
  /// replaced** with the new values.
  ///
  Website copyWith({
    final String? label,
    final String? website,
  }) =>
      Website(
        label: label ?? this.label,
        website: website ?? this.website,
      );

  /// Creates a **JSON string representing** this [Website] instance.
  ///
  /// The resulting JSON string can be parsed back using [Website.fromJson].
  ///
  String toJson() => jsonEncode(toMap());

  /// Creates a **[Map<String, dynamic>] representing** this [Website] instance.
  ///
  /// The resulting map can be parsed back using [Website.fromMap].
  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
        _labelKey: label,
        _websiteKey: website,
      };

  @override
  int get hashCode => Object.hashAll([
        label,
        website,
      ]);

  @override
  String toString() => 'Website(label: $label, website: $website)';

  @override
  bool operator ==(covariant final Website other) {
    if (identical(this, other)) return true;

    return other.label == label && other.website == website;
  }
}
