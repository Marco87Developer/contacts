import 'dart:convert';

import 'package:meta/meta.dart';

const String _customFieldKey = 'customField';
const String _labelKey = 'label';

/// A custom field.
///
/// {@template contacts.customfield.oncecreatednopropertiesmaybechanged}
/// Once created, no properties of a [CustomField] object may be changed.
/// {@endtemplate}
///
@immutable
class CustomField {
  /// Constructs a [CustomField] instance.
  ///
  /// {@macro contacts.customfield.oncecreatednopropertiesmaybechanged}
  ///
  const CustomField({
    required this.customField,
    this.label,
  });

  /// Constructs an [CustomField] instance **from a [json] string**.
  ///
  /// {@macro contacts.customfield.oncecreatednopropertiesmaybechanged}
  ///
  factory CustomField.fromJson(final String json) =>
      CustomField.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs an [CustomField] instance **from a [map]**.
  ///
  /// {@macro contacts.customfield.oncecreatednopropertiesmaybechanged}
  ///
  CustomField.fromMap(final Map<String, dynamic> map)
      : customField = '${map[_customFieldKey]}',
        label = map[_labelKey] == null ? null : '${map[_labelKey]}';

  /// The custom field.
  final String customField;

  /// The label.
  final String? label;

  /// Creates a **copy** of this [CustomField] instance but with the **given
  /// fields replaced** with the new values.
  ///
  CustomField copyWith({
    final String? customField,
    final String? label,
  }) =>
      CustomField(
        customField: customField ?? this.customField,
        label: label ?? this.label,
      );

  /// Creates a **JSON string representing** this [CustomField] instance.
  ///
  /// The resulting JSON string can be parsed back using [CustomField.fromJson].
  ///
  String toJson() => jsonEncode(toMap());

  /// Creates a **[Map<String, dynamic>] representing** this [CustomField]
  /// instance.
  ///
  /// The resulting map can be parsed back using [CustomField.fromMap].
  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
        _customFieldKey: customField,
        _labelKey: label,
      };

  @override
  int get hashCode => Object.hashAll([
        customField,
        label,
      ]);

  @override
  String toString() => 'CustomField(customField: $customField, label: $label)';

  @override
  bool operator ==(covariant final CustomField other) {
    if (identical(this, other)) return true;

    return other.customField == customField && other.label == label;
  }
}
