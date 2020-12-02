import 'package:flutter/material.dart';

const _companyKey = 'company';
const _departmentKey = 'department';
const _jobTitleKey = 'jobTitle';

/// This class models a reference to a job.
///
/// It **requires** this field: `String` [company].
///
/// Also, it has *optional* fields: `String` [department] and `String`
/// [jobTitle].
///
class Job implements Comparable {
  const Job({
    required this.company,
    this.department = '',
    this.jobTitle = '',
  });

  final String company;
  final String department;
  final String jobTitle;

  Job.fromMap(Map<String, dynamic> map)
      : company = map[_companyKey],
        department = map[_departmentKey],
        jobTitle = map[_jobTitleKey];

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
    int comparison1 = company.compareTo(other.company);
    if (comparison1 != 0) return comparison1;

    // 2º comparison
    int comparison2 = department.compareTo(other.department);
    if (comparison2 != 0) return comparison2;

    // Last comparison
    int comparison3 = jobTitle.compareTo(other.jobTitle);
    return comparison3;
  }

  @override
  int get hashCode => hashValues(company, department, jobTitle);

  bool operator <(covariant Job other) => compareTo(other) < 0;

  bool operator <=(covariant Job other) => compareTo(other) <= 0;

  bool operator ==(covariant Job other) => compareTo(other) == 0;

  bool operator >=(covariant Job other) => compareTo(other) >= 0;

  bool operator >(covariant Job other) => compareTo(other) > 0;
}
