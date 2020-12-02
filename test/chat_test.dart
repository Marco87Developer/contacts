import 'package:contacts/src/models/chat.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Chat.fromMap()', () {
    Map<String, dynamic> map = {
      'chat': 'Chat name',
      'label': 'The label for this chat',
    };

    expect(
      Chat.fromMap(map),
      Chat(chat: 'Chat name', label: 'The label for this chat'),
    );
  });

  test('toMap()', () {
    Chat chat = Chat(chat: 'Chat name', label: 'The label for this chat');

    expect(
      chat.toMap(),
      {'chat': 'Chat name', 'label': 'The label for this chat'},
    );
  });

  test('compareTo()', () {
    Chat chat1 = Chat(chat: 'Chat 1', label: 'Label 1');
    Chat chat2 = Chat(chat: 'Chat 2', label: 'Label 2');

    expect(chat1.compareTo(chat2), -1);
    expect(chat2.compareTo(chat1), 1);
    expect(chat1 < chat2, true);
    expect(chat1 <= chat2, true);
    expect(chat1 == chat2, false);
    expect(chat1 >= chat2, false);
    expect(chat1 > chat2, false);
  });
}
