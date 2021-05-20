import 'package:contacts/src/models/name.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Name.fromMap()', () {
    final Map<String, dynamic> map = <String, dynamic>{
      'fileAs': 'File as',
      'firstName': 'First name',
      'lastName': 'Last name',
      'middleName': 'Middle name',
      'nickname': 'Nickname',
      'phoneticFirst': 'Phonetic first',
      'phoneticLast': 'Phonetic last',
      'phoneticMiddle': 'Phonetic middle',
      'prefix': 'Prefix',
      'suffix': 'Suffix',
    };

    expect(
      Name.fromMap(map),
      const Name(
        fileAs: 'File as',
        firstName: 'First name',
        lastName: 'Last name',
        middleName: 'Middle name',
        nickname: 'Nickname',
        phoneticFirst: 'Phonetic first',
        phoneticLast: 'Phonetic last',
        phoneticMiddle: 'Phonetic middle',
        prefix: 'Prefix',
        suffix: 'Suffix',
      ),
    );
  });

  test('toMap()', () {
    const Name name = Name(
      fileAs: 'File as',
      firstName: 'First name',
      lastName: 'Last name',
      middleName: 'Middle name',
      nickname: 'Nickname',
      phoneticFirst: 'Phonetic first',
      phoneticLast: 'Phonetic last',
      phoneticMiddle: 'Phonetic middle',
      prefix: 'Prefix',
      suffix: 'Suffix',
    );

    const Name name2 = Name(
      firstName: 'First name',
      lastName: 'Last name',
    );

    expect(
      name.toMap(),
      {
        'fileAs': 'File as',
        'firstName': 'First name',
        'lastName': 'Last name',
        'middleName': 'Middle name',
        'nickname': 'Nickname',
        'phoneticFirst': 'Phonetic first',
        'phoneticLast': 'Phonetic last',
        'phoneticMiddle': 'Phonetic middle',
        'prefix': 'Prefix',
        'suffix': 'Suffix',
      },
    );
    expect(
      name2.toMap(),
      {
        'fileAs': '',
        'firstName': 'First name',
        'lastName': 'Last name',
        'middleName': '',
        'nickname': '',
        'phoneticFirst': '',
        'phoneticLast': '',
        'phoneticMiddle': '',
        'prefix': '',
        'suffix': '',
      },
    );
  });

  test('compareTo()', () {
    const Name name1 = Name(
      fileAs: 'File as',
      firstName: 'First name',
      lastName: 'Last name',
      middleName: 'Middle name',
      nickname: 'Nickname',
      phoneticFirst: 'Phonetic first',
      phoneticLast: 'Phonetic last',
      phoneticMiddle: 'Phonetic middle',
      prefix: 'Prefix',
      suffix: 'Suffix',
    );
    const Name name2 = Name(
      firstName: 'First name',
      lastName: 'Last name',
    );

    expect(name2.compareTo(name1), -1);
    expect(name1.compareTo(name1), 0);
    expect(name1.compareTo(name2), 1);
    expect(name1 < name2, false);
    expect(name1 <= name2, false);
    expect(name1 == name1, true);
    expect(name1 == name2, false);
    expect(name1 > name2, true);
    expect(name1 >= name2, true);
  });
}
