import 'package:contacts/src/models/email.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Email.fromMap()', () {
    final Map<String, dynamic> map = <String, dynamic>{
      'address': 'Address',
      'label': 'Label',
    };

    expect(
      Email.fromMap(map),
      const Email(address: 'Address', label: 'Label'),
    );
  });

  test('toMap()', () {
    const Email email = Email(address: 'Address', label: 'Label');

    expect(
      email.toMap(),
      {'address': 'Address', 'label': 'Label'},
    );
  });

  test('compareTo()', () {
    const Email email1 = Email(address: 'Address 1', label: 'Label1');
    const Email email2 = Email(address: 'Address 2', label: 'Label2');

    expect(email1.compareTo(email2), -1);
    expect(email1.compareTo(email1), 0);
    expect(email2.compareTo(email1), 1);
    expect(email1 < email2, true);
    expect(email1 <= email2, true);
    expect(email1 == email1, true);
    expect(email1 == email2, false);
    expect(email1 >= email2, false);
    expect(email1 > email2, false);
  });
}
