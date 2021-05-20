import 'package:contacts/src/models/custom_field.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CustomField.fromMap()', () {
    final Map<String, dynamic> map = <String, dynamic>{
      'content': 'A simple content.',
      'label': 'Label',
    };

    expect(
      CustomField.fromMap(map),
      const CustomField(
        content: 'A simple content.',
        label: 'Label',
      ),
    );
  });

  test('toMap()', () {
    const CustomField customField = CustomField(
      content: 'A simple content.',
      label: 'Label',
    );

    expect(customField.toMap(), {
      'content': 'A simple content.',
      'label': 'Label',
    });
  });

  test('compareTo()', () {
    const CustomField customField1 = CustomField(
      content: 'Content 1.',
      label: 'Label1',
    );
    const CustomField customField2 = CustomField(
      content: 'Content 2.',
      label: 'Label2',
    );

    expect(customField1.compareTo(customField2), -1);
    expect(customField1.compareTo(customField1), 0);
    expect(customField2.compareTo(customField1), 1);
    expect(customField1 < customField2, true);
    expect(customField1 <= customField2, true);
    expect(customField1 == customField1, true);
    expect(customField1 == customField2, false);
    expect(customField1 >= customField2, false);
    expect(customField1 > customField2, false);
  });
}
