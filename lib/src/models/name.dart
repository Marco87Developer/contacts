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
/// {@template contacts.name.oncecreatednopropertiesmaybechanged}
/// Once created, no properties of an [Name] object may be changed.
/// {@endtemplate}
///
@immutable
class Name {
  /// Constructs a [Name] instance.
  ///
  /// {@macro contacts.name.oncecreatednopropertiesmaybechanged}
  ///
  const Name({
    this.fileAs,
    this.firstName,
    this.lastName,
    this.middleName,
    this.nickname,
    this.phoneticFirst,
    this.phoneticLast,
    this.phoneticMiddle,
    this.prefix,
    this.suffix,
  });

  /// Constructs a [Name] instance **from a [json] string**.
  ///
  /// {@macro contacts.name.oncecreatednopropertiesmaybechanged}
  ///
  factory Name.fromJson(final String json) =>
      Name.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs a [Name] instance **from a [map]**.
  ///
  /// {@macro contacts.name.oncecreatednopropertiesmaybechanged}
  ///
  Name.fromMap(final Map<String, dynamic> map)
      : fileAs = map[_fileAsKey] == null ? null : '${map[_fileAsKey]}',
        firstName = map[_firstNameKey] == null ? null : '${map[_firstNameKey]}',
        lastName = map[_lastNameKey] == null ? null : '${map[_lastNameKey]}',
        middleName =
            map[_middleNameKey] == null ? null : '${map[_middleNameKey]}',
        nickname = map[_nicknameKey] == null ? null : '${map[_nicknameKey]}',
        phoneticFirst =
            map[_phoneticFirstKey] == null ? null : '${map[_phoneticFirstKey]}',
        phoneticLast =
            map[_phoneticLastKey] == null ? null : '${map[_phoneticLastKey]}',
        phoneticMiddle = map[_phoneticMiddleKey] == null
            ? null
            : '${map[_phoneticMiddleKey]}',
        prefix = map[_prefixKey] == null ? null : '${map[_prefixKey]}',
        suffix = map[_suffixKey] == null ? null : '${map[_suffixKey]}';

  /// File as.
  final String? fileAs;

  /// The first name.
  final String? firstName;

  /// The last name (or the last names).
  final String? lastName;

  /// The middle name.
  final String? middleName;

  /// The nickname.
  final String? nickname;

  /// The phonetic first.
  final String? phoneticFirst;

  /// The phonetic last.
  final String? phoneticLast;

  /// The phonetic middle.
  final String? phoneticMiddle;

  /// The prefix that goes before the name.
  final String? prefix;

  /// The suffix following the name.
  final String? suffix;

  /// Creates a **copy** of this [Name] instance but with the **given fields
  /// replaced** with the new values.
  ///
  Name copyWith({
    final String? fileAs,
    final String? firstName,
    final String? lastName,
    final String? middleName,
    final String? nickname,
    final String? phoneticFirst,
    final String? phoneticLast,
    final String? phoneticMiddle,
    final String? prefix,
    final String? suffix,
  }) =>
      Name(
        fileAs: fileAs ?? this.fileAs,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        middleName: middleName ?? this.middleName,
        nickname: nickname ?? this.nickname,
        phoneticFirst: phoneticFirst ?? this.phoneticFirst,
        phoneticLast: phoneticLast ?? this.phoneticLast,
        phoneticMiddle: phoneticMiddle ?? this.phoneticMiddle,
        prefix: prefix ?? this.prefix,
        suffix: suffix ?? this.suffix,
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

  @override
  int get hashCode => Object.hashAll([
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
      ]);

  @override
  String toString() => 'Name(fileAs: $fileAs, firstName: $firstName, lastName:'
      ' $lastName, middleName: $middleName, nickname: $nickname, phoneticFirst:'
      ' $phoneticFirst, phoneticLast: $phoneticLast, phoneticMiddle:'
      ' $phoneticMiddle, prefix: $prefix, suffix: $suffix)';

  @override
  bool operator ==(covariant final Name other) {
    if (identical(this, other)) return true;

    return other.fileAs == fileAs &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.middleName == middleName &&
        other.nickname == nickname &&
        other.phoneticFirst == phoneticFirst &&
        other.phoneticLast == phoneticLast &&
        other.phoneticMiddle == phoneticMiddle &&
        other.prefix == prefix &&
        other.suffix == suffix;
  }
}
