import 'package:flutter/material.dart';

const String _dateKey = 'date';
const String _titleKey = 'title';

/// This class models a reference to a contact’s event.
///
@immutable
class ContactEvent implements Comparable<ContactEvent> {
  /// A reference to a contact’s event.
  ///
  /// It **requires** these fields: `DateTime` [date] and `String` [title].
  ///
  const ContactEvent({
    required this.date,
    required this.title,
  });

  /// Creates a `ContactEvent` instance starting from a
  /// `Map<String, dynamic> map`, parsing `DateTime` from a ISO 8601 format
  /// string.
  ///
  /// This can be useful for retrieving the instance in a database.
  ///
  ContactEvent.fromMap(Map<String, dynamic> map)
      : date = DateTime.parse('${map[_dateKey]}'),
        title = '${map[_titleKey]}';

  /// The date of this event.
  final DateTime date;

  /// The title of this event.
  final String title;

  /// Creates a `Map<String, dynamic> map` representation of this instance. It
  /// uses ISO 8601 format in order to get the `String` corresponding to [date].
  ///
  /// This can be useful for saving the instance in a database.
  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
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
    final int comparison1 = date.compareTo(other.date);
    if (comparison1 != 0) return comparison1;

    // Last comparison
    final int comparison2 = title.compareTo(other.title);
    return comparison2;
  }

  @override
  int get hashCode => hashValues(date, title);

  /// Returns if this instance is less than the [other].
  ///
  bool operator <(covariant ContactEvent other) => compareTo(other) < 0;

  /// Return if this instance is less than or equal to the [other].
  ///
  bool operator <=(covariant ContactEvent other) => compareTo(other) <= 0;

  @override
  bool operator ==(covariant ContactEvent other) => compareTo(other) == 0;

  /// Return if this instance is greater than or equal to the [other].
  ///
  bool operator >=(covariant ContactEvent other) => compareTo(other) >= 0;

  /// Return if this instance is greater than the [other].
  ///
  bool operator >(covariant ContactEvent other) => compareTo(other) > 0;
}
