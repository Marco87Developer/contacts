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
@immutable
class Name implements Comparable {
  /// A reference to a person’s name.
  ///
  /// It **requires** these fields: `String` [firstName] and
  /// `String` [lastName].
  ///
  /// Also, it has *optional* fields: `String` [fileAs], `String` [middleName],
  /// `String` [nickname], `String` [phoneticFirst], `String` [phoneticLast],
  /// `String` [phoneticMiddle], `String` [prefix] and `String` [suffix].
  ///
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

  /// Creates a `Name` instance starting from a `Map<String, dynamic> map`.
  ///
  /// This can be useful for retrieving the instance in a database.
  ///
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

  /// File as.
  final String fileAs;

  /// The first name.
  final String firstName;

  /// The last name.
  final String lastName;

  /// The middle name.
  final String middleName;

  /// A nickname.
  final String nickname;

  /// The phonetic first name.
  final String phoneticFirst;

  /// The phonetic last name.
  final String phoneticLast;

  /// The phonetic middle name.
  final String phoneticMiddle;

  /// The prefix for this name.
  final String prefix;

  /// The suffix for this name.
  final String suffix;

  /// Creates a `Map<String, dynamic> map` representation of this instance.
  ///
  /// This can be useful for saving the instance in a database.
  ///
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
    final int comparison1 = firstName.compareTo(other.firstName);
    if (comparison1 != 0) return comparison1;

    // 2º comparison
    final int comparison2 = middleName.compareTo(other.middleName);
    if (comparison2 != 0) return comparison2;

    // 3º comparison
    final int comparison3 = lastName.compareTo(other.lastName);
    if (comparison3 != 0) return comparison3;

    // 4º comparison
    final int comparison4 = prefix.compareTo(other.prefix);
    if (comparison4 != 0) return comparison4;

    // 5º comparison
    final int comparison5 = phoneticFirst.compareTo(other.phoneticFirst);
    if (comparison5 != 0) return comparison5;

    // 6º comparison
    final int comparison6 = phoneticMiddle.compareTo(other.phoneticMiddle);
    if (comparison6 != 0) return comparison6;

    // 7º comparison
    final int comparison7 = phoneticLast.compareTo(other.phoneticLast);
    if (comparison7 != 0) return comparison7;

    // 8º comparison
    final int comparison8 = suffix.compareTo(other.suffix);
    if (comparison8 != 0) return comparison8;

    // 9º comparison
    final int comparison9 = nickname.compareTo(other.nickname);
    if (comparison9 != 0) return comparison9;

    // Last comparison
    final int comparison10 = fileAs.compareTo(other.fileAs);
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

  /// Returns if this instance is less than the [other].
  ///
  bool operator <(covariant Name other) => compareTo(other) < 0;

  /// Return if this instance is less than or equal to the [other].
  ///
  bool operator <=(covariant Name other) => compareTo(other) <= 0;

  @override
  bool operator ==(covariant Name other) => compareTo(other) == 0;

  /// Return if this instance is greater than or equal to the [other].
  ///
  bool operator >=(covariant Name other) => compareTo(other) >= 0;

  /// Return if this instance is greater than the [other].
  ///
  bool operator >(covariant Name other) => compareTo(other) > 0;
}
