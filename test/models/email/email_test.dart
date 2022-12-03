import 'dart:io';

import 'package:contacts/src/models/email.dart';
import 'package:test/test.dart';

void main() {
  group('The transitive and the symmetric property:', () {
    test(
      'The transitive property: if [b] = [a] and [c] = [b], then [c] = [a].',
      () {
        const Email a = Email(
          email: 'email',
          label: 'label',
        );
        const Email b = a;
        const Email c = b;
        expect(c, a);
      },
    );
    test(
      'The symmetric property: if [a] = [b], then [b] = [a].',
      () {
        const Email a = Email(
          email: 'email',
          label: 'label',
        );
        const Email b = Email(
          email: 'email',
          label: 'label',
        );
        expect(a, b);
        expect(b, a);
      },
    );
  });

  group('factory Email.fromJson', () {
    test(
        'If the JSON string is a valid representation of an [Email], must'
        ' construct an [Email] instance.', () async {
      final file = File('test/models/email/email_test.json');
      final json = await file.readAsString();
      expect(
        Email.fromJson(json),
        const Email(
          email: 'email',
          label: 'label',
        ),
        reason: 'The JSON string is a valid representation of an [Email]'
            ' instance.',
      );
    });
    test(
        'If the JSON string is not a valid representation of a [Email], this'
        ' constructor must throw a [FormatException].', () async {
      final file1 = File('test/models/email/email_not_valid_1_test.json');
      final json1 = await file1.readAsString();
      expect(
        () => Email.fromJson(json1),
        throwsFormatException,
        reason: 'Required parameter "email" is not present.',
      );
      final file2 = File('test/models/email/email_not_valid_2_test.json');
      final json2 = await file2.readAsString();
      expect(
        () => Email.fromJson(json2),
        throwsFormatException,
        reason: 'The JSON file contains only an empty object.',
      );
    });
  });

  group('Email.fromMap', () {
    test(
        'If the map is a valid representation of a [Email] instance, this'
        ' constructor must create that instance.', () {
      final Map<String, dynamic> map = {
        'email': 'email',
        'label': 'label',
      };
      expect(
        Email.fromMap(map),
        const Email(
          email: 'email',
          label: 'label',
        ),
      );
    });
    test(
        'If the map is not a valid representation of a [Email] instance, this'
        ' constructor must throw a [FormatException].', () {
      final Map<String, dynamic> invalidMap = {
        'label': 'label',
      };
      expect(
        () => Email.fromMap(invalidMap),
        throwsFormatException,
        reason: '[invalidMap] does not contain "email" key.',
      );
    });
  });

  group('copyWith', () {
    const Email email = Email(
      email: 'email',
      label: 'label',
    );
    test(
      'This method must copy all parameters and update the ones provided.',
      () {
        expect(
          email.copyWith(),
          email,
          reason: 'Without any parameters passed to [copyWith], it must return'
              ' the original [email].',
        );
        expect(
          email.copyWith(email: 'other'),
          const Email(
            email: 'other',
            label: 'label',
          ),
          reason: 'The only parameter that has to change is "email".',
        );
        expect(
          email.copyWith(label: 'other'),
          const Email(
            email: 'email',
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
        const Email(
          email: 'email',
          label: 'label',
        ).toJson(),
        '{"email":"email","label":"label"}',
        reason: 'No parameter is null.',
      );
      expect(
        const Email(email: 'email').toJson(),
        '{"email":"email","label":null}',
        reason: 'Only "email" parameter is not null.',
      );
    });
  });

  group('toMap', () {
    test('This method must return the corresponding map.', () {
      expect(
        const Email(
          email: 'email',
          label: 'label',
        ).toMap(),
        {
          'email': 'email',
          'label': 'label',
        },
        reason: 'With all the parameters.',
      );
      expect(
        const Email(
          email: 'email',
        ).toMap(),
        {
          'email': 'email',
          'label': null,
        },
        reason: 'Only "email" parameter is not null.',
      );
    });
  });
}
