import 'dart:convert';

import 'package:meta/meta.dart';

const String _labelKey = 'label';
const String _websiteKey = 'website';

/// A website.
///
@immutable
class Website {
  /// A website.
  ///
  const Website({
    required this.website,
    this.label,
  });

  /// Constructs an [Website] instance **from a [json] string**.
  ///
  factory Website.fromJson(final String json) =>
      Website.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs an [Website] instance **from a [map]**.
  ///
  Website.fromMap(final Map<String, dynamic> map)
      : website = '${map[_websiteKey]}',
        label = map[_labelKey] == null ? null : '${map[_labelKey]}';

  /// The URL of the website.
  final String website;

  /// The label.
  final String? label;

  /// Creates a **copy** of this [Website] instance but with the **given fields
  /// replaced** with the new values.
  ///
  Website copyWith({
    final String? website,
    final String? label,
  }) =>
      Website(
        website: website ?? this.website,
        label: label ?? this.label,
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
        _websiteKey: website,
        _labelKey: label,
      };

  @override
  int get hashCode => Object.hashAll(<Object?>[
        website,
        label,
      ]);

  @override
  String toString() => 'Website(website: $website, label: $label)';

  @override
  bool operator ==(covariant final Website other) {
    if (identical(this, other)) return true;

    return other.website == website && other.label == label;
  }
}
