import 'dart:io';

import 'package:contacts/src/models/internet_call.dart';
import 'package:test/test.dart';

void main() {
  group('The transitive and the symmetric property:', () {
    test(
      'The transitive property: if [b] = [a] and [c] = [b], then [c] = [a].',
      () {
        const InternetCall a = InternetCall(
          internetCall: 'internetCall',
          label: 'label',
        );
        const InternetCall b = a;
        const InternetCall c = b;
        expect(c, a);
      },
    );
    test(
      'The symmetric property: if [a] = [b], then [b] = [a].',
      () {
        const InternetCall a = InternetCall(
          internetCall: 'internetCall',
          label: 'label',
        );
        const InternetCall b = InternetCall(
          internetCall: 'internetCall',
          label: 'label',
        );
        expect(a, b);
        expect(b, a);
      },
    );
  });

  group('factory InternetCall.fromJson', () {
    test(
        'If the JSON string is a valid representation of an [InternetCall],'
        ' must construct an [InternetCall] instance.', () async {
      final file = File('test/models/internet_call/internet_call_test.json');
      final json = await file.readAsString();
      expect(
        InternetCall.fromJson(json),
        const InternetCall(
          internetCall: 'internetCall',
          label: 'label',
        ),
        reason: 'The JSON string is a valid representation of an [InternetCall]'
            ' instance.',
      );
    });
    test(
        'If the JSON string is not a valid representation of a [InternetCall],'
        ' this constructor must throw a [FormatException].', () async {
      final file1 =
          File('test/models/internet_call/internet_call_not_valid_1_test.json');
      final json1 = await file1.readAsString();
      expect(
        () => InternetCall.fromJson(json1),
        throwsFormatException,
        reason: 'Required parameter "internetCall" is not present.',
      );
      final file2 =
          File('test/models/internet_call/internet_call_not_valid_2_test.json');
      final json2 = await file2.readAsString();
      expect(
        () => InternetCall.fromJson(json2),
        throwsFormatException,
        reason: 'The JSON file contains only an empty object.',
      );
    });
  });

  group('InternetCall.fromMap', () {
    test(
        'If the map is a valid representation of a [InternetCall] instance,'
        ' this constructor must create that instance.', () {
      final Map<String, dynamic> map = {
        'internetCall': 'internetCall',
        'label': 'label',
      };
      expect(
        InternetCall.fromMap(map),
        const InternetCall(
          internetCall: 'internetCall',
          label: 'label',
        ),
      );
    });
    test(
        'If the map is not a valid representation of a [InternetCall] instance,'
        ' this constructor must throw a [FormatException].', () {
      final Map<String, dynamic> invalidMap = {
        'label': 'label',
      };
      expect(
        () => InternetCall.fromMap(invalidMap),
        throwsFormatException,
        reason: '[invalidMap] does not contain "internetCall" key.',
      );
    });
  });

  group('copyWith', () {
    const InternetCall internetCall = InternetCall(
      internetCall: 'internetCall',
      label: 'label',
    );
    test(
      'This method must copy all parameters and update the ones provided.',
      () {
        expect(
          internetCall.copyWith(),
          internetCall,
          reason: 'Without any parameters passed to [copyWith], it must return'
              ' the original [internetCall].',
        );
        expect(
          internetCall.copyWith(internetCall: 'other'),
          const InternetCall(
            internetCall: 'other',
            label: 'label',
          ),
          reason: 'The only parameter that has to change is "internetCall".',
        );
        expect(
          internetCall.copyWith(label: 'other'),
          const InternetCall(
            internetCall: 'internetCall',
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
        const InternetCall(
          internetCall: 'internetCall',
          label: 'label',
        ).toJson(),
        '{"internetCall":"internetCall","label":"label"}',
        reason: 'No parameter is null.',
      );
      expect(
        const InternetCall(internetCall: 'internetCall').toJson(),
        '{"internetCall":"internetCall","label":null}',
        reason: 'Only "internetCall" parameter is not null.',
      );
    });
  });

  group('toMap', () {
    test('This method must return the corresponding map.', () {
      expect(
        const InternetCall(
          internetCall: 'internetCall',
          label: 'label',
        ).toMap(),
        {
          'internetCall': 'internetCall',
          'label': 'label',
        },
        reason: 'With all the parameters.',
      );
      expect(
        const InternetCall(
          internetCall: 'internetCall',
        ).toMap(),
        {
          'internetCall': 'internetCall',
          'label': null,
        },
        reason: 'Only "internetCall" parameter is not null.',
      );
    });
  });
}
