import 'package:contacts/src/models/address.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Address.fromMap()', () {
    final Map<String, dynamic> map = <String, dynamic>{
      'city': 'City',
      'countryRegion': 'CountryRegion',
      'label': 'Label',
      'postalCode': 'PostalCode',
      'postOfficeBox': 'PostOfficeBox',
      'province': 'Province',
      'street': 'Street',
    };
    final Map<String, dynamic> mapWithEmptyPostOfficeBox = <String, dynamic>{
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
      const Address(
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
      const Address(
        city: 'City',
        countryRegion: 'CountryRegion',
        label: 'Label',
        postalCode: 'PostalCode',
        province: 'Province',
        street: 'Street',
      ),
    );
  });

  test('toMap()', () {
    const Address address = Address(
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
    const Address address1 = Address(
      city: 'City1',
      countryRegion: 'CountryRegion1',
      label: 'Label1',
      postalCode: 'PostalCode1',
      postOfficeBox: 'PostOfficeBox1',
      province: 'Province1',
      street: 'Street1',
    );
    const Address address2 = Address(
      city: 'City2',
      countryRegion: 'CountryRegion2',
      label: 'Label2',
      postalCode: 'PostalCode2',
      postOfficeBox: 'PostOfficeBox2',
      province: 'Province2',
      street: 'Street2',
    );
    const Address address3 = Address(
      city: 'City1',
      countryRegion: 'CountryRegion1',
      label: 'Label1',
      postalCode: 'PostalCode1',
      postOfficeBox: 'PostOfficeBox1',
      province: 'Province1',
      street: 'Street1',
    );
    const Address address4 = Address(
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
