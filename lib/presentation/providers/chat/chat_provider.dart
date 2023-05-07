import 'package:flutter/material.dart';
import 'package:maybe_app/config/helpers/get_yes_no_answer.dart';
import 'package:maybe_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final getYesNoAnswer = GetYesNoAnswer();
  final chatScrollController = ScrollController();
  List<Message> messagesList = [];

  Future<void> sendMessages(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);

    if (text.endsWith('?')) await reply();

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> reply() async {
    final messageGif = await getYesNoAnswer.getAnswer();
    messagesList.add(messageGif);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
