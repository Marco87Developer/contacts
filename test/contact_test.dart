import 'package:contacts/src/models/address.dart';
import 'package:contacts/src/models/chat.dart';
import 'package:contacts/src/models/contact.dart';
import 'package:contacts/src/models/contact_event.dart';
import 'package:contacts/src/models/custom_field.dart';
import 'package:contacts/src/models/email.dart';
import 'package:contacts/src/models/internet_call.dart';
import 'package:contacts/src/models/job.dart';
import 'package:contacts/src/models/name.dart';
import 'package:contacts/src/models/phone.dart';
import 'package:contacts/src/models/relationship.dart';
import 'package:contacts/src/models/website.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Contact.fromMap', () {
    final Map<String, dynamic> map = <String, dynamic>{
      'addresses': [
        {
          'city': 'City',
          'countryRegion': 'CountryRegion',
          'description': 'Description',
          'label': 'Label',
          'postalCode': 'PostalCode',
          'postOfficeBox': 'PostOfficeBox',
          'province': 'Province',
          'street': 'Street',
        },
      ],
      'birthday': '2020-02-27T13:27:00.000',
      'chats': [
        {
          'chat': 'Chat',
          'label': 'Label',
        },
      ],
      'customFields': [
        {
          'content': 'Content',
          'label': 'Label',
        },
      ],
      'emails': [
        {
          'address': 'email1@email.com',
          'label': 'Personal',
        },
        {
          'address': 'email2@email.com',
          'label': 'Personal',
        },
      ],
      'events': [
        {
          'date': '2020-02-27T13:27:00.000',
          'title': 'First event',
        },
      ],
      'internetCalls': [
        {
          'internetCall': 'Internet call',
          'label': 'Label',
        },
      ],
      'jobs': [
        {
          'company': 'Company',
          'department': 'Department',
          'jobTitle': 'Job title',
        },
      ],
      'name': {
        'fileAs': 'File as',
        'firstName': 'First name',
        'lastName': 'Last name',
        'middleName': 'Middle name',
        'nickname': 'Nickname',
        'phoneticFirst': 'Phonetic first',
        'phoneticLast': 'Phonetic last',
        'phoneticMiddle': 'Phonetic middle',
        'prefix': 'Prefix',
        'suffix': 'Suffix',
      },
      'notes': 'Notes',
      'phones': [
        {
          'countryCode': '39',
          'label': 'Personal',
          'local': '0123456789',
        },
        {
          'countryCode': '1',
          'label': 'Personal',
          'local': '0123456789',
        },
      ],
      'relationships': [
        {
          'label': 'Friend1',
          'name': 'Name1',
        },
        {
          'label': 'Friend2',
          'name': 'Name2',
        },
      ],
      'websites': [
        {
          'label': 'Personal',
          'url': 'url1.com',
        },
      ],
    };

    const Address address = Address(
      city: 'City',
      countryRegion: 'CountryRegion',
      label: 'Label',
      postalCode: 'PostalCode',
      postOfficeBox: 'PostOfficeBox',
      province: 'Province',
      street: 'Street',
    );

    final DateTime birthday = DateTime(2020, 2, 27, 13, 27, 0);

    const Chat chat = Chat(chat: 'Chat', label: 'Label');

    const CustomField customField =
        CustomField(content: 'Content', label: 'Label');

    const Email email1 = Email(address: 'email1@email.com', label: 'Personal');
    const Email email2 = Email(address: 'email2@email.com', label: 'Personal');

    final ContactEvent event = ContactEvent(
        date: DateTime(2020, 2, 27, 13, 27, 0), title: 'First event');

    const InternetCall internetCall =
        InternetCall(internetCall: 'Internet call', label: 'Label');

    const Job job = Job(
      company: 'Company',
      department: 'Department',
      jobTitle: 'Job title',
    );

    const Name name = Name(
      fileAs: 'File as',
      firstName: 'First name',
      lastName: 'Last name',
      middleName: 'Middle name',
      nickname: 'Nickname',
      phoneticFirst: 'Phonetic first',
      phoneticLast: 'Phonetic last',
      phoneticMiddle: 'Phonetic middle',
      prefix: 'Prefix',
      suffix: 'Suffix',
    );

    const Phone phone1 = Phone(
      countryCode: '39',
      label: 'Personal',
      local: '0123456789',
    );
    const Phone phone2 = Phone(
      countryCode: '1',
      label: 'Personal',
      local: '0123456789',
    );

    const Relationship relationship1 =
        Relationship(label: 'Friend1', name: 'Name1');
    const Relationship relationship2 =
        Relationship(label: 'Friend2', name: 'Name2');

    const Website website = Website(label: 'Personal', url: 'url1.com');

    expect(
      Contact.fromMap(map),
      Contact(
        addresses: [address],
        birthday: birthday,
        chats: [chat],
        customFields: [customField],
        emails: [email1, email2],
        events: [event],
        internetCalls: [internetCall],
        jobs: [job],
        name: name,
        notes: 'Notes',
        phones: [phone1, phone2],
        relationships: [relationship1, relationship2],
        websites: [website],
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

    final DateTime birthday = DateTime(2020, 2, 27, 13, 27, 0);

    const Chat chat = Chat(chat: 'Chat', label: 'Label');

    const CustomField customField =
        CustomField(content: 'Content', label: 'Label');

    const Email email1 = Email(address: 'email1@email.com', label: 'Personal');
    const Email email2 = Email(address: 'email2@email.com', label: 'Personal');

    final ContactEvent event = ContactEvent(
        date: DateTime(2020, 2, 27, 13, 27, 0), title: 'First event');

    const InternetCall internetCall =
        InternetCall(internetCall: 'Internet call', label: 'Label');

    const Job job = Job(
        company: 'Company', department: 'Department', jobTitle: 'Job title');

    const Name name = Name(
      fileAs: 'File as',
      firstName: 'First name',
      lastName: 'Last name',
      middleName: 'Middle name',
      nickname: 'Nickname',
      phoneticFirst: 'Phonetic first',
      phoneticLast: 'Phonetic last',
      phoneticMiddle: 'Phonetic middle',
      prefix: 'Prefix',
      suffix: 'Suffix',
    );

    const Phone phone1 = Phone(
      countryCode: '39',
      label: 'Personal',
      local: '0123456789',
    );
    const Phone phone2 = Phone(
      countryCode: '1',
      label: 'Personal',
      local: '0123456789',
    );

    const Relationship relationship1 =
        Relationship(label: 'Friend1', name: 'Name1');
    const Relationship relationship2 =
        Relationship(label: 'Friend2', name: 'Name2');

    const Website website = Website(label: 'Personal', url: 'url1.com');

    final Contact contact = Contact(
      addresses: [address],
      birthday: birthday,
      chats: [chat],
      customFields: [customField],
      emails: [email1, email2],
      events: [event],
      internetCalls: [internetCall],
      jobs: [job],
      name: name,
      notes: 'Notes',
      phones: [phone1, phone2],
      relationships: [relationship1, relationship2],
      websites: [website],
    );

    expect(contact.toMap(), {
      'addresses': [
        {
          'city': 'City',
          'countryRegion': 'CountryRegion',
          'label': 'Label',
          'postalCode': 'PostalCode',
          'postOfficeBox': 'PostOfficeBox',
          'province': 'Province',
          'street': 'Street',
        },
      ],
      'birthday': '2020-02-27T13:27:00.000',
      'chats': [
        {
          'chat': 'Chat',
          'label': 'Label',
        },
      ],
      'customFields': [
        {
          'content': 'Content',
          'label': 'Label',
        },
      ],
      'emails': [
        {
          'address': 'email1@email.com',
          'label': 'Personal',
        },
        {
          'address': 'email2@email.com',
          'label': 'Personal',
        },
      ],
      'events': [
        {
          'date': '2020-02-27T13:27:00.000',
          'title': 'First event',
        },
      ],
      'internetCalls': [
        {
          'internetCall': 'Internet call',
          'label': 'Label',
        },
      ],
      'jobs': [
        {
          'company': 'Company',
          'department': 'Department',
          'jobTitle': 'Job title',
        },
      ],
      'name': {
        'fileAs': 'File as',
        'firstName': 'First name',
        'lastName': 'Last name',
        'middleName': 'Middle name',
        'nickname': 'Nickname',
        'phoneticFirst': 'Phonetic first',
        'phoneticLast': 'Phonetic last',
        'phoneticMiddle': 'Phonetic middle',
        'prefix': 'Prefix',
        'suffix': 'Suffix',
      },
      'notes': 'Notes',
      'phones': [
        {
          'countryCode': '39',
          'label': 'Personal',
          'local': '0123456789',
        },
        {
          'countryCode': '1',
          'label': 'Personal',
          'local': '0123456789',
        },
      ],
      'relationships': [
        {
          'label': 'Friend1',
          'name': 'Name1',
        },
        {
          'label': 'Friend2',
          'name': 'Name2',
        },
      ],
      'websites': [
        {
          'label': 'Personal',
          'url': 'url1.com',
        },
      ],
    });
  });

  test('compareTo()', () {
    const Address address = Address(
      city: 'City',
      countryRegion: 'CountryRegion',
      label: 'Label',
      postalCode: 'PostalCode',
      postOfficeBox: 'PostOfficeBox',
      province: 'Province',
      street: 'Street',
    );

    final DateTime birthday = DateTime(2020, 2, 27, 13, 27, 0);

    const Chat chat = Chat(chat: 'Chat', label: 'Label');

    const CustomField customField =
        CustomField(content: 'Content', label: 'Label');

    const Email email1 = Email(address: 'email1@email.com', label: 'Personal');
    const Email email2 = Email(address: 'email2@email.com', label: 'Personal');

    final ContactEvent event = ContactEvent(
        date: DateTime(2020, 2, 27, 13, 27, 0), title: 'First event');

    const InternetCall internetCall =
        InternetCall(internetCall: 'Internet call', label: 'Label');

    const Job job = Job(
        company: 'Company', department: 'Department', jobTitle: 'Job title');

    const Name name = Name(
      fileAs: 'File as',
      firstName: 'First name',
      lastName: 'Last name',
      middleName: 'Middle name',
      nickname: 'Nickname',
      phoneticFirst: 'Phonetic first',
      phoneticLast: 'Phonetic last',
      phoneticMiddle: 'Phonetic middle',
      prefix: 'Prefix',
      suffix: 'Suffix',
    );
    const Name name2 = Name(
      fileAs: 'File as',
      firstName: 'First name2',
      lastName: 'Last name2',
      middleName: 'Middle name',
      nickname: 'Nickname',
      phoneticFirst: 'Phonetic first',
      phoneticLast: 'Phonetic last',
      phoneticMiddle: 'Phonetic middle',
      prefix: 'Prefix',
      suffix: 'Suffix',
    );

    const Phone phone1 = Phone(
      countryCode: '39',
      label: 'Personal',
      local: '0123456789',
    );
    const Phone phone2 = Phone(
      countryCode: '1',
      label: 'Personal',
      local: '0123456789',
    );

    const Relationship relationship1 =
        Relationship(label: 'Friend1', name: 'Name1');
    const Relationship relationship2 =
        Relationship(label: 'Friend2', name: 'Name2');

    const Website website = Website(label: 'Personal', url: 'url1.com');

    final Contact contact1 = Contact(
      addresses: [address],
      birthday: birthday,
      chats: [chat],
      customFields: [customField],
      emails: [email1, email2],
      events: [event],
      internetCalls: [internetCall],
      jobs: [job],
      name: name,
      notes: 'Notes',
      phones: [phone1, phone2],
      relationships: [relationship1, relationship2],
      websites: [website],
    );
    final Contact contact2 = Contact(
      addresses: [address],
      birthday: birthday,
      chats: [chat],
      customFields: [customField],
      emails: [email1],
      events: [event],
      internetCalls: [internetCall],
      jobs: [job],
      name: name2,
      notes: 'Notes',
      phones: [phone1],
      relationships: [relationship1],
      websites: [website],
    );

    expect(contact1.compareTo(contact2), -1);
    expect(contact1.compareTo(contact1), 0);
    expect(contact2.compareTo(contact1), 1);
    expect(contact1 < contact2, true);
    expect(contact1 <= contact2, true);
    expect(contact1 == contact1, true);
    expect(contact1 == contact2, false);
    expect(contact1 > contact2, false);
    expect(contact1 >= contact2, false);
  });
}
