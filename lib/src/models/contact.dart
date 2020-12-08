import 'package:flutter/material.dart';

import 'address.dart';
import 'chat.dart';
import 'contact_event.dart';
import 'custom_field.dart';
import 'email.dart';
import 'internet_call.dart';
import 'job.dart';
import 'name.dart';
import 'phone.dart';
import 'relationship.dart';
import 'website.dart';

const String _addressesKey = 'addresses';
const String _birthdayKey = 'birthday';
const String _chatsKey = 'chats';
const String _customFieldsKey = 'customFields';
const String _emailsKey = 'emails';
const String _eventsKey = 'events';
const String _internetCallsKey = 'internetCalls';
const String _jobsKey = 'jobs';
const String _nameKey = 'name';
const String _notesKey = 'notes';
const String _phonesKey = 'phones';
const String _relationshipsKey = 'relationships';
const String _websitesKey = 'websites';

/// This class models a reference to an address.
///
class Contact implements Comparable {
  /// A reference to an address.
  ///
  /// It **requires** these fields: `Name` [name] and `List<Phone>` [phones].
  ///
  /// Also, it has *optional* fields: `List<Address>` [addresses], `DateTime?`
  /// [birthday], `List<Chat>` chats, `List<CustomField>` [customFields],
  /// `List<Email>` [emails], `List<ContactEvent>` [events], `List<InternetCall>`
  /// [internetCalls], `List<Job>` [jobs], `String` [notes], `List<Relationship>`
  /// [relationships] and `List<Website>` [websites].
  ///
  const Contact({
    this.addresses = const <Address>[],
    this.birthday,
    this.chats = const <Chat>[],
    this.customFields = const <CustomField>[],
    this.emails = const <Email>[],
    this.events = const <ContactEvent>[],
    this.internetCalls = const <InternetCall>[],
    this.jobs = const <Job>[],
    required this.name,
    this.notes = '',
    required this.phones,
    this.relationships = const <Relationship>[],
    this.websites = const <Website>[],
  });

  /// Creates a `Contact` instance starting from a `Map<String, dynamic> map`.
  ///
  /// This can be useful for retrieving the instance in a database.
  ///
  Contact.fromMap(Map<String, dynamic> map)
      : addresses = [
          for (Map<String, dynamic> addressMap in map[_addressesKey])
            Address.fromMap(addressMap),
        ],
        birthday = map[_birthdayKey] != null
            ? DateTime.parse(map[_birthdayKey])
            : null,
        chats = [
          for (Map<String, dynamic> chatMap in map[_chatsKey])
            Chat.fromMap(chatMap),
        ],
        customFields = [
          for (Map<String, dynamic> customFieldMap in map[_customFieldsKey])
            CustomField.fromMap(customFieldMap),
        ],
        emails = [
          for (Map<String, dynamic> emailMap in map[_emailsKey])
            Email.fromMap(emailMap),
        ],
        events = [
          for (Map<String, dynamic> eventMap in map[_eventsKey])
            ContactEvent.fromMap(eventMap),
        ],
        internetCalls = [
          for (Map<String, dynamic> internetCallMap in map[_internetCallsKey])
            InternetCall.fromMap(internetCallMap),
        ],
        jobs = [
          for (Map<String, dynamic> jobMap in map[_jobsKey])
            Job.fromMap(jobMap),
        ],
        name = Name.fromMap(map[_nameKey]),
        notes = map[_notesKey],
        phones = [
          for (Map<String, dynamic> phoneMap in map[_phonesKey])
            Phone.fromMap(phoneMap),
        ],
        relationships = [
          for (Map<String, dynamic> relationshipMap in map[_relationshipsKey])
            Relationship.fromMap(relationshipMap),
        ],
        websites = [
          for (Map<String, dynamic> websiteMap in map[_websitesKey])
            Website.fromMap(websiteMap),
        ];

  /// A list of addresses that belong to this contact.
  final List<Address> addresses;

  /// The birthday of this contact.
  final DateTime? birthday;

  /// A list of chats that belong to this contact.
  final List<Chat> chats;

  /// A list of custom fields.
  final List<CustomField> customFields;

  /// A list of emails that belong to this contact.
  final List<Email> emails;

  /// A list of events that belong to this contact.
  final List<ContactEvent> events;

  /// A list of Internet call references that belong to this contact.
  final List<InternetCall> internetCalls;

  /// A list of the jobs that this contact performs.
  final List<Job> jobs;

  /// The complete name of this contact.
  final Name name;

  /// Some notes relating to this contact.
  final String notes;

  /// A list of phone numbers that belong to this contact.
  final List<Phone> phones;

  /// A list of relationships of this contact.
  final List<Relationship> relationships;

  /// A list of websites that belong to this contact.
  final List<Website> websites;

  /// Makes a call to a contact’s phone. It is based on the [label] and,
  /// optionally, on the position of the number ([index]) in the list of phones
  /// with the same [label]. In case [index] is `null`, the 1º in the list is
  /// called.
  ///
  Future<bool> callAtPhone({
    required String label,
    int? index,
  }) {
    final List<Phone> phonesForCall =
        phones.where((phone) => phone.label == label).toList();

    return phonesForCall[index ?? 0].call();
  }

  /// Sends a SMS to a contact’s phone. It is based on the [label] and,
  /// optionally, on the position of the number ([index]) in the list of phones
  /// with the same [label]. In case [index] is `null`, the 1º in the list is
  /// called.
  ///
  Future<bool> smsAtPhone({
    required String label,
    int? index,
  }) {
    final List<Phone> phonesForCall =
        phones.where((phone) => phone.label == label).toList();

    return phonesForCall[index ?? 0].sms();
  }

  /// Creates a `Map<String, dynamic> map` representation of this instance.
  ///
  /// This can be useful for saving the instance in a database.
  ///
  Map<String, dynamic> toMap() => {
        _addressesKey: [
          for (Address address in addresses) address.toMap(),
        ],
        _birthdayKey: birthday?.toIso8601String(),
        _chatsKey: [
          for (Chat chat in chats) chat.toMap(),
        ],
        _customFieldsKey: [
          for (CustomField customField in customFields) customField.toMap(),
        ],
        _emailsKey: [
          for (Email email in emails) email.toMap(),
        ],
        _eventsKey: [
          for (ContactEvent event in events) event.toMap(),
        ],
        _internetCallsKey: [
          for (InternetCall internetCall in internetCalls) internetCall.toMap(),
        ],
        _jobsKey: [
          for (Job job in jobs) job.toMap(),
        ],
        _nameKey: name.toMap(),
        _notesKey: notes,
        _phonesKey: [
          for (Phone phone in phones) phone.toMap(),
        ],
        _relationshipsKey: [
          for (Relationship relationship in relationships) relationship.toMap(),
        ],
        _websitesKey: [
          for (Website website in websites) website.toMap(),
        ],
      };

  /// The order of the comparisons is:
  ///
  /// 1. [name]
  /// 2. [birthday]
  ///
  @override
  int compareTo(covariant Contact other) {
    // 1º comparison
    final int comparison1 = name.compareTo(other.name);
    if (comparison1 != 0) return comparison1;

    // Last comparison
    final DateTime nonNullBirthday = birthday ?? DateTime(0);
    final DateTime nonNullOtherBirthday = other.birthday ?? DateTime(0);
    final int comparison3 = nonNullBirthday.compareTo(nonNullOtherBirthday);
    return comparison3;
  }

  @override
  int get hashCode => hashValues(
        addresses,
        birthday,
        chats,
        customFields,
        emails,
        events,
        internetCalls,
        jobs,
        name,
        notes,
        phones,
        relationships,
        websites,
      );

  /// Returns if this instance is less than the [other].
  ///
  bool operator <(covariant Contact other) => compareTo(other) < 0;

  /// Return if this instance is less than or equal to the [other].
  ///
  bool operator <=(covariant Contact other) => compareTo(other) <= 0;

  @override
  bool operator ==(covariant Contact other) => compareTo(other) == 0;

  /// Return if this instance is greater than or equal to the [other].
  ///
  bool operator >=(covariant Contact other) => compareTo(other) >= 0;

  /// Return if this instance is greater than the [other].
  ///
  bool operator >(covariant Contact other) => compareTo(other) > 0;
}
