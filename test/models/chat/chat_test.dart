import 'dart:io';

import 'package:contacts/src/models/chat.dart';
import 'package:test/test.dart';

void main() {
  group('The transitive and the symmetric property:', () {
    test(
      'The transitive property: if [b] = [a] and [c] = [b], then [c] = [a].',
      () {
        const Chat a = Chat(
          chat: 'chat',
          label: 'label',
        );
        const Chat b = a;
        const Chat c = b;
        expect(c, a);
      },
    );
    test(
      'The symmetric property: if [a] = [b], then [b] = [a].',
      () {
        const Chat a = Chat(
          chat: 'chat',
          label: 'label',
        );
        const Chat b = Chat(
          chat: 'chat',
          label: 'label',
        );
        expect(a, b);
        expect(b, a);
      },
    );
  });

  group('factory Chat.fromJson', () {
    test(
        'If the JSON string is a valid representation of an [Chat], must'
        ' construct an [Chat] instance.', () async {
      final file = File('test/models/chat/chat_test.json');
      final json = await file.readAsString();
      expect(
        Chat.fromJson(json),
        const Chat(
          chat: 'chat',
          label: 'label',
        ),
        reason: 'The JSON string is a valid representation of an [Chat]'
            ' instance.',
      );
    });
    test(
        'If the JSON string is not a valid representation of a [Chat], this'
        ' constructor must throw a [FormatException].', () async {
      final file1 = File('test/models/chat/chat_not_valid_1_test.json');
      final json1 = await file1.readAsString();
      expect(
        () => Chat.fromJson(json1),
        throwsFormatException,
        reason: 'Required parameter "chat" is not present.',
      );
      final file2 = File('test/models/chat/chat_not_valid_2_test.json');
      final json2 = await file2.readAsString();
      expect(
        () => Chat.fromJson(json2),
        throwsFormatException,
        reason: 'The JSON file contains only an empty object.',
      );
    });
  });

  group('Chat.fromMap', () {
    test(
        'If the map is a valid representation of a [Chat] instance, this'
        ' constructor must create that instance.', () {
      final Map<String, dynamic> map = {
        'chat': 'chat',
        'label': 'label',
      };
      expect(
        Chat.fromMap(map),
        const Chat(
          chat: 'chat',
          label: 'label',
        ),
      );
    });
    test(
        'If the map is not a valid representation of a [Chat] instance, this'
        ' constructor must throw an [Error].', () {
      final Map<String, dynamic> invalidMap = {
        'label': 'label',
      };
      expect(
        () => Chat.fromMap(invalidMap),
        throwsFormatException,
        reason: '[invalidMap] does not contain "chat" key.',
      );
    });
  });
}
