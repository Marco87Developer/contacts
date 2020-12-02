import 'package:flutter/material.dart';

const String _dateKey = 'date';
const String _titleKey = 'title';

/// This class models a reference to a contact’s event.
///
/// It **requires** these fields: `DateTime` [date] and `String` [title].
///
class ContactEvent implements Comparable {
  const ContactEvent({
    required this.date,
    required this.title,
  });

  final DateTime date;
  final String title;

  /// It parses `DateTime` from a ISO 8601 format `String`.
  ///
  ContactEvent.fromMap(Map<String, dynamic> map)
      : date = DateTime.parse(map[_dateKey]),
        title = map[_titleKey];

  /// It uses ISO 8601 format in order to get the `String` corresponding to
  /// [date].
  ///
  Map<String, dynamic> toMap() => {
        _dateKey: date.toIso8601String(),
        _titleKey: title,
      };

  /// The order of the comparisons is:
  ///
  /// 1. [date]
  /// 2. [title]
  ///
  @override
  int compareTo(covariant ContactEvent other) {
    // 1º comparison
    int comparison1 = date.compareTo(other.date);
    if (comparison1 != 0) return comparison1;

    // Last comparison
    int comparison2 = title.compareTo(other.title);
    return comparison2;
  }

  @override
  int get hashCode => hashValues(date, title);

  bool operator <(covariant ContactEvent other) => compareTo(other) < 0;

  bool operator <=(covariant ContactEvent other) => compareTo(other) <= 0;

  bool operator ==(covariant ContactEvent other) => compareTo(other) == 0;

  bool operator >=(covariant ContactEvent other) => compareTo(other) >= 0;

  bool operator >(covariant ContactEvent other) => compareTo(other) > 0;
}
