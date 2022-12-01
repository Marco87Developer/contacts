import 'package:contacts/src/models/address.dart';
import 'package:geos/geos.dart';
import 'package:test/test.dart';

void main() {
  group('The transitive and the symmetric property:', () {
    test(
      'The transitive property: if [b] = [a] and [c] = [b], then [c] = [a].',
      () {
        const a = Address(
          countryRegion: Country.italy,
          city: 'city',
          label: 'label',
          poBox: 'pobox',
          postalCode: 'postalcode',
          provinceDepartment: 'provincedepartment',
          streetAddress: 'streetaddress',
          streetAddressLine2: 'streetaddressline2',
        );
        const b = a;
        const c = b;
        expect(c, a);
      },
    );
    test(
      'The symmetric property: if [a] = [b], then [b] = [a].',
      () {
        const a = Address(
          countryRegion: Country.italy,
          city: 'city',
          label: 'label',
          poBox: 'pobox',
          postalCode: 'postalcode',
          provinceDepartment: 'provincedepartment',
          streetAddress: 'streetaddress',
          streetAddressLine2: 'streetaddressline2',
        );
        const b = Address(
          countryRegion: Country.italy,
          city: 'city',
          label: 'label',
          poBox: 'pobox',
          postalCode: 'postalcode',
          provinceDepartment: 'provincedepartment',
          streetAddress: 'streetaddress',
          streetAddressLine2: 'streetaddressline2',
        );
        expect(a, b);
        expect(b, a);
      },
    );
  });
}
