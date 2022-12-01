import 'dart:convert';

import 'package:meta/meta.dart';

const String _companyKey = 'company';
const String _departmentKey = 'department';
const String _jobTitleKey = 'jobTitle';

/// The organization the contact belongs to.
///
/// {@template contacts.organization.oncecreatednopropertiesmaybechanged}
/// Once created, no properties of an [Organization] object may be changed.
/// {@endtemplate}
///
@immutable
class Organization {
  /// Constructs an [Organization] instance
  ///
  /// {@macro contacts.organization.oncecreatednopropertiesmaybechanged}
  ///
  const Organization({
    this.company,
    this.department,
    this.jobTitle,
  });

  /// Constructs an [Organization] instance **from a [json] string**.
  ///
  /// {@macro contacts.organization.oncecreatednopropertiesmaybechanged}
  ///
  factory Organization.fromJson(final String json) =>
      Organization.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs an [Organization] instance **from a [map]**.
  ///
  /// {@macro contacts.organization.oncecreatednopropertiesmaybechanged}
  ///
  Organization.fromMap(final Map<String, dynamic> map)
      : company = map[_companyKey] == null ? null : '${map[_companyKey]}',
        department =
            map[_departmentKey] == null ? null : '${map[_departmentKey]}',
        jobTitle = map[_jobTitleKey] == null ? null : '${map[_jobTitleKey]}';

  /// The company.
  final String? company;

  /// The department.
  final String? department;

  /// The job title.
  final String? jobTitle;

  /// Creates a **copy** of this [Organization] instance but with the **given
  /// fields replaced** with the new values.
  ///
  Organization copyWith({
    final String? company,
    final String? department,
    final String? jobTitle,
  }) =>
      Organization(
        company: company ?? this.company,
        department: department ?? this.department,
        jobTitle: jobTitle ?? this.jobTitle,
      );

  /// Creates a **JSON string representing** this [Organization] instance.
  ///
  /// The resulting JSON string can be parsed back using
  /// [Organization.fromJson].
  ///
  String toJson() => jsonEncode(toMap());

  /// Creates a **[Map<String, dynamic>] representing** this [Organization]
  /// instance.
  ///
  /// The resulting map can be parsed back using [Organization.fromMap].
  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
        _companyKey: company,
        _departmentKey: department,
        _jobTitleKey: jobTitle,
      };

  @override
  int get hashCode => Object.hashAll([
        company,
        department,
        jobTitle,
      ]);

  @override
  String toString() => 'Organization(company: $company, department:'
      ' $department, jobTitle: $jobTitle)';

  @override
  bool operator ==(covariant final Organization other) {
    if (identical(this, other)) return true;

    return other.company == company &&
        other.department == department &&
        other.jobTitle == jobTitle;
  }
}
