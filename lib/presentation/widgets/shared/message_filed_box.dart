import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(50));
    final focusNode = FocusNode();

    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      onTapOutside: (event) => focusNode.unfocus(),
      decoration: InputDecoration(
        hintText: 'Message?',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            print('button: $textValue');
            textController.clear();
          },
        ),
      ),
      onFieldSubmitted: (value) {
        print('Submit: $value');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
