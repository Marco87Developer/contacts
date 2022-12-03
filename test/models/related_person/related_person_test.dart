import 'dart:io';

import 'package:contacts/src/models/related_person.dart';
import 'package:test/test.dart';

void main() {
  group('The transitive and the symmetric property:', () {
    test(
      'The transitive property: if [b] = [a] and [c] = [b], then [c] = [a].',
      () {
        const RelatedPerson a = RelatedPerson(
          relatedPerson: 'relatedPerson',
          label: 'label',
        );
        const RelatedPerson b = a;
        const RelatedPerson c = b;
        expect(c, a);
      },
    );
    test(
      'The symmetric property: if [a] = [b], then [b] = [a].',
      () {
        const RelatedPerson a = RelatedPerson(
          relatedPerson: 'relatedPerson',
          label: 'label',
        );
        const RelatedPerson b = RelatedPerson(
          relatedPerson: 'relatedPerson',
          label: 'label',
        );
        expect(a, b);
        expect(b, a);
      },
    );
  });

  group('factory RelatedPerson.fromJson', () {
    test(
        'If the JSON string is a valid representation of an [RelatedPerson],'
        ' must construct an [RelatedPerson] instance.', () async {
      final file = File('test/models/related_person/related_person_test.json');
      final json = await file.readAsString();
      expect(
        RelatedPerson.fromJson(json),
        const RelatedPerson(
          relatedPerson: 'relatedPerson',
          label: 'label',
        ),
        reason:
            'The JSON string is a valid representation of an [RelatedPerson]'
            ' instance.',
      );
    });
    test(
        'If the JSON string is not a valid representation of a [RelatedPerson],'
        ' this constructor must throw a [FormatException].', () async {
      final file1 = File(
        'test/models/related_person/related_person_not_valid_1_test.json',
      );
      final json1 = await file1.readAsString();
      expect(
        () => RelatedPerson.fromJson(json1),
        throwsFormatException,
        reason: 'Required parameter "relatedPerson" is not present.',
      );
      final file2 = File(
        'test/models/related_person/related_person_not_valid_2_test.json',
      );
      final json2 = await file2.readAsString();
      expect(
        () => RelatedPerson.fromJson(json2),
        throwsFormatException,
        reason: 'The JSON file contains only an empty object.',
      );
    });
  });

  group('RelatedPerson.fromMap', () {
    test(
        'If the map is a valid representation of a [RelatedPerson] instance,'
        ' this constructor must create that instance.', () {
      final Map<String, dynamic> map = {
        'relatedPerson': 'relatedPerson',
        'label': 'label',
      };
      expect(
        RelatedPerson.fromMap(map),
        const RelatedPerson(
          relatedPerson: 'relatedPerson',
          label: 'label',
        ),
      );
    });
    test(
        'If the map is not a valid representation of a [RelatedPerson]'
        ' instance, this constructor must throw a [FormatException].', () {
      final Map<String, dynamic> invalidMap = {
        'label': 'label',
      };
      expect(
        () => RelatedPerson.fromMap(invalidMap),
        throwsFormatException,
        reason: '[invalidMap] does not contain "relatedPerson" key.',
      );
    });
  });

  group('copyWith', () {
    const RelatedPerson relatedPerson = RelatedPerson(
      relatedPerson: 'relatedPerson',
      label: 'label',
    );
    test(
      'This method must copy all parameters and update the ones provided.',
      () {
        expect(
          relatedPerson.copyWith(),
          relatedPerson,
          reason: 'Without any parameters passed to [copyWith], it must return'
              ' the original [relatedPerson].',
        );
        expect(
          relatedPerson.copyWith(relatedPerson: 'other'),
          const RelatedPerson(
            relatedPerson: 'other',
            label: 'label',
          ),
          reason: 'The only parameter that has to change is "relatedPerson".',
        );
        expect(
          relatedPerson.copyWith(label: 'other'),
          const RelatedPerson(
            relatedPerson: 'relatedPerson',
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
        const RelatedPerson(
          label: 'label',
          relatedPerson: 'relatedPerson',
        ).toJson(),
        '{"label":"label","relatedPerson":"relatedPerson"}',
        reason: 'No parameter is null.',
      );
      expect(
        const RelatedPerson(relatedPerson: 'relatedPerson').toJson(),
        '{"label":null,"relatedPerson":"relatedPerson"}',
        reason: 'Only "relatedPerson" parameter is not null.',
      );
    });
  });

  group('toMap', () {
    test('This method must return the corresponding map.', () {
      expect(
        const RelatedPerson(
          label: 'label',
          relatedPerson: 'relatedPerson',
        ).toMap(),
        {
          'label': 'label',
          'relatedPerson': 'relatedPerson',
        },
        reason: 'With all the parameters.',
      );
      expect(
        const RelatedPerson(
          relatedPerson: 'relatedPerson',
        ).toMap(),
        {
          'label': null,
          'relatedPerson': 'relatedPerson',
        },
        reason: 'Only "relatedPerson" parameter is not null.',
      );
    });
  });
}
