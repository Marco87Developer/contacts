import 'package:contacts/src/models/internet_call.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('InternetCall.fromMap()', () {
    final Map<String, dynamic> map = <String, dynamic>{
      'internetCall': 'Name',
      'label': 'Label',
    };

    expect(
      InternetCall.fromMap(map),
      const InternetCall(internetCall: 'Name', label: 'Label'),
    );
  });

  test('toMap()', () {
    const InternetCall internetCall =
        InternetCall(internetCall: 'Name', label: 'Label');

    expect(
      internetCall.toMap(),
      {'internetCall': 'Name', 'label': 'Label'},
    );
  });

  test('compareTo()', () {
    const InternetCall internetCall1 =
        InternetCall(internetCall: 'Name1', label: 'Label1');
    const InternetCall internetCall2 =
        InternetCall(internetCall: 'Name2', label: 'Label2');

    expect(internetCall1.compareTo(internetCall2), -1);
    expect(internetCall1.compareTo(internetCall1), 0);
    expect(internetCall2.compareTo(internetCall1), 1);
    expect(internetCall1 < internetCall2, true);
    expect(internetCall1 <= internetCall2, true);
    expect(internetCall1 == internetCall1, true);
    expect(internetCall1 == internetCall2, false);
    expect(internetCall1 > internetCall2, false);
    expect(internetCall1 >= internetCall2, false);
  });
}
