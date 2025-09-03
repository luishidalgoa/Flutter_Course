import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mark Evans'),
        leading: const Padding(
          padding: EdgeInsetsGeometry.all(4),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
              'https://4.bp.blogspot.com/-kskPmJs_xwI/TevYHFfVRNI/AAAAAAAAABk/t_EP2SUz6Vg/s1600/Mark_25.png',
            ),
          ),
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      left: false,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messagesList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messagesList[index];

                  return message.fromWho == FromWho.hers
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),

            //Caja de mensajes
            MessageFieldBox(
              // onValue: (value)=> chatProvider.sendMessage(value)
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
