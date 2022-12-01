import 'dart:convert';

import 'package:meta/meta.dart';

const String _eventKey = 'event';
const String _labelKey = 'label';

/// An event.
///
@immutable
class Event {
  /// An event.
  ///
  const Event({
    required this.event,
    this.label,
  });

  /// Constructs an [Event] instance **from a [json] string**.
  ///
  factory Event.fromJson(final String json) =>
      Event.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs an [Event] instance **from a [map]**.
  ///
  Event.fromMap(final Map<String, dynamic> map)
      : event = DateTime.parse('${map[_eventKey]}'),
        label = map[_labelKey] == null ? null : '${map[_labelKey]}';

  /// The date of the event.
  final DateTime event;

  /// The label.
  final String? label;

  /// Creates a **copy** of this [Event] instance but with the **given fields
  /// replaced** with the new values.
  ///
  Event copyWith({
    final DateTime? event,
    final String? label,
  }) =>
      Event(
        event: event ?? this.event,
        label: label ?? this.label,
      );

  /// Creates a **JSON string representing** this [Event] instance.
  ///
  /// The resulting JSON string can be parsed back using [Event.fromJson].
  ///
  String toJson() => jsonEncode(toMap());

  /// Creates a **[Map<String, dynamic>] representing** this [Event]
  /// instance.
  ///
  /// The resulting map can be parsed back using [Event.fromMap].
  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
        _eventKey: event,
        _labelKey: label,
      };

  @override
  int get hashCode => Object.hashAll(<Object?>[
        event,
        label,
      ]);

  @override
  String toString() => 'Event(event: $event, label: $label)';

  @override
  bool operator ==(covariant final Event other) {
    if (identical(this, other)) return true;

    return other.event == event && other.label == label;
  }
}
