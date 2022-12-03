import 'dart:convert';

import 'package:meta/meta.dart';

const String _labelKey = 'label';
const String _relatedPersonKey = 'relatedPerson';

/// A related person.
///
/// {@template contacts.relatedperson.oncecreatednopropertiesmaybechanged}
/// Once created, no properties of an [RelatedPerson] object may be changed.
/// {@endtemplate}
///
@immutable
class RelatedPerson {
  /// Constructs a [RelatedPerson] instance.
  ///
  /// {@macro contacts.relatedperson.oncecreatednopropertiesmaybechanged}
  ///
  const RelatedPerson({
    this.label,
    required this.relatedPerson,
  });

  /// Constructs a [RelatedPerson] instance **from a [json] string**.
  ///
  /// {@macro contacts.relatedperson.oncecreatednopropertiesmaybechanged}
  ///
  factory RelatedPerson.fromJson(final String json) =>
      RelatedPerson.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs a [RelatedPerson] instance **from a [map]**.
  ///
  /// {@macro contacts.relatedperson.oncecreatednopropertiesmaybechanged}
  ///
  RelatedPerson.fromMap(final Map<String, dynamic> map)
      : label = map[_labelKey] == null ? null : '${map[_labelKey]}',
        relatedPerson = map[_relatedPersonKey] == null
            ? throw const FormatException(
                'The [relatedPerson] parameter cannot be null.',
              )
            : '${map[_relatedPersonKey]}';

  /// The label.
  final String? label;

  /// The related person.
  final String relatedPerson;

  /// Creates a **copy** of this [RelatedPerson] instance but with the **given
  /// fields replaced** with the new values.
  ///
  RelatedPerson copyWith({
    final String? label,
    final String? relatedPerson,
  }) =>
      RelatedPerson(
        label: label ?? this.label,
        relatedPerson: relatedPerson ?? this.relatedPerson,
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
        _labelKey: label,
        _relatedPersonKey: relatedPerson,
      };

  @override
  int get hashCode => Object.hashAll([
        label,
        relatedPerson,
      ]);

  @override
  String toString() =>
      'RelatedPerson(label: $label, relatedPerson: $relatedPerson)';

  @override
  bool operator ==(covariant final RelatedPerson other) {
    if (identical(this, other)) return true;

    return other.label == label && other.relatedPerson == relatedPerson;
  }
}
