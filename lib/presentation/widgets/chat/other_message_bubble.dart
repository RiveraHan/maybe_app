import 'package:flutter/material.dart';
import 'package:maybe_app/presentation/widgets/chat/image_bubble.dart';

class OtherMessageBubble extends StatelessWidget {
  const OtherMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                'Other messages',
                style: TextStyle(color: colors.onSecondary),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        const ImageBubble(),
        const SizedBox(height: 10)
      ],
    );
  }
}
