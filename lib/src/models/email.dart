import 'dart:convert';

import 'package:meta/meta.dart';

const String _emailKey = 'email';
const String _labelKey = 'label';

/// An email address.
///
@immutable
class Email {
  /// An email address.
  ///
  const Email({
    required this.email,
    this.label,
  });

  /// Constructs an [Email] instance **from a [json] string**.
  ///
  factory Email.fromJson(final String json) =>
      Email.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs an [Email] instance **from a [map]**.
  ///
  Email.fromMap(final Map<String, dynamic> map)
      : email = '${map[_emailKey]}',
        label = map[_labelKey] == null ? null : '${map[_labelKey]}';

  /// The email.
  final String email;

  /// The label.
  final String? label;

  /// Creates a **copy** of this [Email] instance but with the **given fields
  /// replaced** with the new values.
  ///
  Email copyWith({
    final String? email,
    final String? label,
  }) =>
      Email(
        email: email ?? this.email,
        label: label ?? this.label,
      );

  /// Creates a **JSON string representing** this [Email] instance.
  ///
  /// The resulting JSON string can be parsed back using [Email.fromJson].
  ///
  String toJson() => jsonEncode(toMap());

  /// Creates a **[Map<String, dynamic>] representing** this [Email]
  /// instance.
  ///
  /// The resulting map can be parsed back using [Email.fromMap].
  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
        _emailKey: email,
        _labelKey: label,
      };

  @override
  int get hashCode => Object.hashAll(<Object?>[
        email,
        label,
      ]);

  @override
  String toString() => 'Email(email: $email, label: $label)';

  @override
  bool operator ==(covariant final Email other) {
    if (identical(this, other)) return true;

    return other.email == email && other.label == label;
  }
}
