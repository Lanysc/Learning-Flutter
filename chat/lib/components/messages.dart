import 'package:chat/components/message_bubble.dart';
import 'package:chat/cores/models/chat_message.dart';
import 'package:chat/cores/services/auth/auth_service.dart';
import 'package:chat/cores/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;
    return StreamBuilder<List<ChatMessage>>(
      stream: ChatService().messagesStream(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text('Sem Dados. Vamos conversar ?'),
          );
        } else {
          final msgs = snapshot.data!;
          return ListView.builder(
            reverse: true,
            itemBuilder: (context, index) => MessageBubble(
              key: ValueKey(msgs[index].id),
              message: msgs[index],
              belongsToCurrentUser: currentUser?.id == msgs[index].userId,
            ),
            itemCount: msgs.length,
          );
        }
      }),
    );
  }
}
