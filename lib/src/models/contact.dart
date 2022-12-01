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
/// {@template contacts.contact.oncecreatednopropertiesmaybechanged}
/// Once created, no properties of a [Contact] object may be changed.
/// {@endtemplate}
///
@immutable
class Contact {
  /// Constructs a [Contact] instance.
  ///
  /// {@macro contacts.contact.oncecreatednopropertiesmaybechanged}
  ///
  const Contact({
    this.addresses,
    this.chats,
    this.customFields,
    this.emails,
    this.events,
    this.internetCalls,
    required this.name,
    this.notes,
    this.organization,
    this.phones,
    this.relatedPeople,
    this.websites,
  });

  /// Constructs an [Contact] instance **from a [json] string**.
  ///
  /// {@macro contacts.contact.oncecreatednopropertiesmaybechanged}
  ///
  factory Contact.fromJson(final String json) =>
      Contact.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs an [Contact] instance **from a [map]**.
  ///
  /// {@macro contacts.contact.oncecreatednopropertiesmaybechanged}
  ///
  Contact.fromMap(final Map<String, dynamic> map)
      : addresses = map[_addressesKey] == null
            ? null
            : (map[_addressesKey] as List<dynamic>)
                .map((final a) => Address.fromMap(a as Map<String, dynamic>))
                .toList(),
        chats = map[_chatsKey] == null
            ? null
            : (map[_chatsKey] as List<dynamic>)
                .map((final c) => Chat.fromMap(c as Map<String, dynamic>))
                .toList(),
        customFields = map[_customFieldsKey] == null
            ? null
            : (map[_customFieldsKey] as List<dynamic>)
                .map(
                  (final c) => CustomField.fromMap(c as Map<String, dynamic>),
                )
                .toList(),
        emails = map[_emailsKey] == null
            ? null
            : (map[_emailsKey] as List<dynamic>)
                .map((final e) => Email.fromMap(e as Map<String, dynamic>))
                .toList(),
        events = map[_eventsKey] == null
            ? null
            : (map[_eventsKey] as List<dynamic>)
                .map((final e) => Event.fromMap(e as Map<String, dynamic>))
                .toList(),
        internetCalls = map[_internetCallsKey] == null
            ? null
            : (map[_internetCallsKey] as List<dynamic>)
                .map(
                  (final i) => InternetCall.fromMap(i as Map<String, dynamic>),
                )
                .toList(),
        name = Name.fromMap(map[_nameKey] as Map<String, dynamic>),
        notes = map[_notesKey] == null ? null : '${map[_notesKey]}',
        organization = map[_organizationKey] == null
            ? null
            : Organization.fromMap(
                map[_organizationKey] as Map<String, dynamic>,
              ),
        phones = map[_phonesKey] == null
            ? null
            : (map[_phonesKey] as List<dynamic>)
                .map((final p) => Phone.fromMap(p as Map<String, dynamic>))
                .toList(),
        relatedPeople = map[_relatedPeopleKey] == null
            ? null
            : (map[_relatedPeopleKey] as List<dynamic>)
                .map(
                  (final r) => RelatedPerson.fromMap(r as Map<String, dynamic>),
                )
                .toList(),
        websites = map[_websitesKey] == null
            ? null
            : (map[_websitesKey] as List<dynamic>)
                .map((final w) => Website.fromMap(w as Map<String, dynamic>))
                .toList();

  /// The addresses.
  final List<Address>? addresses;

  /// The chats.
  final List<Chat>? chats;

  /// The custom fields.
  final List<CustomField>? customFields;

  /// Email addresses.
  final List<Email>? emails;

  /// Events.
  final List<Event>? events;

  /// Internet calls.
  final List<InternetCall>? internetCalls;

  /// The full name.
  final Name name;

  /// The notes.
  final String? notes;

  /// The organization.
  final Organization? organization;

  /// Phone numbers.
  final List<Phone>? phones;

  /// Related people.
  final List<RelatedPerson>? relatedPeople;

  /// The websites.
  final List<Website>? websites;

  /// Creates a **copy** of this [Contact] instance but with the **given fields
  /// replaced** with the new values.
  ///
  Contact copyWith({
    final List<Address>? addresses,
    final List<Chat>? chats,
    final List<CustomField>? customFields,
    final List<Email>? emails,
    final List<Event>? events,
    final List<InternetCall>? internetCalls,
    final Name? name,
    final String? notes,
    final Organization? organization,
    final List<Phone>? phones,
    final List<RelatedPerson>? relatedPeople,
    final List<Website>? websites,
  }) =>
      Contact(
        addresses: addresses ?? this.addresses,
        chats: chats ?? this.chats,
        customFields: customFields ?? this.customFields,
        emails: emails ?? this.emails,
        events: events ?? this.events,
        internetCalls: internetCalls ?? this.internetCalls,
        name: name ?? this.name,
        notes: notes ?? this.notes,
        organization: organization ?? this.organization,
        phones: phones ?? this.phones,
        relatedPeople: relatedPeople ?? this.relatedPeople,
        websites: websites ?? this.websites,
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
        _addressesKey: addresses?.map((final a) => a.toMap()).toList(),
        _chatsKey: chats?.map((final c) => c.toMap()).toList(),
        _customFieldsKey: customFields?.map((final c) => c.toMap()).toList(),
        _emailsKey: emails?.map((final e) => e.toMap()).toList(),
        _eventsKey: events?.map((final e) => e.toMap()).toList(),
        _internetCallsKey: internetCalls?.map((final i) => i.toMap()).toList(),
        _nameKey: name.toMap(),
        _notesKey: notes,
        _organizationKey: organization?.toMap(),
        _phonesKey: phones?.map((final p) => p.toMap()).toList(),
        _relatedPeopleKey: relatedPeople?.map((final r) => r.toMap()).toList(),
        _websitesKey: websites?.map((final w) => w.toMap()).toList(),
      };

  @override
  bool operator ==(covariant final Contact other) {
    if (identical(this, other)) return true;

    return const DeepCollectionEquality().equals(other.addresses, addresses) &&
        const DeepCollectionEquality().equals(other.chats, chats) &&
        const DeepCollectionEquality()
            .equals(other.customFields, customFields) &&
        const DeepCollectionEquality().equals(other.emails, emails) &&
        const DeepCollectionEquality().equals(other.events, events) &&
        const DeepCollectionEquality()
            .equals(other.internetCalls, internetCalls) &&
        other.name == name &&
        other.notes == notes &&
        other.organization == organization &&
        const DeepCollectionEquality().equals(other.phones, phones) &&
        const DeepCollectionEquality()
            .equals(other.relatedPeople, relatedPeople) &&
        const DeepCollectionEquality().equals(other.websites, websites);
  }

  @override
  int get hashCode => Object.hashAll([
        addresses,
        chats,
        customFields,
        emails,
        events,
        internetCalls,
        name,
        notes,
        organization,
        phones,
        relatedPeople,
        websites,
      ]);

  @override
  String toString() => 'Contact(addresses: $addresses, chats: $chats,'
      ' customFields: $customFields, emails: $emails, events: $events,'
      ' internetCalls: $internetCalls, name: $name, notes: $notes,'
      ' organization: $organization, phones: $phones, relatedPeople:'
      ' $relatedPeople, websites: $websites)';
}
