import 'package:contacts/src/models/address.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Address.fromMap()', () {
    final Map<String, dynamic> map = {
      'city': 'City',
      'countryRegion': 'CountryRegion',
      'label': 'Label',
      'postalCode': 'PostalCode',
      'postOfficeBox': 'PostOfficeBox',
      'province': 'Province',
      'street': 'Street',
    };
    final Map<String, dynamic> mapWithEmptyPostOfficeBox = {
      'city': 'City',
      'countryRegion': 'CountryRegion',
      'label': 'Label',
      'postalCode': 'PostalCode',
      'postOfficeBox': '',
      'province': 'Province',
      'street': 'Street',
    };

    expect(
      Address.fromMap(map),
      Address(
        city: 'City',
        countryRegion: 'CountryRegion',
        label: 'Label',
        postalCode: 'PostalCode',
        postOfficeBox: 'PostOfficeBox',
        province: 'Province',
        street: 'Street',
      ),
    );
    expect(
      Address.fromMap(mapWithEmptyPostOfficeBox),
      Address(
        city: 'City',
        countryRegion: 'CountryRegion',
        label: 'Label',
        postalCode: 'PostalCode',
        postOfficeBox: '',
        province: 'Province',
        street: 'Street',
      ),
    );
  });

  test('toMap()', () {
    final Address address = Address(
      city: 'City',
      countryRegion: 'CountryRegion',
      label: 'Label',
      postalCode: 'PostalCode',
      postOfficeBox: 'PostOfficeBox',
      province: 'Province',
      street: 'Street',
    );

    expect(
      address.toMap(),
      {
        'city': 'City',
        'countryRegion': 'CountryRegion',
        'label': 'Label',
        'postalCode': 'PostalCode',
        'postOfficeBox': 'PostOfficeBox',
        'province': 'Province',
        'street': 'Street',
      },
    );
  });

  test('compareTo()', () {
    final Address address1 = Address(
      city: 'City1',
      countryRegion: 'CountryRegion1',
      label: 'Label1',
      postalCode: 'PostalCode1',
      postOfficeBox: 'PostOfficeBox1',
      province: 'Province1',
      street: 'Street1',
    );
    final Address address2 = Address(
      city: 'City2',
      countryRegion: 'CountryRegion2',
      label: 'Label2',
      postalCode: 'PostalCode2',
      postOfficeBox: 'PostOfficeBox2',
      province: 'Province2',
      street: 'Street2',
    );
    final Address address3 = Address(
      city: 'City1',
      countryRegion: 'CountryRegion1',
      label: 'Label1',
      postalCode: 'PostalCode1',
      postOfficeBox: 'PostOfficeBox1',
      province: 'Province1',
      street: 'Street1',
    );
    final Address address4 = Address(
      city: 'City1',
      countryRegion: 'CountryRegion4',
      label: 'Label1',
      postalCode: 'PostalCode1',
      postOfficeBox: 'PostOfficeBox1',
      province: 'Province1',
      street: 'Street1',
    );

    expect(address1.compareTo(address2), -1);
    expect(address1.compareTo(address3), 0);
    expect(address2.compareTo(address1), 1);
    expect(address1.compareTo(address4), -1);
    expect(address1 < address2, true);
    expect(address1 <= address2, true);
    expect(address1 == address2, false);
    expect(address1 >= address2, false);
    expect(address1 > address2, false);
  });
}
