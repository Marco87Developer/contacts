import 'dart:io';

import 'package:contacts/src/models/name.dart';
import 'package:test/test.dart';

void main() {
  group('The transitive and the symmetric property:', () {
    test(
      'The transitive property: if [b] = [a] and [c] = [b], then [c] = [a].',
      () {
        const Name a = Name(
          fileAs: 'fileAs',
          firstName: 'firstName',
          lastName: 'lastName',
          middleName: 'middleName',
          nickname: 'nickname',
          phoneticFirst: 'phoneticFirst',
          phoneticLast: 'phoneticLast',
          phoneticMiddle: 'phoneticMiddle',
          prefix: 'prefix',
          suffix: 'suffix',
        );
        const Name b = a;
        const Name c = b;
        expect(c, a);
      },
    );
    test(
      'The symmetric property: if [a] = [b], then [b] = [a].',
      () {
        const Name a = Name(
          fileAs: 'fileAs',
          firstName: 'firstName',
          lastName: 'lastName',
          middleName: 'middleName',
          nickname: 'nickname',
          phoneticFirst: 'phoneticFirst',
          phoneticLast: 'phoneticLast',
          phoneticMiddle: 'phoneticMiddle',
          prefix: 'prefix',
          suffix: 'suffix',
        );
        const Name b = Name(
          fileAs: 'fileAs',
          firstName: 'firstName',
          lastName: 'lastName',
          middleName: 'middleName',
          nickname: 'nickname',
          phoneticFirst: 'phoneticFirst',
          phoneticLast: 'phoneticLast',
          phoneticMiddle: 'phoneticMiddle',
          prefix: 'prefix',
          suffix: 'suffix',
        );
        expect(a, b);
        expect(b, a);
      },
    );
  });

  group('factory Name.fromJson:', () {
    test(
        'If the JSON string is a valid representation of an [Name], must'
        ' construct an [Name] instance.', () async {
      final file = File('test/models/name/name_test.json');
      final json = await file.readAsString();
      expect(
        Name.fromJson(json),
        const Name(
          fileAs: 'fileAs',
          firstName: 'firstName',
          lastName: 'lastName',
          middleName: 'middleName',
          nickname: 'nickname',
          phoneticFirst: 'phoneticFirst',
          phoneticLast: 'phoneticLast',
          phoneticMiddle: 'phoneticMiddle',
          prefix: 'prefix',
          suffix: 'suffix',
        ),
        reason: 'The JSON string is a valid representation of an [Name]'
            ' instance.',
      );
    });
  });

  group('Name.fromMap', () {
    test(
        'If the map is a valid representation of a [Name] instance, this'
        ' constructor must create that instance.', () {
      final Map<String, dynamic> map = {
        'fileAs': 'fileAs',
        'firstName': 'firstName',
        'lastName': 'lastName',
        'middleName': 'middleName',
        'nickname': 'nickname',
        'phoneticFirst': 'phoneticFirst',
        'phoneticLast': 'phoneticLast',
        'phoneticMiddle': 'phoneticMiddle',
        'prefix': 'prefix',
        'suffix': 'suffix',
      };
      expect(
        Name.fromMap(map),
        const Name(
          fileAs: 'fileAs',
          firstName: 'firstName',
          lastName: 'lastName',
          middleName: 'middleName',
          nickname: 'nickname',
          phoneticFirst: 'phoneticFirst',
          phoneticLast: 'phoneticLast',
          phoneticMiddle: 'phoneticMiddle',
          prefix: 'prefix',
          suffix: 'suffix',
        ),
      );
    });
  });

  group('copyWith', () {
    const name = Name(
      fileAs: 'fileAs',
      firstName: 'firstName',
      lastName: 'lastName',
      middleName: 'middleName',
      nickname: 'nickname',
      phoneticFirst: 'phoneticFirst',
      phoneticLast: 'phoneticLast',
      phoneticMiddle: 'phoneticMiddle',
      prefix: 'prefix',
      suffix: 'suffix',
    );
    test('This method must copy all parameters and update the ones provided.',
        () {
      expect(
        name.copyWith(),
        name,
        reason: 'Without any parameters passed to [copyWith], it must return'
            ' the original [name].',
      );
      expect(
        name.copyWith(fileAs: 'other'),
        const Name(
          fileAs: 'other',
          firstName: 'firstName',
          lastName: 'lastName',
          middleName: 'middleName',
          nickname: 'nickname',
          phoneticFirst: 'phoneticFirst',
          phoneticLast: 'phoneticLast',
          phoneticMiddle: 'phoneticMiddle',
          prefix: 'prefix',
          suffix: 'suffix',
        ),
        reason: 'The only parameter that has to change is "fileAs".',
      );
      expect(
        name.copyWith(firstName: 'other'),
        const Name(
          fileAs: 'fileAs',
          firstName: 'other',
          lastName: 'lastName',
          middleName: 'middleName',
          nickname: 'nickname',
          phoneticFirst: 'phoneticFirst',
          phoneticLast: 'phoneticLast',
          phoneticMiddle: 'phoneticMiddle',
          prefix: 'prefix',
          suffix: 'suffix',
        ),
        reason: 'The only parameter that has to change is "firstName".',
      );
      expect(
        name.copyWith(lastName: 'other'),
        const Name(
          fileAs: 'fileAs',
          firstName: 'firstName',
          lastName: 'other',
          middleName: 'middleName',
          nickname: 'nickname',
          phoneticFirst: 'phoneticFirst',
          phoneticLast: 'phoneticLast',
          phoneticMiddle: 'phoneticMiddle',
          prefix: 'prefix',
          suffix: 'suffix',
        ),
        reason: 'The only parameter that has to change is "lastName".',
      );
      expect(
        name.copyWith(middleName: 'other'),
        const Name(
          fileAs: 'fileAs',
          firstName: 'firstName',
          lastName: 'lastName',
          middleName: 'other',
          nickname: 'nickname',
          phoneticFirst: 'phoneticFirst',
          phoneticLast: 'phoneticLast',
          phoneticMiddle: 'phoneticMiddle',
          prefix: 'prefix',
          suffix: 'suffix',
        ),
        reason: 'The only parameter that has to change is "middleName".',
      );
      expect(
        name.copyWith(nickname: 'other'),
        const Name(
          fileAs: 'fileAs',
          firstName: 'firstName',
          lastName: 'lastName',
          middleName: 'middleName',
          nickname: 'other',
          phoneticFirst: 'phoneticFirst',
          phoneticLast: 'phoneticLast',
          phoneticMiddle: 'phoneticMiddle',
          prefix: 'prefix',
          suffix: 'suffix',
        ),
        reason: 'The only parameter that has to change is "nickname".',
      );
      expect(
        name.copyWith(phoneticFirst: 'other'),
        const Name(
          fileAs: 'fileAs',
          firstName: 'firstName',
          lastName: 'lastName',
          middleName: 'middleName',
          nickname: 'nickname',
          phoneticFirst: 'other',
          phoneticLast: 'phoneticLast',
          phoneticMiddle: 'phoneticMiddle',
          prefix: 'prefix',
          suffix: 'suffix',
        ),
        reason: 'The only parameter that has to change is "phoneticFirst".',
      );
      expect(
        name.copyWith(phoneticLast: 'other'),
        const Name(
          fileAs: 'fileAs',
          firstName: 'firstName',
          lastName: 'lastName',
          middleName: 'middleName',
          nickname: 'nickname',
          phoneticFirst: 'phoneticFirst',
          phoneticLast: 'other',
          phoneticMiddle: 'phoneticMiddle',
          prefix: 'prefix',
          suffix: 'suffix',
        ),
        reason: 'The only parameter that has to change is "phoneticLast".',
      );
      expect(
        name.copyWith(phoneticMiddle: 'other'),
        const Name(
          fileAs: 'fileAs',
          firstName: 'firstName',
          lastName: 'lastName',
          middleName: 'middleName',
          nickname: 'nickname',
          phoneticFirst: 'phoneticFirst',
          phoneticLast: 'phoneticLast',
          phoneticMiddle: 'other',
          prefix: 'prefix',
          suffix: 'suffix',
        ),
        reason: 'The only parameter that has to change is "phoneticMiddle".',
      );
      expect(
        name.copyWith(prefix: 'other'),
        const Name(
          fileAs: 'fileAs',
          firstName: 'firstName',
          lastName: 'lastName',
          middleName: 'middleName',
          nickname: 'nickname',
          phoneticFirst: 'phoneticFirst',
          phoneticLast: 'phoneticLast',
          phoneticMiddle: 'phoneticMiddle',
          prefix: 'other',
          suffix: 'suffix',
        ),
        reason: 'The only parameter that has to change is "prefix".',
      );
      expect(
        name.copyWith(suffix: 'other'),
        const Name(
          fileAs: 'fileAs',
          firstName: 'firstName',
          lastName: 'lastName',
          middleName: 'middleName',
          nickname: 'nickname',
          phoneticFirst: 'phoneticFirst',
          phoneticLast: 'phoneticLast',
          phoneticMiddle: 'phoneticMiddle',
          prefix: 'prefix',
          suffix: 'other',
        ),
        reason: 'The only parameter that has to change is "suffix".',
      );
    });
  });

  group('toJson', () {
    test('This method must return the corresponding JSON string.', () {
      expect(
        const Name(
          fileAs: 'fileAs',
          firstName: 'firstName',
          lastName: 'lastName',
          middleName: 'middleName',
          nickname: 'nickname',
          phoneticFirst: 'phoneticFirst',
          phoneticLast: 'phoneticLast',
          phoneticMiddle: 'phoneticMiddle',
          prefix: 'prefix',
          suffix: 'suffix',
        ).toJson(),
        '{"fileAs":"fileAs","firstName":"firstName","lastName":"lastName",'
        '"middleName":"middleName","nickname":"nickname","phoneticFirst":'
        '"phoneticFirst","phoneticLast":"phoneticLast","phoneticMiddle":'
        '"phoneticMiddle","prefix":"prefix","suffix":"suffix"}',
        reason: 'No parameter is null.',
      );
      expect(
        const Name().toJson(),
        '{"fileAs":null,"firstName":null,"lastName":null,"middleName":null,'
        '"nickname":null,"phoneticFirst":null,"phoneticLast":null,'
        '"phoneticMiddle":null,"prefix":null,"suffix":null}',
        reason: 'All the  parameters are null.',
      );
    });
  });

  group('toMap', () {
    test('This method must return the corresponding map.', () {
      expect(
        const Name(
          fileAs: 'fileAs',
          firstName: 'firstName',
          lastName: 'lastName',
          middleName: 'middleName',
          nickname: 'nickname',
          phoneticFirst: 'phoneticFirst',
          phoneticLast: 'phoneticLast',
          phoneticMiddle: 'phoneticMiddle',
          prefix: 'prefix',
          suffix: 'suffix',
        ).toMap(),
        {
          'fileAs': 'fileAs',
          'firstName': 'firstName',
          'lastName': 'lastName',
          'middleName': 'middleName',
          'nickname': 'nickname',
          'phoneticFirst': 'phoneticFirst',
          'phoneticLast': 'phoneticLast',
          'phoneticMiddle': 'phoneticMiddle',
          'prefix': 'prefix',
          'suffix': 'suffix',
        },
        reason: 'With all the parameters.',
      );
      expect(
        const Name().toMap(),
        {
          'fileAs': null,
          'firstName': null,
          'lastName': null,
          'middleName': null,
          'nickname': null,
          'phoneticFirst': null,
          'phoneticLast': null,
          'phoneticMiddle': null,
          'prefix': null,
          'suffix': null,
        },
        reason: 'With all the parameters null.',
      );
    });
  });
}
