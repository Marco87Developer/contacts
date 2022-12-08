import 'dart:io';

import 'package:contacts/src/models/address.dart';
import 'package:contacts/src/models/chat.dart';
import 'package:contacts/src/models/contact.dart';
import 'package:contacts/src/models/custom_field.dart';
import 'package:contacts/src/models/email.dart';
import 'package:contacts/src/models/event.dart';
import 'package:contacts/src/models/internet_call.dart';
import 'package:contacts/src/models/name.dart';
import 'package:contacts/src/models/organization.dart';
import 'package:contacts/src/models/phone.dart';
import 'package:contacts/src/models/related_person.dart';
import 'package:contacts/src/models/website.dart';
import 'package:geos/geos.dart';
import 'package:test/test.dart';

void main() {
  group('The transitive and the symmetric property:', () {
    test(
      'The transitive property: if [b] = [a] and [c] = [b], then [c] = [a].',
      () {
        final Contact a = Contact(
          addresses: const [
            Address(
              city: 'city1',
              countryRegion: Country.italy,
              label: 'label1',
              poBox: 'poBox1',
              postalCode: 'postalCode1',
              provinceDepartment: 'provinceDepartment1',
              streetAddress: 'streetAddress1',
              streetAddressLine2: 'streetAddressLine21',
            ),
            Address(
              city: 'city2',
              countryRegion: Country.colombia,
              label: 'label2',
              poBox: 'poBox2',
              postalCode: 'postalCode2',
              provinceDepartment: 'provinceDepartment2',
              streetAddress: 'streetAddress2',
              streetAddressLine2: 'streetAddressLine22',
            ),
          ],
          chats: const [
            Chat(
              chat: 'chat1',
              label: 'label1',
            ),
            Chat(
              chat: 'chat2',
              label: 'label2',
            ),
          ],
          customFields: const [
            CustomField(
              customField: 'customField1',
              label: 'label1',
            ),
            CustomField(
              customField: 'customField2',
              label: 'label2',
            ),
          ],
          emails: const [
            Email(
              email: 'email1',
              label: 'label1',
            ),
            Email(
              email: 'email2',
              label: 'label2',
            ),
          ],
          events: [
            Event(
              event: DateTime(2022),
              label: 'label1',
            ),
            Event(
              event: DateTime(2022, 7),
              label: 'label2',
            ),
          ],
          internetCalls: const [
            InternetCall(
              internetCall: 'internetCall1',
              label: 'label1',
            ),
            InternetCall(
              internetCall: 'internetCall2',
              label: 'label2',
            ),
          ],
          name: const Name(
            fileAs: 'fileAs',
            firstName: 'firstName',
            lastName: 'lastName',
            middleName: 'middleName',
            nickname: 'nickname',
            phoneticFirst: 'phoneticFirst',
            phoneticLast: 'phoneticLast',
            phoneticMiddle: 'phoneticMiddle',
            prefix: 'prefix',
            suffix: 'suffix',
          ),
          notes: 'notes',
          organization: const Organization(
            company: 'company',
            department: 'department',
            jobTitle: 'jobTitle',
          ),
          phones: const [
            Phone(
              phone: 'phone1',
              label: 'label1',
            ),
            Phone(
              phone: 'phone2',
              label: 'label2',
            ),
          ],
          relatedPeople: const [
            RelatedPerson(
              relatedPerson: 'relatedPerson1',
              label: 'label1',
            ),
            RelatedPerson(
              relatedPerson: 'relatedPerson2',
              label: 'label2',
            ),
          ],
          websites: const [
            Website(
              website: 'website1',
              label: 'label1',
            ),
            Website(
              website: 'website2',
              label: 'label2',
            ),
          ],
        );
        final Contact b = a;
        final Contact c = b;
        expect(c, a);
      },
    );
    test(
      'The symmetric property: if [a] = [b], then [b] = [a].',
      () {
        final Contact a = Contact(
          addresses: const [
            Address(
              city: 'city1',
              countryRegion: Country.italy,
              label: 'label1',
              poBox: 'poBox1',
              postalCode: 'postalCode1',
              provinceDepartment: 'provinceDepartment1',
              streetAddress: 'streetAddress1',
              streetAddressLine2: 'streetAddressLine21',
            ),
            Address(
              city: 'city2',
              countryRegion: Country.colombia,
              label: 'label2',
              poBox: 'poBox2',
              postalCode: 'postalCode2',
              provinceDepartment: 'provinceDepartment2',
              streetAddress: 'streetAddress2',
              streetAddressLine2: 'streetAddressLine22',
            ),
          ],
          chats: const [
            Chat(
              chat: 'chat1',
              label: 'label1',
            ),
            Chat(
              chat: 'chat2',
              label: 'label2',
            ),
          ],
          customFields: const [
            CustomField(
              customField: 'customField1',
              label: 'label1',
            ),
            CustomField(
              customField: 'customField2',
              label: 'label2',
            ),
          ],
          emails: const [
            Email(
              email: 'email1',
              label: 'label1',
            ),
            Email(
              email: 'email2',
              label: 'label2',
            ),
          ],
          events: [
            Event(
              event: DateTime(2022),
              label: 'label1',
            ),
            Event(
              event: DateTime(2022, 7),
              label: 'label2',
            ),
          ],
          internetCalls: const [
            InternetCall(
              internetCall: 'internetCall1',
              label: 'label1',
            ),
            InternetCall(
              internetCall: 'internetCall2',
              label: 'label2',
            ),
          ],
          name: const Name(
            fileAs: 'fileAs',
            firstName: 'firstName',
            lastName: 'lastName',
            middleName: 'middleName',
            nickname: 'nickname',
            phoneticFirst: 'phoneticFirst',
            phoneticLast: 'phoneticLast',
            phoneticMiddle: 'phoneticMiddle',
            prefix: 'prefix',
            suffix: 'suffix',
          ),
          notes: 'notes',
          organization: const Organization(
            company: 'company',
            department: 'department',
            jobTitle: 'jobTitle',
          ),
          phones: const [
            Phone(
              phone: 'phone1',
              label: 'label1',
            ),
            Phone(
              phone: 'phone2',
              label: 'label2',
            ),
          ],
          relatedPeople: const [
            RelatedPerson(
              relatedPerson: 'relatedPerson1',
              label: 'label1',
            ),
            RelatedPerson(
              relatedPerson: 'relatedPerson2',
              label: 'label2',
            ),
          ],
          websites: const [
            Website(
              website: 'website1',
              label: 'label1',
            ),
            Website(
              website: 'website2',
              label: 'label2',
            ),
          ],
        );
        final Contact b = Contact(
          addresses: const [
            Address(
              city: 'city1',
              countryRegion: Country.italy,
              label: 'label1',
              poBox: 'poBox1',
              postalCode: 'postalCode1',
              provinceDepartment: 'provinceDepartment1',
              streetAddress: 'streetAddress1',
              streetAddressLine2: 'streetAddressLine21',
            ),
            Address(
              city: 'city2',
              countryRegion: Country.colombia,
              label: 'label2',
              poBox: 'poBox2',
              postalCode: 'postalCode2',
              provinceDepartment: 'provinceDepartment2',
              streetAddress: 'streetAddress2',
              streetAddressLine2: 'streetAddressLine22',
            ),
          ],
          chats: const [
            Chat(
              chat: 'chat1',
              label: 'label1',
            ),
            Chat(
              chat: 'chat2',
              label: 'label2',
            ),
          ],
          customFields: const [
            CustomField(
              customField: 'customField1',
              label: 'label1',
            ),
            CustomField(
              customField: 'customField2',
              label: 'label2',
            ),
          ],
          emails: const [
            Email(
              email: 'email1',
              label: 'label1',
            ),
            Email(
              email: 'email2',
              label: 'label2',
            ),
          ],
          events: [
            Event(
              event: DateTime(2022),
              label: 'label1',
            ),
            Event(
              event: DateTime(2022, 7),
              label: 'label2',
            ),
          ],
          internetCalls: const [
            InternetCall(
              internetCall: 'internetCall1',
              label: 'label1',
            ),
            InternetCall(
              internetCall: 'internetCall2',
              label: 'label2',
            ),
          ],
          name: const Name(
            fileAs: 'fileAs',
            firstName: 'firstName',
            lastName: 'lastName',
            middleName: 'middleName',
            nickname: 'nickname',
            phoneticFirst: 'phoneticFirst',
            phoneticLast: 'phoneticLast',
            phoneticMiddle: 'phoneticMiddle',
            prefix: 'prefix',
            suffix: 'suffix',
          ),
          notes: 'notes',
          organization: const Organization(
            company: 'company',
            department: 'department',
            jobTitle: 'jobTitle',
          ),
          phones: const [
            Phone(
              phone: 'phone1',
              label: 'label1',
            ),
            Phone(
              phone: 'phone2',
              label: 'label2',
            ),
          ],
          relatedPeople: const [
            RelatedPerson(
              relatedPerson: 'relatedPerson1',
              label: 'label1',
            ),
            RelatedPerson(
              relatedPerson: 'relatedPerson2',
              label: 'label2',
            ),
          ],
          websites: const [
            Website(
              website: 'website1',
              label: 'label1',
            ),
            Website(
              website: 'website2',
              label: 'label2',
            ),
          ],
        );
        expect(a, b);
        expect(b, a);
      },
    );
  });

  final contact = Contact(
    addresses: const [
      Address(
        city: 'city1',
        countryRegion: Country.italy,
        label: 'label1',
        poBox: 'poBox1',
        postalCode: 'postalCode1',
        provinceDepartment: 'provinceDepartment1',
        streetAddress: 'streetAddress1',
        streetAddressLine2: 'streetAddressLine21',
      ),
      Address(
        city: 'city2',
        countryRegion: Country.colombia,
        label: 'label2',
        poBox: 'poBox2',
        postalCode: 'postalCode2',
        provinceDepartment: 'provinceDepartment2',
        streetAddress: 'streetAddress2',
        streetAddressLine2: 'streetAddressLine22',
      ),
    ],
    chats: const [
      Chat(
        chat: 'chat1',
        label: 'label1',
      ),
      Chat(
        chat: 'chat2',
        label: 'label2',
      ),
    ],
    customFields: const [
      CustomField(
        customField: 'customField1',
        label: 'label1',
      ),
      CustomField(
        customField: 'customField2',
        label: 'label2',
      ),
    ],
    emails: const [
      Email(
        email: 'email1',
        label: 'label1',
      ),
      Email(
        email: 'email2',
        label: 'label2',
      ),
    ],
    events: [
      Event(
        event: DateTime(2022),
        label: 'label1',
      ),
      Event(
        event: DateTime(2022, 7),
        label: 'label2',
      ),
    ],
    internetCalls: const [
      InternetCall(
        internetCall: 'internetCall1',
        label: 'label1',
      ),
      InternetCall(
        internetCall: 'internetCall2',
        label: 'label2',
      ),
    ],
    name: const Name(
      fileAs: 'fileAs',
      firstName: 'firstName',
      lastName: 'lastName',
      middleName: 'middleName',
      nickname: 'nickname',
      phoneticFirst: 'phoneticFirst',
      phoneticLast: 'phoneticLast',
      phoneticMiddle: 'phoneticMiddle',
      prefix: 'prefix',
      suffix: 'suffix',
    ),
    notes: 'notes',
    organization: const Organization(
      company: 'company',
      department: 'department',
      jobTitle: 'jobTitle',
    ),
    phones: const [
      Phone(
        phone: 'phone1',
        label: 'label1',
      ),
      Phone(
        phone: 'phone2',
        label: 'label2',
      ),
    ],
    relatedPeople: const [
      RelatedPerson(
        relatedPerson: 'relatedPerson1',
        label: 'label1',
      ),
      RelatedPerson(
        relatedPerson: 'relatedPerson2',
        label: 'label2',
      ),
    ],
    websites: const [
      Website(
        website: 'website1',
        label: 'label1',
      ),
      Website(
        website: 'website2',
        label: 'label2',
      ),
    ],
  );

  group('factory Contact.fromJson', () {
    test(
        'If the JSON string is a valid representation of a [Contact], must'
        ' construct a [Contact] instance.', () async {
      final file = File('test/models/contact/contact_test.json');
      final json = await file.readAsString();
      expect(
        Contact.fromJson(json),
        contact,
        reason: 'The JSON string is a valid representation of a [Contact]'
            ' instance.',
      );
    });
    test(
        'If the JSON string is not a valid representation of a [Contact], this'
        ' constructor must throw a [FormatException].', () async {
      final file1 = File('test/models/contact/contact_invalid_1_test.json');
      final json1 = await file1.readAsString();
      expect(
        () => Contact.fromJson(json1),
        throwsFormatException,
        reason: 'Invalid date format for the [events].',
      );
    });
  });

  group('Contact.fromMap', () {
    test(
        'If the map is a valid representation of a [Contact] instance, this'
        ' constructor must create that instance.', () {
      final Map<String, dynamic> map = {
        'addresses': [
          {
            'city': 'city1',
            'countryRegion': 'italy',
            'label': 'label1',
            'poBox': 'poBox1',
            'postalCode': 'postalCode1',
            'provinceDepartment': 'provinceDepartment1',
            'streetAddress': 'streetAddress1',
            'streetAddressLine2': 'streetAddressLine21',
          },
          {
            'city': 'city2',
            'countryRegion': 'colombia',
            'label': 'label2',
            'poBox': 'poBox2',
            'postalCode': 'postalCode2',
            'provinceDepartment': 'provinceDepartment2',
            'streetAddress': 'streetAddress2',
            'streetAddressLine2': 'streetAddressLine22',
          },
        ],
        'chats': [
          {'chat': 'chat1', 'label': 'label1'},
          {'chat': 'chat2', 'label': 'label2'},
        ],
        'customFields': [
          {'customField': 'customField1', 'label': 'label1'},
          {'customField': 'customField2', 'label': 'label2'},
        ],
        'emails': [
          {'email': 'email1', 'label': 'label1'},
          {'email': 'email2', 'label': 'label2'},
        ],
        'events': [
          {'event': '2022-01-01T00:00:00.000', 'label': 'label1'},
          {'event': '2022-07-01T00:00:00.000', 'label': 'label2'},
        ],
        'internetCalls': [
          {'internetCall': 'internetCall1', 'label': 'label1'},
          {'internetCall': 'internetCall2', 'label': 'label2'},
        ],
        'name': {
          'fileAs': 'fileAs',
          'firstName': 'firstName',
          'lastName': 'lastName',
          'middleName': 'middleName',
          'nickname': 'nickname',
          'phoneticFirst': 'phoneticFirst',
          'phoneticLast': 'phoneticLast',
          'phoneticMiddle': 'phoneticMiddle',
          'prefix': 'prefix',
          'suffix': 'suffix',
        },
        'notes': 'notes',
        'organization': {
          'company': 'company',
          'department': 'department',
          'jobTitle': 'jobTitle',
        },
        'phones': [
          {'phone': 'phone1', 'label': 'label1'},
          {'phone': 'phone2', 'label': 'label2'},
        ],
        'relatedPeople': [
          {'relatedPerson': 'relatedPerson1', 'label': 'label1'},
          {'relatedPerson': 'relatedPerson2', 'label': 'label2'},
        ],
        'websites': [
          {'website': 'website1', 'label': 'label1'},
          {'website': 'website2', 'label': 'label2'},
        ],
      };
      expect(
        Contact.fromMap(map),
        contact,
      );
    });
    test(
        'If the map is not a valid representation of a [Contact] instance,'
        ' this constructor must throw a [FormatException].', () {
      final Map<String, dynamic> invalidMap = {
        'addresses': [
          {
            'city': 'city1',
            'countryRegion': 'italy',
            'label': 'label1',
            'poBox': 'poBox1',
            'postalCode': 'postalCode1',
            'provinceDepartment': 'provinceDepartment1',
            'streetAddress': 'streetAddress1',
            'streetAddressLine2': 'streetAddressLine21',
          },
          {
            'city': 'city2',
            'countryRegion': 'colombia',
            'label': 'label2',
            'poBox': 'poBox2',
            'postalCode': 'postalCode2',
            'provinceDepartment': 'provinceDepartment2',
            'streetAddress': 'streetAddress2',
            'streetAddressLine2': 'streetAddressLine22',
          },
        ],
        'chats': [
          {'chat': 'chat1', 'label': 'label1'},
          {'chat': 'chat2', 'label': 'label2'},
        ],
        'customFields': [
          {'customField': 'customField1', 'label': 'label1'},
          {'customField': 'customField2', 'label': 'label2'},
        ],
        'emails': [
          {'email': 'email1', 'label': 'label1'},
          {'email': 'email2', 'label': 'label2'},
        ],
        'events': [
          {'event': '2022-01-01T00:00:00.000', 'label': 'label1'},
          {'event': '2022-07-01T00:00:00.000', 'label': 'label2'},
        ],
        'internetCalls': [
          {'internetCall': 'internetCall1', 'label': 'label1'},
          {'internetCall': 'internetCall2', 'label': 'label2'},
        ],
        'notes': 'notes',
        'organization': {
          'company': 'company',
          'department': 'department',
          'jobTitle': 'jobTitle',
        },
        'phones': [
          {'phone': 'phone1', 'label': 'label1'},
          {'phone': 'phone2', 'label': 'label2'},
        ],
        'relatedPeople': [
          {'relatedPerson': 'relatedPerson1', 'label': 'label1'},
          {'relatedPerson': 'relatedPerson2', 'label': 'label2'},
        ],
        'websites': [
          {'website': 'website1', 'label': 'label1'},
          {'website': 'website2', 'label': 'label2'},
        ],
      };
      expect(
        () => Contact.fromMap(invalidMap),
        throwsFormatException,
        reason: '[invalidMap] does not contain "name" key.',
      );
    });
  });

  group('copyWith', () {
    test('This method must copy all parameters and update the ones provided.',
        () {
      expect(
        contact.copyWith(),
        contact,
        reason: 'Without any parameters passed to [copyWith], it must return'
            ' the original [contact].',
      );
      expect(
        contact.copyWith(
          addresses: [],
          chats: [],
          customFields: [],
          emails: [],
          events: [],
          internetCalls: [],
          name: const Name(firstName: 'firstName'),
          notes: '',
          organization: const Organization(company: 'company'),
          phones: [],
          relatedPeople: [],
          websites: [],
        ),
        const Contact(
          addresses: [],
          chats: [],
          customFields: [],
          emails: [],
          events: [],
          internetCalls: [],
          name: Name(firstName: 'firstName'),
          notes: '',
          organization: Organization(company: 'company'),
          phones: [],
          relatedPeople: [],
          websites: [],
        ),
        reason: 'With all the parameters changed.',
      );
    });
  });

  group('toJson', () {
    test('This method must return the corresponding JSON string.', () {
      expect(
        contact.toJson(),
        '{"addresses":[{"city":"city1","countryRegion":"Italy","label":'
        '"label1","poBox":"poBox1","postalCode":"postalCode1",'
        '"provinceDepartment":"provinceDepartment1","streetAddress":'
        '"streetAddress1","streetAddressLine2":"streetAddressLine21"},{"city":'
        '"city2","countryRegion":"Colombia","label":"label2","poBox":"poBox2",'
        '"postalCode":"postalCode2","provinceDepartment":"provinceDepartment2",'
        '"streetAddress":"streetAddress2","streetAddressLine2":'
        '"streetAddressLine22"}],"chats":[{"chat":"chat1","label":"label1"},{'
        '"chat":"chat2","label":"label2"}],"customFields":[{"customField":'
        '"customField1","label":"label1"},{"customField":"customField2","label"'
        ':"label2"}],"emails":[{"email":"email1","label":"label1"},{"email":'
        '"email2","label":"label2"}],"events":[{"event":'
        '"2022-01-01T00:00:00.000","label":"label1"},{"event":'
        '"2022-07-01T00:00:00.000","label":"label2"}],"internetCalls":[{'
        '"internetCall":"internetCall1","label":"label1"},{"internetCall":'
        '"internetCall2","label":"label2"}],"name":{"fileAs":"fileAs",'
        '"firstName":"firstName","lastName":"lastName","middleName":'
        '"middleName","nickname":"nickname","phoneticFirst":"phoneticFirst",'
        '"phoneticLast":"phoneticLast","phoneticMiddle":"phoneticMiddle",'
        '"prefix":"prefix","suffix":"suffix"},"notes":"notes","organization":'
        '{"company":"company","department":"department","jobTitle":"jobTitle"},'
        '"phones":[{"label":"label1","phone":"phone1"},{"label":"label2",'
        '"phone":"phone2"}],"relatedPeople":[{"label":"label1","relatedPerson":'
        '"relatedPerson1"},{"label":"label2","relatedPerson":"relatedPerson2"'
        '}],"websites":[{"label":"label1","website":"website1"},{"label":'
        '"label2","website":"website2"}]}',
        reason: 'No parameter is null.',
      );
      expect(
        const Contact(name: Name(firstName: 'firstName')).toJson(),
        '{"addresses":null,"chats":null,"customFields":null,"emails":null,'
        '"events":null,"internetCalls":null,"name":{"fileAs":null,"firstName":'
        '"firstName","lastName":null,"middleName":null,"nickname":null,'
        '"phoneticFirst":null,"phoneticLast":null,"phoneticMiddle":null,'
        '"prefix":null,"suffix":null},"notes":null,"organization":null,"phones"'
        ':null,"relatedPeople":null,"websites":null}',
      );
    });
  });

  group('toMap', () {
    test('This method must return the corresponding map.', () {
      expect(
        contact.toMap(),
        {
          'addresses': [
            {
              'city': 'city1',
              'countryRegion': 'Italy',
              'label': 'label1',
              'poBox': 'poBox1',
              'postalCode': 'postalCode1',
              'provinceDepartment': 'provinceDepartment1',
              'streetAddress': 'streetAddress1',
              'streetAddressLine2': 'streetAddressLine21',
            },
            {
              'city': 'city2',
              'countryRegion': 'Colombia',
              'label': 'label2',
              'poBox': 'poBox2',
              'postalCode': 'postalCode2',
              'provinceDepartment': 'provinceDepartment2',
              'streetAddress': 'streetAddress2',
              'streetAddressLine2': 'streetAddressLine22',
            },
          ],
          'chats': [
            {'chat': 'chat1', 'label': 'label1'},
            {'chat': 'chat2', 'label': 'label2'},
          ],
          'customFields': [
            {'customField': 'customField1', 'label': 'label1'},
            {'customField': 'customField2', 'label': 'label2'},
          ],
          'emails': [
            {'email': 'email1', 'label': 'label1'},
            {'email': 'email2', 'label': 'label2'},
          ],
          'events': [
            {'event': '2022-01-01T00:00:00.000', 'label': 'label1'},
            {'event': '2022-07-01T00:00:00.000', 'label': 'label2'},
          ],
          'internetCalls': [
            {'internetCall': 'internetCall1', 'label': 'label1'},
            {'internetCall': 'internetCall2', 'label': 'label2'},
          ],
          'name': {
            'fileAs': 'fileAs',
            'firstName': 'firstName',
            'lastName': 'lastName',
            'middleName': 'middleName',
            'nickname': 'nickname',
            'phoneticFirst': 'phoneticFirst',
            'phoneticLast': 'phoneticLast',
            'phoneticMiddle': 'phoneticMiddle',
            'prefix': 'prefix',
            'suffix': 'suffix',
          },
          'notes': 'notes',
          'organization': {
            'company': 'company',
            'department': 'department',
            'jobTitle': 'jobTitle',
          },
          'phones': [
            {'phone': 'phone1', 'label': 'label1'},
            {'phone': 'phone2', 'label': 'label2'},
          ],
          'relatedPeople': [
            {'relatedPerson': 'relatedPerson1', 'label': 'label1'},
            {'relatedPerson': 'relatedPerson2', 'label': 'label2'},
          ],
          'websites': [
            {'website': 'website1', 'label': 'label1'},
            {'website': 'website2', 'label': 'label2'},
          ],
        },
        reason: 'With all the parameters.',
      );
      expect(
        const Contact(name: Name(firstName: 'firstName')).toMap(),
        {
          'addresses': null,
          'chats': null,
          'customFields': null,
          'emails': null,
          'events': null,
          'internetCalls': null,
          'name': {
            'fileAs': null,
            'firstName': 'firstName',
            'lastName': null,
            'middleName': null,
            'nickname': null,
            'phoneticFirst': null,
            'phoneticLast': null,
            'phoneticMiddle': null,
            'prefix': null,
            'suffix': null,
          },
          'notes': null,
          'organization': null,
          'phones': null,
          'relatedPeople': null,
          'websites': null,
        },
        reason: 'Only "name" parameter is not null.',
      );
    });
  });
}
