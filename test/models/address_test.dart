import 'dart:io';

import 'package:contacts/src/models/address.dart';
import 'package:geos/geos.dart';
import 'package:test/test.dart';

void main() {
  group('The transitive and the symmetric property:', () {
    test(
      'The transitive property: if [b] = [a] and [c] = [b], then [c] = [a].',
      () {
        const a = Address(
          city: 'city',
          countryRegion: Country.italy,
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
          city: 'city',
          countryRegion: Country.italy,
          label: 'label',
          poBox: 'pobox',
          postalCode: 'postalcode',
          provinceDepartment: 'provincedepartment',
          streetAddress: 'streetaddress',
          streetAddressLine2: 'streetaddressline2',
        );
        const b = Address(
          city: 'city',
          countryRegion: Country.italy,
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

  group('factory Address.fromJson', () {
    test(
        'If the JSON string is a valid representation of an [Address], must'
        ' construct an [Address] instance.', () async {
      final file = File('test/models/address_test.json');
      final json = await file.readAsString();
      expect(
        Address.fromJson(json),
        const Address(
          city: 'city',
          countryRegion: Country.italy,
          label: 'label',
          poBox: 'pobox',
          postalCode: 'postalcode',
          provinceDepartment: 'provincedepartment',
          streetAddress: 'streetaddress',
          streetAddressLine2: 'streetaddressline2',
        ),
        reason: 'The JSON string is a valid representation of an [Address]'
            ' instance.',
      );
    });
    test(
        'If the JSON string is not a valid representation of a [Address], this'
        ' constructor must throw a [FormatException].', () async {
      final file1 = File('test/models/address_not_valid_1_test.json');
      final json1 = await file1.readAsString();
      expect(
        () => Address.fromJson(json1),
        throwsFormatException,
        reason: 'Parameter "countryRegion" is not a valid and unique'
            ' representation of a [Country] instance.',
      );
      final file2 = File('test/models/address_not_valid_2_test.json');
      final json2 = await file2.readAsString();
      expect(
        () => Address.fromJson(json2),
        throwsFormatException,
        reason: 'The JSON file contains only an empty object.',
      );
    });
  });

  group('Address.fromMap', () {
    test(
        'If the map is a valid representation of a [Address] instance, this'
        ' constructor must create that instance.', () {
      final Map<String, dynamic> map = {
        'city': 'city',
        'countryRegion': 'Italy',
        'label': 'label',
        'poBox': 'poBox',
        'postalCode': 'postalCode',
        'provinceDepartment': 'provinceDepartment',
        'streetAddress': 'streetAddress',
        'streetAddressLine2': 'streetAddressLine2',
      };
      expect(
        Address.fromMap(map),
        const Address(
          city: 'city',
          countryRegion: Country.italy,
          label: 'label',
          poBox: 'poBox',
          postalCode: 'postalCode',
          provinceDepartment: 'provinceDepartment',
          streetAddress: 'streetAddress',
          streetAddressLine2: 'streetAddressLine2',
        ),
      );
    });
    test(
        'If the map is not a valid representation of a [Address] instance,'
        ' this constructor must throw an [Error].', () {
      final Map<String, dynamic> invalidMap = {
        'city': 'city',
        'label': 'label',
        'poBox': 'poBox',
        'postalCode': 'postalCode',
        'provinceDepartment': 'provinceDepartment',
        'streetAddress': 'streetAddress',
        'streetAddressLine2': 'streetAddressLine2',
      };
      expect(
        () => Address.fromMap(invalidMap),
        throwsFormatException,
        reason: '[invalidMap] does not contain "countryRegion" key.',
      );
    });
  });

  group('copyWith', () {
    const Address address = Address(
      city: 'city',
      countryRegion: Country.italy,
      label: 'label',
      poBox: 'poBox',
      postalCode: 'postalCode',
      provinceDepartment: 'provinceDepartment',
      streetAddress: 'streetAddress',
      streetAddressLine2: 'streetAddressLine2',
    );
    test('This method must copy all parameters and update the ones provided.',
        () {
      expect(
        address.copyWith(),
        address,
        reason: 'Without any parameters passed to [copyWith], it must return'
            ' the original [address].',
      );
      expect(
        address.copyWith(countryRegion: Country.colombia),
        const Address(
          city: 'city',
          countryRegion: Country.colombia,
          label: 'label',
          poBox: 'poBox',
          postalCode: 'postalCode',
          provinceDepartment: 'provinceDepartment',
          streetAddress: 'streetAddress',
          streetAddressLine2: 'streetAddressLine2',
        ),
        reason: 'The only parameter that has to change is "countryRegion".',
      );
      expect(
        address.copyWith(city: 'other'),
        const Address(
          city: 'other',
          countryRegion: Country.italy,
          label: 'label',
          poBox: 'poBox',
          postalCode: 'postalCode',
          provinceDepartment: 'provinceDepartment',
          streetAddress: 'streetAddress',
          streetAddressLine2: 'streetAddressLine2',
        ),
        reason: 'The only parameter that has to change is "city".',
      );
      expect(
        address.copyWith(label: 'other'),
        const Address(
          city: 'city',
          countryRegion: Country.italy,
          label: 'other',
          poBox: 'poBox',
          postalCode: 'postalCode',
          provinceDepartment: 'provinceDepartment',
          streetAddress: 'streetAddress',
          streetAddressLine2: 'streetAddressLine2',
        ),
        reason: 'The only parameter that has to change is "label".',
      );
      expect(
        address.copyWith(poBox: 'other'),
        const Address(
          city: 'city',
          countryRegion: Country.italy,
          label: 'label',
          poBox: 'other',
          postalCode: 'postalCode',
          provinceDepartment: 'provinceDepartment',
          streetAddress: 'streetAddress',
          streetAddressLine2: 'streetAddressLine2',
        ),
        reason: 'The only parameter that has to change is "poBox".',
      );
      expect(
        address.copyWith(postalCode: 'other'),
        const Address(
          city: 'city',
          countryRegion: Country.italy,
          label: 'label',
          poBox: 'poBox',
          postalCode: 'other',
          provinceDepartment: 'provinceDepartment',
          streetAddress: 'streetAddress',
          streetAddressLine2: 'streetAddressLine2',
        ),
        reason: 'The only parameter that has to change is "postalCode".',
      );
      expect(
        address.copyWith(provinceDepartment: 'other'),
        const Address(
          city: 'city',
          countryRegion: Country.italy,
          label: 'label',
          poBox: 'poBox',
          postalCode: 'postalCode',
          provinceDepartment: 'other',
          streetAddress: 'streetAddress',
          streetAddressLine2: 'streetAddressLine2',
        ),
        reason:
            'The only parameter that has to change is "provinceDepartment".',
      );
      expect(
        address.copyWith(streetAddress: 'other'),
        const Address(
          city: 'city',
          countryRegion: Country.italy,
          label: 'label',
          poBox: 'poBox',
          postalCode: 'postalCode',
          provinceDepartment: 'provinceDepartment',
          streetAddress: 'other',
          streetAddressLine2: 'streetAddressLine2',
        ),
        reason: 'The only parameter that has to change is "streetAddress".',
      );
      expect(
        address.copyWith(streetAddressLine2: 'other'),
        const Address(
          city: 'city',
          countryRegion: Country.italy,
          label: 'label',
          poBox: 'poBox',
          postalCode: 'postalCode',
          provinceDepartment: 'provinceDepartment',
          streetAddress: 'streetAddress',
          streetAddressLine2: 'other',
        ),
        reason:
            'The only parameter that has to change is "streetAddressLine2".',
      );
    });
  });

  group('toJson', () {
    test('This method must return the corresponding JSON string.', () {
      expect(
        const Address(
          city: 'city',
          countryRegion: Country.italy,
          label: 'label',
          poBox: 'pobox',
          postalCode: 'postalcode',
          provinceDepartment: 'provincedepartment',
          streetAddress: 'streetaddress',
          streetAddressLine2: 'streetaddressline2',
        ).toJson(),
        '{"city":"city","countryRegion":"Italy","label":"label","poBox":"pobox"'
        ',"postalCode":"postalcode","provinceDepartment":"provincedepartment",'
        '"streetAddress":"streetaddress","streetAddressLine2":'
        '"streetaddressline2"}',
        reason: 'No parameter is null.',
      );
      expect(
        const Address(
          countryRegion: Country.italy,
        ).toJson(),
        '{"city":null,"countryRegion":"Italy","label":null,"poBox":null,'
        '"postalCode":null,"provinceDepartment":null,"streetAddress":null,'
        '"streetAddressLine2":null}',
        reason: 'Only "countryRegion" parameter is not null.',
      );
    });
  });

  group('toMap', () {});
}
