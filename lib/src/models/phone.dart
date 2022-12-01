import 'dart:convert';

import 'package:meta/meta.dart';

const String _labelKey = 'label';
const String _phoneKey = 'phone';

/// A phone number.
///
@immutable
class Phone {
  /// A phone number.
  ///
  const Phone({
    required this.phone,
    this.label,
  });

  /// Constructs an [Phone] instance **from a [json] string**.
  ///
  factory Phone.fromJson(final String json) =>
      Phone.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs an [Phone] instance **from a [map]**.
  ///
  Phone.fromMap(final Map<String, dynamic> map)
      : phone = '${map[_phoneKey]}',
        label = map[_labelKey] == null ? null : '${map[_labelKey]}';

  /// The phone number.
  final String phone;

  /// The label.
  final String? label;

  /// Creates a **copy** of this [Phone] instance but with the **given fields
  /// replaced** with the new values.
  ///
  Phone copyWith({
    final String? phone,
    final String? label,
  }) =>
      Phone(
        phone: phone ?? this.phone,
        label: label ?? this.label,
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
        _phoneKey: phone,
        _labelKey: label,
      };

  @override
  int get hashCode => Object.hashAll(<Object?>[
        phone,
        label,
      ]);

  @override
  String toString() => 'Phone(phone: $phone, label: $label)';

  @override
  bool operator ==(covariant final Phone other) {
    if (identical(this, other)) return true;

    return other.phone == phone && other.label == label;
  }
}
