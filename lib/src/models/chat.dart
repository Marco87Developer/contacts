import 'package:flutter/material.dart';

const String _chatKey = 'chat';
const String _labelKey = 'label';

/// This class models a reference to an address.
///
/// It **requires** these fields: `String` [label] and `String` [chat].
///
class Chat implements Comparable {
  const Chat({
    required this.chat,
    required this.label,
  });

  final String chat;
  final String label;

  Chat.fromMap(Map<String, dynamic> map)
      : chat = map[_chatKey],
        label = map[_labelKey];

  Map<String, dynamic> toMap() => {
        _chatKey: chat,
        _labelKey: label,
      };

  /// The order of the comparisons is:
  ///
  /// 1. [label]
  /// 2. [chat]
  ///
  @override
  int compareTo(covariant Chat other) {
    // 1º comparison
    int comparison1 = label.compareTo(other.label);
    if (comparison1 != 0) return comparison1;

    // Last comparison
    int comparison2 = chat.compareTo(other.chat);
    return comparison2;
  }

  @override
  int get hashCode => hashValues(chat, label);

  bool operator <(covariant Chat other) => compareTo(other) < 0;

  bool operator <=(covariant Chat other) => compareTo(other) <= 0;

  bool operator ==(covariant Chat other) => compareTo(other) == 0;

  bool operator >=(covariant Chat other) => compareTo(other) >= 0;

  bool operator >(covariant Chat other) => compareTo(other) > 0;
}
