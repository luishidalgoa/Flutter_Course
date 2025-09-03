import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [
    Message(text: 'Hola Mark!', fromWho: FromWho.me, imageUrl: ''),
    Message(
      text: 'Quieres jugar al futbol?',
      imageUrl: '',
      fromWho: FromWho.me,
    ),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    //implementar metodo
    final newMessage = Message(text: text, imageUrl: '', fromWho: FromWho.me);
    messagesList.add(newMessage);

    if (text.endsWith('?')) herReply();

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    
    messagesList.add(herMessage);
    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
