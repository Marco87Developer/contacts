![](https://img.shields.io/badge/pub-v1.0.0-blue)

# Contacts

A set of classes useful for managing contacts. In order to save data in a database, each class has `toMap()` method, and to retrieve data from the database, each class has `fromMap(Map<String, dynamic> map)` method.

## `Contact` class

The main class of this package is definitely `Contacts`. All the other classes, although they can be useful separately, were created thinking about the formation of a contact and interaction with it.

For the choice of contact information, I referred to those that can be saved for a contact in *[Google Contacts](https://contacts.google.com)*. The idea is to make it easy to save a contact’s information in an exhaustive and, at the same time, well organized way.

Another important goal is to facilitate the saving of class instances in a database and, in the opposite sense, the retrieve of the instance starting from the information saved in the database.

To give an example, a `Contact` can look like this:
```dart
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
)
```

## Other classes
The other classes of this package are:

* `Address`

  An example:
  ```dart
  Address(
      city: 'City',
      countryRegion: 'CountryRegion',
      label: 'Label',
      postalCode: 'PostalCode',
      postOfficeBox: 'PostOfficeBox',
      province: 'Province',
      street: 'Street',
  )
  ```
* `Chat`

  An example:
  ```dart
  Chat(
      chat: 'Chat',
      label: 'Label',
  )
  ```
* `ContactEvent`

  An example:
  ```dart
  ContactEvent(
      date: DateTime(2020, 2, 27, 13, 27, 0),
      title: 'Event Title',
  ),
  ```
* `CustomField`

  An example:
  ```dart
  CustomField(
      content: 'A simple content.',
      label: 'Label',
  )
  ```
* `Email`

  An example:
  ```dart
  Email(
      address: 'example@email.com',
      label: 'Label',
  )
  ```

  We can send an email to this address with:
  ```dart
  mailTo(
      subject: 'The subject of the email',
      body: 'The body of the email.',
  );
  ```

* `InternetCall`

  An example:
  ```dart
  InternetCall(
      internetCall: 'Name',
      label: 'Label',
  )
  ```
* `Job`

  An example:
  ```dart
  Job(
      company: 'Company',
      department: 'Department',
      jobTitle: 'Job title',
  )
  ```
* `Name`

  An example:
  ```dart
  Name(
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
  )
  ```
* `Phone`

  An example:
  ```dart
  Phone(
      countryCode: '39',
      label: 'Personal',
      local: '0123456789',
  )
  ```

  We can call this phone number with the method `call()`. Also, we can send a SMS using `sms()` method:
  ```dart
  sms(body: 'This is the body of the SMS.');
  ```
* `Relationship`

  An example:
  ```dart
  Relationship(
      label: 'Friend',
      name: 'Name',
  )
  ```
* `Website`

  An example:
  ```dart
  Website(
      label: 'Label',
      url: 'url.com',
  )
  ```

  We can open this website calling the `open()` method. It allows to set the `bool forceSafariVC` and `bool forceWebView` parameters.
