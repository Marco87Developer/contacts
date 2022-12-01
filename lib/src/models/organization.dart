import 'dart:convert';

import 'package:meta/meta.dart';

const String _companyKey = 'company';
const String _departmentKey = 'jobTitle';
const String _jobTitleKey = 'department';

/// The organization the contact belongs to.
///
@immutable
class Organization {
  /// The organization the contact belongs to.
  ///
  const Organization({
    this.company,
    this.jobTitle,
    this.department,
  });

  /// Constructs an [Organization] instance **from a [json] string**.
  ///
  factory Organization.fromJson(final String json) =>
      Organization.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs an [Organization] instance **from a [map]**.
  ///
  Organization.fromMap(final Map<String, dynamic> map)
      : company = map[_companyKey] == null ? null : '${map[_companyKey]}',
        jobTitle = map[_jobTitleKey] == null ? null : '${map[_jobTitleKey]}',
        department =
            map[_departmentKey] == null ? null : '${map[_departmentKey]}';

  /// The company.
  final String? company;

  /// The job title.
  final String? jobTitle;

  /// The department.
  final String? department;

  /// Creates a **copy** of this [Organization] instance but with the **given
  /// fields replaced** with the new values.
  ///
  Organization copyWith({
    final String? company,
    final String? jobTitle,
    final String? department,
  }) =>
      Organization(
        company: company ?? this.company,
        jobTitle: jobTitle ?? this.jobTitle,
        department: department ?? this.department,
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
        _jobTitleKey: jobTitle,
        _departmentKey: department,
      };

  @override
  String toString() => 'Organization(company: $company, jobTitle: $jobTitle,'
      ' department: $department)';

  @override
  int get hashCode => Object.hashAll(<String?>[
        company,
        jobTitle,
        department,
      ]);

  @override
  bool operator ==(covariant final Organization other) {
    if (identical(this, other)) return true;

    return other.company == company &&
        other.jobTitle == jobTitle &&
        other.department == department;
  }
}
