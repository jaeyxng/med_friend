import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.message, required this.isUserMessage});

  final bool isUserMessage;
  final String message;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isUserMessage ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Markdown(data: message,selectable:true,)),
      ],
    );
  }
}