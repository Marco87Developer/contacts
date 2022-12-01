import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:contacts/src/models/address.dart';
import 'package:contacts/src/models/chat.dart';
import 'package:contacts/src/models/custom_field.dart';
import 'package:contacts/src/models/email.dart';
import 'package:contacts/src/models/event.dart';
import 'package:contacts/src/models/internet_call.dart';
import 'package:contacts/src/models/name.dart';
import 'package:contacts/src/models/organization.dart';
import 'package:contacts/src/models/phone.dart';
import 'package:contacts/src/models/related_person.dart';
import 'package:contacts/src/models/website.dart';
import 'package:meta/meta.dart';

const String _addressesKey = 'addresses';
const String _chatsKey = 'chats';
const String _customFieldsKey = 'customFields';
const String _emailsKey = 'emails';
const String _eventsKey = 'events';
const String _internetCallsKey = 'internetCalls';
const String _nameKey = 'name';
const String _notesKey = 'notes';
const String _organizationKey = 'organization';
const String _phonesKey = 'phones';
const String _relatedPeopleKey = 'relatedPeople';
const String _websitesKey = 'websites';

/// A contact.
///
@immutable
class Contact {
  /// A contact.
  ///
  const Contact({
    required this.name,
    this.organization,
    this.emails,
    this.phones,
    this.addresses,
    this.events,
    this.websites,
    this.relatedPeople,
    this.chats,
    this.internetCalls,
    this.customFields,
    this.notes,
  });

  /// Constructs an [Contact] instance **from a [json] string**.
  ///
  factory Contact.fromJson(final String json) =>
      Contact.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs an [Contact] instance **from a [map]**.
  ///
  Contact.fromMap(final Map<String, dynamic> map)
      : name = Name.fromMap(map[_nameKey] as Map<String, dynamic>),
        organization = map[_organizationKey] == null
            ? null
            : Organization.fromMap(
                map[_organizationKey] as Map<String, dynamic>,
              ),
        emails = map[_emailsKey] == null
            ? null
            : (map[_emailsKey] as List<dynamic>)
                .map((final e) => Email.fromMap(e as Map<String, dynamic>))
                .toList(),
        phones = map[_phonesKey] == null
            ? null
            : (map[_phonesKey] as List<dynamic>)
                .map((final p) => Phone.fromMap(p as Map<String, dynamic>))
                .toList(),
        addresses = map[_addressesKey] == null
            ? null
            : (map[_addressesKey] as List<dynamic>)
                .map((final a) => Address.fromMap(a as Map<String, dynamic>))
                .toList(),
        events = map[_eventsKey] == null
            ? null
            : (map[_eventsKey] as List<dynamic>)
                .map((final e) => Event.fromMap(e as Map<String, dynamic>))
                .toList(),
        websites = map[_websitesKey] == null
            ? null
            : (map[_websitesKey] as List<dynamic>)
                .map((final w) => Website.fromMap(w as Map<String, dynamic>))
                .toList(),
        relatedPeople = map[_relatedPeopleKey] == null
            ? null
            : (map[_relatedPeopleKey] as List<dynamic>)
                .map(
                  (final r) => RelatedPerson.fromMap(r as Map<String, dynamic>),
                )
                .toList(),
        chats = map[_chatsKey] == null
            ? null
            : (map[_chatsKey] as List<dynamic>)
                .map((final c) => Chat.fromMap(c as Map<String, dynamic>))
                .toList(),
        internetCalls = map[_internetCallsKey] == null
            ? null
            : (map[_internetCallsKey] as List<dynamic>)
                .map(
                  (final i) => InternetCall.fromMap(i as Map<String, dynamic>),
                )
                .toList(),
        customFields = map[_customFieldsKey] == null
            ? null
            : (map[_customFieldsKey] as List<dynamic>)
                .map(
                  (final c) => CustomField.fromMap(c as Map<String, dynamic>),
                )
                .toList(),
        notes = map[_notesKey] == null ? null : '${map[_notesKey]}';

  /// The full name.
  final Name name;

  /// The organization.
  final Organization? organization;

  /// Email addresses.
  final List<Email>? emails;

  /// Phone numbers.
  final List<Phone>? phones;

  /// The addresses.
  final List<Address>? addresses;

  /// Events.
  final List<Event>? events;

  /// The websites.
  final List<Website>? websites;

  /// Related people.
  final List<RelatedPerson>? relatedPeople;

  /// The chats.
  final List<Chat>? chats;

  /// Internet calls.
  final List<InternetCall>? internetCalls;

  /// The custom fields.
  final List<CustomField>? customFields;

  /// The notes.
  final String? notes;

  /// Creates a **copy** of this [Contact] instance but with the **given fields
  /// replaced** with the new values.
  ///
  Contact copyWith({
    final Name? name,
    final Organization? organization,
    final List<Email>? emails,
    final List<Phone>? phones,
    final List<Address>? address,
    final List<Event>? event,
    final List<Website>? website,
    final List<RelatedPerson>? relatedPersons,
    final List<Chat>? chats,
    final List<InternetCall>? internetCalls,
    final List<CustomField>? customFields,
    final String? notes,
  }) =>
      Contact(
        name: name ?? this.name,
        organization: organization ?? this.organization,
        emails: emails ?? this.emails,
        phones: phones ?? this.phones,
        addresses: address ?? addresses,
        events: event ?? events,
        websites: website ?? websites,
        relatedPeople: relatedPersons ?? relatedPeople,
        chats: chats ?? this.chats,
        internetCalls: internetCalls ?? this.internetCalls,
        customFields: customFields ?? this.customFields,
        notes: notes ?? this.notes,
      );

  /// Creates a **JSON string representing** this [Contact] instance.
  ///
  /// The resulting JSON string can be parsed back using [Contact.fromJson].
  ///
  String toJson() => jsonEncode(toMap());

  /// Creates a **[Map<String, dynamic>] representing** this [Contact] instance.
  ///
  /// The resulting map can be parsed back using [Contact.fromMap].
  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
        _nameKey: name.toMap(),
        _organizationKey: organization?.toMap(),
        _emailsKey: emails?.map((final e) => e.toMap()).toList(),
        _phonesKey: phones?.map((final p) => p.toMap()).toList(),
        _addressesKey: addresses?.map((final a) => a.toMap()).toList(),
        _eventsKey: events?.map((final e) => e.toMap()).toList(),
        _websitesKey: websites?.map((final w) => w.toMap()).toList(),
        _relatedPeopleKey: relatedPeople?.map((final r) => r.toMap()).toList(),
        _chatsKey: chats?.map((final c) => c.toMap()).toList(),
        _internetCallsKey: internetCalls?.map((final i) => i.toMap()).toList(),
        _customFieldsKey: customFields?.map((final c) => c.toMap()).toList(),
        _notesKey: notes,
      };

  @override
  bool operator ==(covariant final Contact other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.organization == organization &&
        const DeepCollectionEquality().equals(other.emails, emails) &&
        const DeepCollectionEquality().equals(other.phones, phones) &&
        const DeepCollectionEquality().equals(other.addresses, addresses) &&
        const DeepCollectionEquality().equals(other.events, events) &&
        const DeepCollectionEquality().equals(other.websites, websites) &&
        const DeepCollectionEquality()
            .equals(other.relatedPeople, relatedPeople) &&
        const DeepCollectionEquality().equals(other.chats, chats) &&
        const DeepCollectionEquality()
            .equals(other.internetCalls, internetCalls) &&
        const DeepCollectionEquality()
            .equals(other.customFields, customFields) &&
        other.notes == notes;
  }

  @override
  int get hashCode => Object.hashAll(<Object?>[
        name,
        organization,
        emails,
        phones,
        addresses,
        events,
        websites,
        relatedPeople,
        chats,
        internetCalls,
        customFields,
        notes,
      ]);

  @override
  String toString() => 'Contact(name: $name, organization: $organization,'
      ' emails: $emails, phones: $phones, address: $addresses, event: $events,'
      ' website: $websites, relatedPersons: $relatedPeople, chats: $chats,'
      ' internetCalls: $internetCalls, customFields: $customFields, notes:'
      ' $notes)';
}
