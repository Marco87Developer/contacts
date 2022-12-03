import 'dart:io';

import 'package:contacts/src/models/custom_field.dart';
import 'package:test/test.dart';

void main() {
  group('The transitive and the symmetric property:', () {
    test(
      'The transitive property: if [b] = [a] and [c] = [b], then [c] = [a].',
      () {
        const CustomField a = CustomField(
          customField: 'customField',
          label: 'label',
        );
        const CustomField b = a;
        const CustomField c = b;
        expect(c, a);
      },
    );
    test(
      'The symmetric property: if [a] = [b], then [b] = [a].',
      () {
        const CustomField a = CustomField(
          customField: 'customField',
          label: 'label',
        );
        const CustomField b = CustomField(
          customField: 'customField',
          label: 'label',
        );
        expect(a, b);
        expect(b, a);
      },
    );
  });

  group('factory CustomField.fromJson', () {
    test(
        'If the JSON string is a valid representation of a [CustomField], must'
        ' construct a [CustomField] instance.', () async {
      final file = File('test/models/custom_field/custom_field_test.json');
      final json = await file.readAsString();
      expect(
        CustomField.fromJson(json),
        const CustomField(
          customField: 'customField',
          label: 'label',
        ),
        reason: 'The JSON string is a valid representation of a [CustomField]'
            ' instance.',
      );
    });
    test(
        'If the JSON string is not a valid representation of a [CustomField],'
        ' this constructor must throw a [FormatException].', () async {
      final file1 =
          File('test/models/custom_field/custom_field_not_valid_1_test.json');
      final json1 = await file1.readAsString();
      expect(
        () => CustomField.fromJson(json1),
        throwsFormatException,
        reason: 'Required parameter "customField" is not present.',
      );
      final file2 =
          File('test/models/custom_field/custom_field_not_valid_2_test.json');
      final json2 = await file2.readAsString();
      expect(
        () => CustomField.fromJson(json2),
        throwsFormatException,
        reason: 'The JSON file contains only an empty object.',
      );
    });
  });

  group('CustomField.fromMap', () {
    test(
        'If the map is a valid representation of a [CustomField] instance, this'
        ' constructor must create that instance.', () {
      final Map<String, dynamic> map = {
        'customField': 'customField',
        'label': 'label',
      };
      expect(
        CustomField.fromMap(map),
        const CustomField(
          customField: 'customField',
          label: 'label',
        ),
      );
    });
    test(
        'If the map is not a valid representation of a [CustomField] instance,'
        ' this constructor must throw a [FormatException].', () {
      final Map<String, dynamic> invalidMap = {
        'label': 'label',
      };
      expect(
        () => CustomField.fromMap(invalidMap),
        throwsFormatException,
        reason: '[invalidMap] does not contain "customField" key.',
      );
    });
  });

  group('copyWith', () {
    const CustomField customField = CustomField(
      customField: 'customField',
      label: 'label',
    );
    test(
      'This method must copy all parameters and update the ones provided.',
      () {
        expect(
          customField.copyWith(),
          customField,
          reason: 'Without any parameters passed to [copyWith], it must return'
              ' the original [customField].',
        );
        expect(
          customField.copyWith(customField: 'other'),
          const CustomField(
            customField: 'other',
            label: 'label',
          ),
          reason: 'The only parameter that has to change is "customField".',
        );
        expect(
          customField.copyWith(label: 'other'),
          const CustomField(
            customField: 'customField',
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
        const CustomField(
          customField: 'customField',
          label: 'label',
        ).toJson(),
        '{"customField":"customField","label":"label"}',
        reason: 'No parameter is null.',
      );
      expect(
        const CustomField(customField: 'customField').toJson(),
        '{"customField":"customField","label":null}',
        reason: 'Only "customField" parameter is not null.',
      );
    });
  });

  group('toMap', () {
    test('This method must return the corresponding map.', () {
      expect(
        const CustomField(
          customField: 'customField',
          label: 'label',
        ).toMap(),
        {
          'customField': 'customField',
          'label': 'label',
        },
        reason: 'With all the parameters.',
      );
      expect(
        const CustomField(
          customField: 'customField',
        ).toMap(),
        {
          'customField': 'customField',
          'label': null,
        },
        reason: 'Only "customField" parameter is not null.',
      );
    });
  });
}
