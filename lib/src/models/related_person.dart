import 'dart:convert';

import 'package:meta/meta.dart';

const String _labelKey = 'label';
const String _relatedPersonKey = 'relatedPerson';

/// A related person.
///
@immutable
class RelatedPerson {
  /// A related person.
  ///
  const RelatedPerson({
    required this.relatedPerson,
    this.label,
  });

  /// Constructs an [RelatedPerson] instance **from a [json] string**.
  ///
  factory RelatedPerson.fromJson(final String json) =>
      RelatedPerson.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs an [RelatedPerson] instance **from a [map]**.
  ///
  RelatedPerson.fromMap(final Map<String, dynamic> map)
      : relatedPerson = '${map[_relatedPersonKey]}',
        label = map[_labelKey] == null ? null : '${map[_labelKey]}';

  /// The related person.
  final String relatedPerson;

  /// The label.
  final String? label;

  /// Creates a **copy** of this [RelatedPerson] instance but with the **given
  /// fields replaced** with the new values.
  ///
  RelatedPerson copyWith({
    final String? relatedPerson,
    final String? label,
  }) =>
      RelatedPerson(
        relatedPerson: relatedPerson ?? this.relatedPerson,
        label: label ?? this.label,
      );

  /// Creates a **JSON string representing** this [RelatedPerson] instance.
  ///
  /// The resulting JSON string can be parsed back using
  /// [RelatedPerson.fromJson].
  ///
  String toJson() => jsonEncode(toMap());

  /// Creates a **[Map<String, dynamic>] representing** this [RelatedPerson]
  /// instance.
  ///
  /// The resulting map can be parsed back using [RelatedPerson.fromMap].
  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
        _relatedPersonKey: relatedPerson,
        _labelKey: label,
      };

  @override
  int get hashCode => Object.hashAll(<Object?>[
        relatedPerson,
        label,
      ]);

  @override
  String toString() =>
      'RelatedPerson(relatedPerson: $relatedPerson, label: $label)';

  @override
  bool operator ==(covariant final RelatedPerson other) {
    if (identical(this, other)) return true;

    return other.relatedPerson == relatedPerson && other.label == label;
  }
}
