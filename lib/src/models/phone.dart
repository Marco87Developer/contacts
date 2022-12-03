import 'dart:convert';

import 'package:meta/meta.dart';

const String _labelKey = 'label';
const String _phoneKey = 'phone';

/// A phone number.
///
/// {@template contacts.phone.oncecreatednopropertiesmaybechanged}
/// Once created, no properties of an [Phone] object may be changed.
/// {@endtemplate}
///
@immutable
class Phone {
  /// Constructs a [Phone] instance.
  ///
  /// {@macro contacts.phone.oncecreatednopropertiesmaybechanged}
  ///
  const Phone({
    this.label,
    required this.phone,
  });

  /// Constructs a [Phone] instance **from a [json] string**.
  ///
  /// {@macro contacts.phone.oncecreatednopropertiesmaybechanged}
  ///
  factory Phone.fromJson(final String json) =>
      Phone.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs a [Phone] instance **from a [map]**.
  ///
  /// {@macro contacts.phone.oncecreatednopropertiesmaybechanged}
  ///
  Phone.fromMap(final Map<String, dynamic> map)
      : label = map[_labelKey] == null ? null : '${map[_labelKey]}',
        phone = map[_phoneKey] == null
            ? throw const FormatException(
                'The [phone] parameter cannot be null.',
              )
            : '${map[_phoneKey]}';

  /// The label.
  final String? label;

  /// The phone number.
  final String phone;

  /// Creates a **copy** of this [Phone] instance but with the **given fields
  /// replaced** with the new values.
  ///
  Phone copyWith({
    final String? label,
    final String? phone,
  }) =>
      Phone(
        label: label ?? this.label,
        phone: phone ?? this.phone,
      );

  /// Creates a **JSON string representing** this [Phone] instance.
  ///
  /// The resulting JSON string can be parsed back using [Phone.fromJson].
  ///
  String toJson() => jsonEncode(toMap());

  /// Creates a **[Map<String, dynamic>] representing** this [Phone] instance.
  ///
  /// The resulting map can be parsed back using [Phone.fromMap].
  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
        _labelKey: label,
        _phoneKey: phone,
      };

  @override
  int get hashCode => Object.hashAll([
        label,
        phone,
      ]);

  @override
  String toString() => 'Phone(label: $label, phone: $phone)';

  @override
  bool operator ==(covariant final Phone other) {
    if (identical(this, other)) return true;

    return other.label == label && other.phone == phone;
  }
}
