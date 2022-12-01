import 'dart:convert';

import 'package:meta/meta.dart';

const String _chatKey = 'chat';
const String _labelKey = 'label';

/// A chat.
///
/// {@template contacts.chat.oncecreatednopropertiesmaybechanged}
/// Once created, no properties of a [Chat] object may be changed.
/// {@endtemplate}
///
@immutable
class Chat {
  /// Constructs a [Chat] instance.
  ///
  /// {@macro contacts.chat.oncecreatednopropertiesmaybechanged}
  ///
  const Chat({
    required this.chat,
    this.label,
  });

  /// Constructs an [Chat] instance **from a [json] string**.
  ///
  /// {@macro contacts.chat.oncecreatednopropertiesmaybechanged}
  ///
  factory Chat.fromJson(final String json) =>
      Chat.fromMap(jsonDecode(json) as Map<String, dynamic>);

  /// Constructs an [Chat] instance **from a [map]**.
  ///
  /// {@macro contacts.chat.oncecreatednopropertiesmaybechanged}
  ///
  Chat.fromMap(final Map<String, dynamic> map)
      : chat = '${map[_chatKey]}',
        label = map[_labelKey] == null ? null : '${map[_labelKey]}';

  /// The chat.
  ///
  final String chat;

  /// The label.
  final String? label;

  /// Creates a **copy** of this [Chat] instance but with the **given fields
  /// replaced** with the new values.
  ///
  Chat copyWith({
    final String? chat,
    final String? label,
  }) =>
      Chat(
        chat: chat ?? this.chat,
        label: label ?? this.label,
      );

  /// Creates a **JSON string representing** this [Chat] instance.
  ///
  /// The resulting JSON string can be parsed back using [Chat.fromJson].
  ///
  String toJson() => jsonEncode(toMap());

  /// Creates a **[Map<String, dynamic>] representing** this [Chat] instance.
  ///
  /// The resulting map can be parsed back using [Chat.fromMap].
  ///
  Map<String, dynamic> toMap() => <String, dynamic>{
        _chatKey: chat,
        _labelKey: label,
      };

  @override
  int get hashCode => Object.hashAll([
        chat,
        label,
      ]);

  @override
  String toString() => 'Chat(chat: $chat, label: $label)';

  @override
  bool operator ==(covariant final Chat other) {
    if (identical(this, other)) return true;

    return other.chat == chat && other.label == label;
  }
}
