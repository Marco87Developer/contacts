import 'package:contacts/src/models/phone.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Phone.fromMap()', () {
    final Map<String, dynamic> map = {
      'countryCode': '39',
      'label': 'Personal',
      'local': '0123456789',
    };

    expect(
      Phone.fromMap(map),
      Phone(countryCode: '39', label: 'Personal', local: '0123456789'),
    );
  });

  test('toMap()', () {
    final Phone phone =
        Phone(countryCode: '39', label: 'Personal', local: '0123456789');

    expect(
      phone.toMap(),
      {'countryCode': '39', 'label': 'Personal', 'local': '0123456789'},
    );
  });

  test('compareTo()', () {
    final Phone phone1 =
        Phone(countryCode: '39', label: 'Personal', local: '0123456770');
    final Phone phone2 =
        Phone(countryCode: '39', label: 'Personal', local: '0123456789');
    final Phone phone3 =
        Phone(countryCode: '39', label: 'Personal2', local: '0123456789');
    final Phone phone4 =
        Phone(countryCode: '1', label: 'Personal', local: '0123456789');

    expect(phone1.compareTo(phone2), -1);
    expect(phone1.compareTo(phone1), 0);
    expect(phone2.compareTo(phone1), 1);
    expect(phone1.compareTo(phone3), -1);
    expect(phone1.compareTo(phone4), 1);
    expect(phone1 < phone2, true);
    expect(phone1 <= phone2, true);
    expect(phone1 == phone1, true);
    expect(phone1 == phone2, false);
    expect(phone1 > phone2, false);
    expect(phone1 >= phone2, false);
  });

  test('call()', () {
    final Phone phone =
        Phone(countryCode: '39', label: 'Personal', local: '0123456770');

    // TODO: do some test.
  });

  test('number', () {
    final Phone phone =
        Phone(countryCode: '39', label: 'Personal', local: '0123456770');

    expect(phone.number, '+39 0123456770');
  });

  test('toString()', () {
    final Phone phone =
        Phone(countryCode: '39', label: 'Personal', local: '0123456770');

    expect('$phone', '(Personal)+39 0123456770');
  });
}
