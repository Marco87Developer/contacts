import 'dart:io';

import 'package:contacts/src/models/website.dart';
import 'package:test/test.dart';

void main() {
  group('The transitive and the symmetric property:', () {
    test(
      'The transitive property: if [b] = [a] and [c] = [b], then [c] = [a].',
      () {
        const Website a = Website(
          website: 'website',
          label: 'label',
        );
        const Website b = a;
        const Website c = b;
        expect(c, a);
      },
    );
    test(
      'The symmetric property: if [a] = [b], then [b] = [a].',
      () {
        const Website a = Website(
          website: 'website',
          label: 'label',
        );
        const Website b = Website(
          website: 'website',
          label: 'label',
        );
        expect(a, b);
        expect(b, a);
      },
    );
  });

  group('factory Website.fromJson', () {
    test(
        'If the JSON string is a valid representation of an [Website], must'
        ' construct an [Website] instance.', () async {
      final file = File('test/models/website/website_test.json');
      final json = await file.readAsString();
      expect(
        Website.fromJson(json),
        const Website(
          website: 'website',
          label: 'label',
        ),
        reason: 'The JSON string is a valid representation of an [Website]'
            ' instance.',
      );
    });
    test(
        'If the JSON string is not a valid representation of a [Website], this'
        ' constructor must throw a [FormatException].', () async {
      final file1 = File('test/models/website/website_not_valid_1_test.json');
      final json1 = await file1.readAsString();
      expect(
        () => Website.fromJson(json1),
        throwsFormatException,
        reason: 'Required parameter "website" is not present.',
      );
      final file2 = File('test/models/website/website_not_valid_2_test.json');
      final json2 = await file2.readAsString();
      expect(
        () => Website.fromJson(json2),
        throwsFormatException,
        reason: 'The JSON file contains only an empty object.',
      );
    });
  });

  group('Website.fromMap', () {
    test(
        'If the map is a valid representation of a [Website] instance, this'
        ' constructor must create that instance.', () {
      final Map<String, dynamic> map = {
        'website': 'website',
        'label': 'label',
      };
      expect(
        Website.fromMap(map),
        const Website(
          website: 'website',
          label: 'label',
        ),
      );
    });
    test(
        'If the map is not a valid representation of a [Website] instance, this'
        ' constructor must throw a [FormatException].', () {
      final Map<String, dynamic> invalidMap = {
        'label': 'label',
      };
      expect(
        () => Website.fromMap(invalidMap),
        throwsFormatException,
        reason: '[invalidMap] does not contain "website" key.',
      );
    });
  });

  group('copyWith', () {
    const Website website = Website(
      website: 'website',
      label: 'label',
    );
    test(
      'This method must copy all parameters and update the ones provided.',
      () {
        expect(
          website.copyWith(),
          website,
          reason: 'Without any parameters passed to [copyWith], it must return'
              ' the original [website].',
        );
        expect(
          website.copyWith(website: 'other'),
          const Website(
            website: 'other',
            label: 'label',
          ),
          reason: 'The only parameter that has to change is "website".',
        );
        expect(
          website.copyWith(label: 'other'),
          const Website(
            website: 'website',
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
        const Website(
          label: 'label',
          website: 'website',
        ).toJson(),
        '{"label":"label","website":"website"}',
        reason: 'No parameter is null.',
      );
      expect(
        const Website(website: 'website').toJson(),
        '{"label":null,"website":"website"}',
        reason: 'Only "website" parameter is not null.',
      );
    });
  });

  group('toMap', () {
    test('This method must return the corresponding map.', () {
      expect(
        const Website(
          label: 'label',
          website: 'website',
        ).toMap(),
        {
          'label': 'label',
          'website': 'website',
        },
        reason: 'With all the parameters.',
      );
      expect(
        const Website(
          website: 'website',
        ).toMap(),
        {
          'label': null,
          'website': 'website',
        },
        reason: 'Only "website" parameter is not null.',
      );
    });
  });
}
