import 'dart:convert';

import 'package:meta/meta.dart';

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

/// The full name of a contact.
///
@immutable
class Name {
  /// The full name of a contact.
  ///
  const Name({
    this.prefix,
    this.firstName,
    this.middleName,
    this.lastName,
    this.suffix,
    this.phoneticFirst,
    this.phoneticMiddle,
    this.phoneticLast,
    this.nickname,
    this.fileAs,
  });

  /// Constructs an [Name] instance **from a [json] string**.
  ///
  factory Name.fromJson(final String json) =>
      Name.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs an [Name] instance **from a [map]**.
  ///
  Name.fromMap(final Map<String, dynamic> map)
      : prefix = map[_prefixKey] == null ? null : '${map[_prefixKey]}',
        firstName = map[_firstNameKey] == null ? null : '${map[_firstNameKey]}',
        middleName =
            map[_middleNameKey] == null ? null : '${map[_middleNameKey]}',
        lastName = map[_lastNameKey] == null ? null : '${map[_lastNameKey]}',
        suffix = map[_suffixKey] == null ? null : '${map[_suffixKey]}',
        phoneticFirst =
            map[_phoneticFirstKey] == null ? null : '${map[_phoneticFirstKey]}',
        phoneticMiddle = map[_phoneticMiddleKey] == null
            ? null
            : '${map[_phoneticMiddleKey]}',
        phoneticLast =
            map[_phoneticLastKey] == null ? null : '${map[_phoneticLastKey]}',
        nickname = map[_nicknameKey] == null ? null : '${map[_nicknameKey]}',
        fileAs = map[_fileAsKey] == null ? null : '${map[_fileAsKey]}';

  /// The prefix that goes before the name.
  final String? prefix;

  /// The first name.
  final String? firstName;

  /// The middle name.
  final String? middleName;

  /// The last name (or the last names).
  final String? lastName;

  /// The suffix following the name.
  final String? suffix;

  /// The phonetic first.
  final String? phoneticFirst;

  /// The phonetic middle.
  final String? phoneticMiddle;

  /// The phonetic last.
  final String? phoneticLast;

  /// The nickname.
  final String? nickname;

  /// File as.
  final String? fileAs;

  /// Creates a **copy** of this [Name] instance but with the **given fields
  /// replaced** with the new values.
  ///
  Name copyWith({
    final String? prefix,
    final String? firstName,
    final String? middleName,
    final String? lastName,
    final String? suffix,
    final String? phoneticFirst,
    final String? phoneticMiddle,
    final String? phoneticLast,
    final String? nickname,
    final String? fileAs,
  }) =>
      Name(
        prefix: prefix ?? this.prefix,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        suffix: suffix ?? this.suffix,
        phoneticFirst: phoneticFirst ?? this.phoneticFirst,
        phoneticMiddle: phoneticMiddle ?? this.phoneticMiddle,
        phoneticLast: phoneticLast ?? this.phoneticLast,
        nickname: nickname ?? this.nickname,
        fileAs: fileAs ?? this.fileAs,
      );

  /// Creates a **JSON string representing** this [Name] instance.
  ///
  /// The resulting JSON string can be parsed back using [Name.fromJson].
  ///
  String toJson() => jsonEncode(toMap());

  /// Creates a **[Map<String, dynamic>] representing** this [Name] instance.
  ///
  /// The resulting map can be parsed back using [Name.fromMap].
  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
        _prefixKey: prefix,
        _firstNameKey: firstName,
        _middleNameKey: middleName,
        _lastNameKey: lastName,
        _suffixKey: suffix,
        _phoneticFirstKey: phoneticFirst,
        _phoneticMiddleKey: phoneticMiddle,
        _phoneticLastKey: phoneticLast,
        _nicknameKey: nickname,
        _fileAsKey: fileAs,
      };

  @override
  int get hashCode => Object.hashAll(<String?>[
        prefix,
        firstName,
        middleName,
        lastName,
        suffix,
        phoneticFirst,
        phoneticMiddle,
        phoneticLast,
        nickname,
        fileAs,
      ]);

  @override
  String toString() => 'Name(prefix: $prefix, firstName: $firstName,'
      ' middleName: $middleName, lastName: $lastName, suffix: $suffix,'
      ' phoneticFirst: $phoneticFirst, phoneticMiddle: $phoneticMiddle,'
      ' phoneticLast: $phoneticLast, nickname: $nickname, fileAs: $fileAs)';

  @override
  bool operator ==(covariant final Name other) {
    if (identical(this, other)) return true;

    return other.prefix == prefix &&
        other.firstName == firstName &&
        other.middleName == middleName &&
        other.lastName == lastName &&
        other.suffix == suffix &&
        other.phoneticFirst == phoneticFirst &&
        other.phoneticMiddle == phoneticMiddle &&
        other.phoneticLast == phoneticLast &&
        other.nickname == nickname &&
        other.fileAs == fileAs;
  }
}
