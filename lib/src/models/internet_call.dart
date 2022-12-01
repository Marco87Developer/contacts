import 'dart:convert';

import 'package:meta/meta.dart';

const String _internetCallKey = 'internetCall';
const String _labelKey = 'label';

/// A internet call
///
@immutable
class InternetCall {
  /// A internet call
  ///
  const InternetCall({
    required this.internetCall,
    this.label,
  });

  /// Constructs an [InternetCall] instance **from a [json] string**.
  ///
  factory InternetCall.fromJson(final String json) =>
      InternetCall.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs an [InternetCall] instance **from a [map]**.
  ///
  InternetCall.fromMap(final Map<String, dynamic> map)
      : internetCall = '${map[_internetCallKey]}',
        label = map[_labelKey] == null ? null : '${map[_labelKey]}';

  /// The internet call
  final String internetCall;

  /// The label.
  final String? label;

  /// Creates a **copy** of this [InternetCall] instance but with the **given
  /// fields replaced** with the new values.
  ///
  InternetCall copyWith({
    final String? internetCall,
    final String? label,
  }) =>
      InternetCall(
        internetCall: internetCall ?? this.internetCall,
        label: label ?? this.label,
      );

  /// Creates a **JSON string representing** this [InternetCall] instance.
  ///
  /// The resulting JSON string can be parsed back using
  /// [InternetCall.fromJson].
  ///
  String toJson() => jsonEncode(toMap());

  /// Creates a **[Map<String, dynamic>] representing** this [InternetCall]
  /// instance.
  ///
  /// The resulting map can be parsed back using [InternetCall.fromMap].
  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
        _internetCallKey: internetCall,
        _labelKey: label,
      };

  @override
  int get hashCode => Object.hashAll(<Object?>[
        internetCall.hashCode,
        label.hashCode,
      ]);

  @override
  String toString() =>
      'InternetCall(internetCall: $internetCall, label: $label)';

  @override
  bool operator ==(covariant final InternetCall other) {
    if (identical(this, other)) return true;

    return other.internetCall == internetCall && other.label == label;
  }
}
