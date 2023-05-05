import 'package:flutter/material.dart';
import 'package:maybe_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:maybe_app/presentation/widgets/chat/other_message_bubble.dart';

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
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      return (index % 2 == 0)
                          ? const OtherMessageBubble()
                          : const MyMessageBubble();
                    })),
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
