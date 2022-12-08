import 'dart:io';

import 'package:contacts/src/models/organization.dart';
import 'package:test/test.dart';

void main() {
  group('The transitive and the symmetric property:', () {
    test(
      'The transitive property: if [b] = [a] and [c] = [b], then [c] = [a].',
      () {
        const Organization a = Organization(
          company: 'company',
          department: 'department',
          jobTitle: 'jobTitle',
        );
        const Organization b = a;
        const Organization c = b;
        expect(c, a);
      },
    );
    test(
      'The symmetric property: if [a] = [b], then [b] = [a].',
      () {
        const Organization a = Organization(
          company: 'company',
          department: 'department',
          jobTitle: 'jobTitle',
        );
        const Organization b = Organization(
          company: 'company',
          department: 'department',
          jobTitle: 'jobTitle',
        );
        expect(a, b);
        expect(b, a);
      },
    );
  });

  group('factory Organization.fromJson', () {
    test(
        'If the JSON string is a valid representation of an [Organization],'
        ' must construct an [Organization] instance.', () async {
      final file = File('test/models/organization/organization_test.json');
      final json = await file.readAsString();
      expect(
        Organization.fromJson(json),
        const Organization(
          company: 'company',
          department: 'department',
          jobTitle: 'jobTitle',
        ),
        reason: 'The JSON string is a valid representation of an [Organization]'
            ' instance.',
      );
    });
  });

  group('Organization.fromMap', () {
    test(
        'If the map is a valid representation of a [Organization] instance,'
        ' this constructor must create that instance.', () {
      final Map<String, dynamic> map = {
        'company': 'company',
        'department': 'department',
        'jobTitle': 'jobTitle',
      };
      expect(
        Organization.fromMap(map),
        const Organization(
          company: 'company',
          department: 'department',
          jobTitle: 'jobTitle',
        ),
      );
    });
  });

  group('copyWith', () {
    const Organization organization = Organization(
      company: 'company',
      department: 'department',
      jobTitle: 'jobTitle',
    );
    test(
      'This method must copy all parameters and update the ones provided.',
      () {
        expect(
          organization.copyWith(),
          organization,
          reason: 'Without any parameters passed to [copyWith], it must return'
              ' the original [organization].',
        );
        expect(
          organization.copyWith(company: 'other'),
          const Organization(
            company: 'other',
            department: 'department',
            jobTitle: 'jobTitle',
          ),
          reason: 'The only parameter that has to change is "company".',
        );
        expect(
          organization.copyWith(department: 'other'),
          const Organization(
            company: 'company',
            department: 'other',
            jobTitle: 'jobTitle',
          ),
          reason: 'The only parameter that has to change is "department".',
        );
        expect(
          organization.copyWith(jobTitle: 'other'),
          const Organization(
            company: 'company',
            department: 'department',
            jobTitle: 'other',
          ),
          reason: 'The only parameter that has to change is "jobTitle".',
        );
      },
    );
  });

  group('toJson', () {
    test('This method must return the corresponding JSON string.', () {
      expect(
        const Organization(
          company: 'company',
          department: 'department',
          jobTitle: 'jobTitle',
        ).toJson(),
        '{"company":"company","department":"department","jobTitle":"jobTitle"}',
        reason: 'No parameter is null.',
      );
      expect(
        const Organization().toJson(),
        '{"company":null,"department":null,"jobTitle":null}',
        reason: 'All the parameters are null.',
      );
    });
  });

  group('toMap', () {
    test('This method must return the corresponding map.', () {
      expect(
        const Organization(
          company: 'company',
          department: 'department',
          jobTitle: 'jobTitle',
        ).toMap(),
        {
          'company': 'company',
          'department': 'department',
          'jobTitle': 'jobTitle',
        },
        reason: 'With all the parameters.',
      );
      expect(
        const Organization().toMap(),
        {
          'company': null,
          'department': null,
          'jobTitle': null,
        },
        reason: 'All the parameters are null.',
      );
    });
  });
}
