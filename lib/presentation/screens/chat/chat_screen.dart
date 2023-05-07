import 'package:flutter/material.dart';
import 'package:maybe_app/domain/entities/message.dart';
import 'package:maybe_app/presentation/providers/chat/chat_provider.dart';
import 'package:maybe_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:maybe_app/presentation/widgets/chat/other_message_bubble.dart';
import 'package:provider/provider.dart';

import '../../widgets/shared/message_filed_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.datocms-assets.com/55010/1631448986-1609827492810345-modelo.jpg?auto=format&fit=max&w=1200'),
            )),
        title: const Text('Mi amor ❤'),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messagesList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messagesList[index];
                      return (message.fromWho == FromWho.others)
                          ? OtherMessageBubble(
                              message: message,
                            )
                          : MyMessageBubble(
                              message: message,
                            );
                    })),
            MessageFieldBox(
              onValue: (String value) => chatProvider.sendMessages(value),
            ),
            const SizedBox(height: 5)
          ],
        ),
      ),
    );
  }
}
