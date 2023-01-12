import 'package:flutter/material.dart';

class MessageBubbleWidget extends StatelessWidget {
  final String message;
  final bool myMessage;
  final bool show;

  const MessageBubbleWidget(
    this.message, {
    this.myMessage = false,
    this.show = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        color: show ? null : Colors.transparent,
        alignment: myMessage ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 250),
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: show ? null : const Color(0xff2b2540),
            ),
            padding: const EdgeInsets.all(8),
            child: Text(
              message,
              style: TextStyle(
                color: show ? Colors.white : Colors.transparent,
              ),
            ),
          ),
        ),
      );
}
