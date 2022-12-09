![Pub Version (including pre-releases)](https://img.shields.io/pub/v/contacts?include_prereleases&style=flat-square)
![Dart GitHub Actions](https://github.com/Marco87Developer/contacts/actions/workflows/dart.yml/badge.svg)
![GitHub Top Language](https://img.shields.io/github/languages/top/Marco87Developer/contacts?&style=flat-square)

A set of classes useful for managing contacts.

## Features

The main class of this package is definitely `Contacts`. All the other classes, although they can be useful separately, were created thinking about the formation of a contact and interaction with it.

For the choice of contact information, I referred to those that can be saved for a contact in [Google Contacts](https://contacts.google.com/). The idea is to make it easy to save a contact’s information in an exhaustive and, at the same time, well organized way.

Easily create a contact:

```dart
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
```
