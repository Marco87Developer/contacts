import 'package:flutter/material.dart';

const String _fileAsKey = 'fileAs';
const String _firstNameKey = 'firstName';
const String _lastNameKey = 'lastName';
const String _middleNameKey = 'middleName';
const String _nicknameKey = 'nickname';
const String _phoneticFirstKey = 'phoneticFirst';
const String _phoneticLastKey = 'phoneticLast';
const String _phoneticMiddleKey = 'phoneticMiddle';
const String _prefixKey = 'prefix';
const String _suffixKey = 'suffix';

/// This class models a reference to a person’s name.
///
/// It **requires** these fields: `String` [firstName] and `String` [lastName].
///
/// Also, it has *optional* fields: `String` [fileAs], `String` [middleName],
/// `String` [nickname], `String` [phoneticFirst], `String` [phoneticLast],
/// `String` [phoneticMiddle], `String` [prefix] and `String` [suffix].
///
class Name implements Comparable {
  const Name({
    this.fileAs = '',
    required this.firstName,
    required this.lastName,
    this.middleName = '',
    this.nickname = '',
    this.phoneticFirst = '',
    this.phoneticLast = '',
    this.phoneticMiddle = '',
    this.prefix = '',
    this.suffix = '',
  });

  final String fileAs;
  final String firstName;
  final String lastName;
  final String middleName;
  final String nickname;
  final String phoneticFirst;
  final String phoneticLast;
  final String phoneticMiddle;
  final String prefix;
  final String suffix;

  Name.fromMap(Map<String, dynamic> map)
      : fileAs = map[_fileAsKey],
        firstName = map[_firstNameKey],
        lastName = map[_lastNameKey],
        middleName = map[_middleNameKey],
        nickname = map[_nicknameKey],
        phoneticFirst = map[_phoneticFirstKey],
        phoneticLast = map[_phoneticLastKey],
        phoneticMiddle = map[_phoneticMiddleKey],
        prefix = map[_prefixKey],
        suffix = map[_suffixKey];

  Map<String, dynamic> toMap() => {
        _fileAsKey: fileAs,
        _firstNameKey: firstName,
        _lastNameKey: lastName,
        _middleNameKey: middleName,
        _nicknameKey: nickname,
        _phoneticFirstKey: phoneticFirst,
        _phoneticLastKey: phoneticLast,
        _phoneticMiddleKey: phoneticMiddle,
        _prefixKey: prefix,
        _suffixKey: suffix,
      };

  /// The order of the comparisons is:
  ///
  /// 1. [firstName]
  /// 2. [middleName]
  /// 3. [lastName]
  /// 4. [prefix]
  /// 5. [phoneticFirst]
  /// 6. [phoneticMiddle]
  /// 7. [phoneticLast]
  /// 8. [suffix]
  /// 9. [nickname]
  /// 10. [fileAs]
  ///
  @override
  int compareTo(covariant Name other) {
    // 1º comparison
    int comparison1 = firstName.compareTo(other.firstName);
    if (comparison1 != 0) return comparison1;

    // 2º comparison
    int comparison2 = middleName.compareTo(other.middleName);
    if (comparison2 != 0) return comparison2;

    // 3º comparison
    int comparison3 = lastName.compareTo(other.lastName);
    if (comparison3 != 0) return comparison3;

    // 4º comparison
    int comparison4 = prefix.compareTo(other.prefix);
    if (comparison4 != 0) return comparison4;

    // 5º comparison
    int comparison5 = phoneticFirst.compareTo(other.phoneticFirst);
    if (comparison5 != 0) return comparison5;

    // 6º comparison
    int comparison6 = phoneticMiddle.compareTo(other.phoneticMiddle);
    if (comparison6 != 0) return comparison6;

    // 7º comparison
    int comparison7 = phoneticLast.compareTo(other.phoneticLast);
    if (comparison7 != 0) return comparison7;

    // 8º comparison
    int comparison8 = suffix.compareTo(other.suffix);
    if (comparison8 != 0) return comparison8;

    // 9º comparison
    int comparison9 = nickname.compareTo(other.nickname);
    if (comparison9 != 0) return comparison9;

    // Last comparison
    int comparison10 = fileAs.compareTo(other.fileAs);
    return comparison10;
  }

  @override
  int get hashCode => hashValues(
        fileAs,
        firstName,
        lastName,
        middleName,
        nickname,
        phoneticFirst,
        phoneticLast,
        phoneticMiddle,
        prefix,
        suffix,
      );

  bool operator <(covariant Name other) => compareTo(other) < 0;

  bool operator <=(covariant Name other) => compareTo(other) <= 0;

  bool operator ==(covariant Name other) => compareTo(other) == 0;

  bool operator >=(covariant Name other) => compareTo(other) >= 0;

  bool operator >(covariant Name other) => compareTo(other) > 0;
}
