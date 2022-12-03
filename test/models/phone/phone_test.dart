import 'dart:io';

import 'package:contacts/src/models/phone.dart';
import 'package:test/test.dart';

void main() {
  group('The transitive and the symmetric property:', () {
    test(
      'The transitive property: if [b] = [a] and [c] = [b], then [c] = [a].',
      () {
        const Phone a = Phone(
          phone: 'phone',
          label: 'label',
        );
        const Phone b = a;
        const Phone c = b;
        expect(c, a);
      },
    );
    test(
      'The symmetric property: if [a] = [b], then [b] = [a].',
      () {
        const Phone a = Phone(
          phone: 'phone',
          label: 'label',
        );
        const Phone b = Phone(
          phone: 'phone',
          label: 'label',
        );
        expect(a, b);
        expect(b, a);
      },
    );
  });

  group('factory Phone.fromJson', () {
    test(
        'If the JSON string is a valid representation of an [Phone], must'
        ' construct an [Phone] instance.', () async {
      final file = File('test/models/phone/phone_test.json');
      final json = await file.readAsString();
      expect(
        Phone.fromJson(json),
        const Phone(
          phone: 'phone',
          label: 'label',
        ),
        reason: 'The JSON string is a valid representation of an [Phone]'
            ' instance.',
      );
    });
    test(
        'If the JSON string is not a valid representation of a [Phone], this'
        ' constructor must throw a [FormatException].', () async {
      final file1 = File('test/models/phone/phone_not_valid_1_test.json');
      final json1 = await file1.readAsString();
      expect(
        () => Phone.fromJson(json1),
        throwsFormatException,
        reason: 'Required parameter "phone" is not present.',
      );
      final file2 = File('test/models/phone/phone_not_valid_2_test.json');
      final json2 = await file2.readAsString();
      expect(
        () => Phone.fromJson(json2),
        throwsFormatException,
        reason: 'The JSON file contains only an empty object.',
      );
    });
  });

  group('Phone.fromMap', () {
    test(
        'If the map is a valid representation of a [Phone] instance, this'
        ' constructor must create that instance.', () {
      final Map<String, dynamic> map = {
        'phone': 'phone',
        'label': 'label',
      };
      expect(
        Phone.fromMap(map),
        const Phone(
          phone: 'phone',
          label: 'label',
        ),
      );
    });
    test(
        'If the map is not a valid representation of a [Phone] instance, this'
        ' constructor must throw a [FormatException].', () {
      final Map<String, dynamic> invalidMap = {
        'label': 'label',
      };
      expect(
        () => Phone.fromMap(invalidMap),
        throwsFormatException,
        reason: '[invalidMap] does not contain "phone" key.',
      );
    });
  });

  group('copyWith', () {
    const Phone phone = Phone(
      phone: 'phone',
      label: 'label',
    );
    test(
      'This method must copy all parameters and update the ones provided.',
      () {
        expect(
          phone.copyWith(),
          phone,
          reason: 'Without any parameters passed to [copyWith], it must return'
              ' the original [phone].',
        );
        expect(
          phone.copyWith(phone: 'other'),
          const Phone(
            phone: 'other',
            label: 'label',
          ),
          reason: 'The only parameter that has to change is "phone".',
        );
        expect(
          phone.copyWith(label: 'other'),
          const Phone(
            phone: 'phone',
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
        const Phone(
          label: 'label',
          phone: 'phone',
        ).toJson(),
        '{"label":"label","phone":"phone"}',
        reason: 'No parameter is null.',
      );
      expect(
        const Phone(phone: 'phone').toJson(),
        '{"label":null,"phone":"phone"}',
        reason: 'Only "phone" parameter is not null.',
      );
    });
  });

  group('toMap', () {
    test('This method must return the corresponding map.', () {
      expect(
        const Phone(
          label: 'label',
          phone: 'phone',
        ).toMap(),
        {
          'label': 'label',
          'phone': 'phone',
        },
        reason: 'With all the parameters.',
      );
      expect(
        const Phone(
          phone: 'phone',
        ).toMap(),
        {
          'label': null,
          'phone': 'phone',
        },
        reason: 'Only "phone" parameter is not null.',
      );
    });
  });
}
