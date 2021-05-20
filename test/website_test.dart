import 'package:contacts/src/models/website.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Website.fromMap()', () {
    final Map<String, dynamic> map = <String, dynamic>{
      'label': 'Label',
      'url': 'url.com',
    };

    expect(
      Website.fromMap(map),
      const Website(label: 'Label', url: 'url.com'),
    );
  });

  test('toMap()', () {
    const Website website = Website(label: 'Label', url: 'url.com');

    expect(
      website.toMap(),
      {'label': 'Label', 'url': 'url.com'},
    );
  });

  test('compareTo()', () {
    const Website website1 = Website(label: 'Label1', url: 'url1.com');
    const Website website2 = Website(label: 'Label2', url: 'url2.com');
    const Website website3 = Website(label: 'Label1', url: 'url2.com');

    expect(website1.compareTo(website2), -1);
    expect(website1.compareTo(website1), 0);
    expect(website2.compareTo(website1), 1);
    expect(website1.compareTo(website3), -1);
    expect(website2.compareTo(website3), 1);
    expect(website1 < website2, true);
    expect(website1 <= website2, true);
    expect(website1 == website1, true);
    expect(website1 == website2, false);
    expect(website1 > website2, false);
    expect(website1 >= website2, false);
  });
}
