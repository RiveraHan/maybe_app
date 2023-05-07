import 'package:flutter/material.dart';
import 'package:maybe_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                message.text,
                style: TextStyle(color: colors.onPrimary),
              )),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
