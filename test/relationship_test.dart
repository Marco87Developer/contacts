import 'package:contacts/src/models/relationship.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Relationship.fromMap()', () {
    final Map<String, dynamic> map = <String, dynamic>{
      'label': 'Friend',
      'name': 'Name',
    };

    expect(
      Relationship.fromMap(map),
      const Relationship(label: 'Friend', name: 'Name'),
    );
  });

  test('toMap()', () {
    const Relationship relationship =
        Relationship(label: 'Friend', name: 'Name');

    expect(
      relationship.toMap(),
      {'label': 'Friend', 'name': 'Name'},
    );
  });

  test('compareTo()', () {
    const Relationship relationship1 =
        Relationship(label: 'Friend', name: 'Name1');
    const Relationship relationship2 =
        Relationship(label: 'Friend', name: 'Name2');
    const Relationship relationship3 =
        Relationship(label: 'Friend3', name: 'Name1');

    expect(relationship1.compareTo(relationship2), -1);
    expect(relationship1.compareTo(relationship1), 0);
    expect(relationship2.compareTo(relationship1), 1);
    expect(relationship1.compareTo(relationship3), -1);
    expect(relationship2.compareTo(relationship3), 1);
    expect(relationship1 < relationship2, true);
    expect(relationship1 <= relationship2, true);
    expect(relationship1 == relationship1, true);
    expect(relationship1 == relationship2, false);
    expect(relationship1 > relationship2, false);
    expect(relationship1 >= relationship2, false);
  });
}
