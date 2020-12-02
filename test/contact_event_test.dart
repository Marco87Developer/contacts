import 'package:contacts/src/models/contact_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ContactEvent.fromMap()', () {
    Map<String, dynamic> map = {
      'date': '2020-02-27T13:27:00.000',
      'title': 'eventTitle',
    };

    expect(
      ContactEvent.fromMap(map),
      ContactEvent(date: DateTime(2020, 2, 27, 13, 27, 0), title: 'eventTitle'),
    );
  });

  test('toMap()', () {
    ContactEvent event = ContactEvent(
        date: DateTime(2020, 2, 27, 13, 27, 0), title: 'eventTitle');

    print(event.date.toIso8601String());

    expect(
      event.toMap(),
      {'date': '2020-02-27T13:27:00.000', 'title': 'eventTitle'},
    );
  });

  test('compareTo()', () {
    ContactEvent event1 = ContactEvent(
      date: DateTime(2020, 12, 2, 17, 7, 37),
      title: 'First event',
    );
    ContactEvent event2 = ContactEvent(
      date: DateTime(2020, 12, 10, 0, 0, 25),
      title: 'Second event',
    );

    expect(event1.compareTo(event2), -1);
    expect(event2.compareTo(event1), 1);
    expect(event1 < event2, true);
    expect(event1 <= event2, true);
    expect(event1 == event2, false);
    expect(event1 >= event2, false);
    expect(event1 > event2, false);
  });
}
