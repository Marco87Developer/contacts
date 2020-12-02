import 'package:contacts/src/models/job.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Job.fromMap()', () {
    Map<String, dynamic> map = {
      'company': 'Company',
      'department': 'Department',
      'jobTitle': 'Job title',
    };
    Map<String, dynamic> map2 = {
      'company': 'Company',
      'department': '',
      'jobTitle': '',
    };

    expect(
      Job.fromMap(map),
      Job(company: 'Company', department: 'Department', jobTitle: 'Job title'),
    );
    expect(
      Job.fromMap(map2),
      Job(company: 'Company', department: '', jobTitle: ''),
    );
  });

  test('toMap()', () {
    Job job = Job(
        company: 'Company', department: 'Department', jobTitle: 'Job title');
    Job job2 = Job(company: 'Company');

    expect(
      job.toMap(),
      {
        'company': 'Company',
        'department': 'Department',
        'jobTitle': 'Job title',
      },
    );
    expect(
      job2.toMap(),
      {
        'company': 'Company',
        'department': '',
        'jobTitle': '',
      },
    );
  });

  test('compareTo()', () {
    Job job1 = Job(
        company: 'Company', department: 'Department', jobTitle: 'Job title');
    Job job2 = Job(company: 'Company');

    expect(job1.compareTo(job2), 1);
    expect(job1.compareTo(job1), 0);
    expect(job2.compareTo(job1), -1);
    expect(job1 < job2, false);
    expect(job1 <= job2, false);
    expect(job1 == job1, true);
    expect(job1 == job2, false);
    expect(job1 >= job2, true);
    expect(job1 > job2, true);
  });
}
