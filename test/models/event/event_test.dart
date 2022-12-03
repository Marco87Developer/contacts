import 'dart:io';

import 'package:contacts/src/models/event.dart';
import 'package:test/test.dart';

void main() {
  group('The transitive and the symmetric property:', () {
    test(
      'The transitive property: if [b] = [a] and [c] = [b], then [c] = [a].',
      () {
        final Event a = Event(
          event: DateTime(2022),
          label: 'label',
        );
        final Event b = a;
        final Event c = b;
        expect(c, a);
      },
    );
    test(
      'The symmetric property: if [a] = [b], then [b] = [a].',
      () {
        final Event a = Event(
          event: DateTime(2022),
          label: 'label',
        );
        final Event b = Event(
          event: DateTime(2022),
          label: 'label',
        );
        expect(a, b);
        expect(b, a);
      },
    );
  });

  group('factory Event.fromJson', () {
    test(
        'If the JSON string is a valid representation of an [Event], must'
        ' construct an [Event] instance.', () async {
      final file = File('test/models/event/event_test.json');
      final json = await file.readAsString();
      expect(
        Event.fromJson(json),
        Event(
          event: DateTime(2022),
          label: 'label',
        ),
        reason: 'The JSON string is a valid representation of an [Event]'
            ' instance.',
      );
    });
    test(
        'If the JSON string is not a valid representation of a [Event], this'
        ' constructor must throw a [FormatException].', () async {
      final file1 = File('test/models/event/event_not_valid_1_test.json');
      final json1 = await file1.readAsString();
      expect(
        () => Event.fromJson(json1),
        throwsFormatException,
        reason: 'Required parameter "event" is not present.',
      );
      final file2 = File('test/models/event/event_not_valid_2_test.json');
      final json2 = await file2.readAsString();
      expect(
        () => Event.fromJson(json2),
        throwsFormatException,
        reason: 'The JSON file contains only an empty object.',
      );
    });
  });

  group('Event.fromMap', () {
    test(
        'If the map is a valid representation of a [Event] instance, this'
        ' constructor must create that instance.', () {
      final Map<String, dynamic> map = {
        'event': '2022-01-01T00:00:00.000',
        'label': 'label',
      };
      expect(
        Event.fromMap(map),
        Event(
          event: DateTime(2022),
          label: 'label',
        ),
      );
    });
    test(
        'If the map is not a valid representation of a [Event] instance, this'
        ' constructor must throw a [FormatException].', () {
      final Map<String, dynamic> invalidMap = {
        'label': 'label',
      };
      expect(
        () => Event.fromMap(invalidMap),
        throwsFormatException,
        reason: '[invalidMap] does not contain "event" key.',
      );
    });
  });

  group('copyWith', () {
    final Event event = Event(
      event: DateTime(2022),
      label: 'label',
    );
    test(
      'This method must copy all parameters and update the ones provided.',
      () {
        expect(
          event.copyWith(),
          event,
          reason: 'Without any parameters passed to [copyWith], it must return'
              ' the original [event].',
        );
        expect(
          event.copyWith(event: DateTime(2023)),
          Event(
            event: DateTime(2023),
            label: 'label',
          ),
          reason: 'The only parameter that has to change is "event".',
        );
        expect(
          event.copyWith(label: 'other'),
          Event(
            event: DateTime(2022),
            label: 'other',
          ),
          reason: 'The only parameter that has to change is "label".',
        );
      },
    );
  });

  group('toJson', () {
    test('This method must return the corresponding JSON string.', () {
      expect(
        Event(
          event: DateTime(2022),
          label: 'label',
        ).toJson(),
        '{"event":"2022-01-01T00:00:00.000","label":"label"}',
        reason: 'No parameter is null.',
      );
      expect(
        Event(event: DateTime(2022)).toJson(),
        '{"event":"2022-01-01T00:00:00.000","label":null}',
        reason: 'Only "event" parameter is not null.',
      );
    });
  });

  group('toMap', () {
    test('This method must return the corresponding map.', () {
      expect(
        Event(
          event: DateTime(2022),
          label: 'label',
        ).toMap(),
        {
          'event': '2022-01-01T00:00:00.000',
          'label': 'label',
        },
        reason: 'With all the parameters.',
      );
      expect(
        Event(
          event: DateTime(2022),
        ).toMap(),
        {
          'event': '2022-01-01T00:00:00.000',
          'label': null,
        },
        reason: 'Only "event" parameter is not null.',
      );
    });
  });
}
