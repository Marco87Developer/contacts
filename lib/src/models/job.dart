import 'package:flutter/material.dart';

const _companyKey = 'company';
const _departmentKey = 'department';
const _jobTitleKey = 'jobTitle';

/// This class models a reference to a job.
///
@immutable
class Job implements Comparable {
  /// A reference to a job.
  ///
  /// It **requires** this field: `String` [company].
  ///
  /// Also, it has *optional* fields: `String` [department] and `String`
  /// [jobTitle].
  ///
  const Job({
    required this.company,
    this.department = '',
    this.jobTitle = '',
  });

  /// Creates a `Job` instance starting from a `Map<String, dynamic> map`.
  ///
  /// This can be useful for retrieving the instance in a database.
  ///
  Job.fromMap(Map<String, dynamic> map)
      : company = map[_companyKey],
        department = map[_departmentKey],
        jobTitle = map[_jobTitleKey];

  /// The company where or for which this job takes place.
  final String company;

  /// The department where this job takes place.
  final String department;

  /// The title of this job.
  final String jobTitle;

  /// Creates a `Map<String, dynamic> map` representation of this instance.
  ///
  /// This can be useful for saving the instance in a database.
  ///
  Map<String, dynamic> toMap() => {
        _companyKey: company,
        _departmentKey: department,
        _jobTitleKey: jobTitle,
      };

  /// The order of the comparisons is:
  ///
  /// 1. [company]
  /// 2. [department]
  /// 3. [jobTitle]
  ///
  @override
  int compareTo(covariant Job other) {
    // 1º comparison
    final int comparison1 = company.compareTo(other.company);
    if (comparison1 != 0) return comparison1;

    // 2º comparison
    final int comparison2 = department.compareTo(other.department);
    if (comparison2 != 0) return comparison2;

    // Last comparison
    final int comparison3 = jobTitle.compareTo(other.jobTitle);
    return comparison3;
  }

  @override
  int get hashCode => hashValues(company, department, jobTitle);

  /// Returns if this instance is less than the [other].
  ///
  bool operator <(covariant Job other) => compareTo(other) < 0;

  /// Return if this instance is less than or equal to the [other].
  ///
  bool operator <=(covariant Job other) => compareTo(other) <= 0;

  @override
  bool operator ==(covariant Job other) => compareTo(other) == 0;

  /// Return if this instance is greater than or equal to the [other].
  ///
  bool operator >=(covariant Job other) => compareTo(other) >= 0;

  /// Return if this instance is greater than the [other].
  ///
  bool operator >(covariant Job other) => compareTo(other) > 0;
}
