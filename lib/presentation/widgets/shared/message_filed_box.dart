import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: colors.tertiaryContainer),
        borderRadius: BorderRadius.circular(50));
    final focusNode = FocusNode();

    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      onTapOutside: (event) => focusNode.unfocus(),
      decoration: InputDecoration(
        hintText: 'Mensaje',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            onValue(textValue);
            textController.clear();
          },
        ),
      ),
      onFieldSubmitted: (value) {
        focusNode.requestFocus();
        textController.clear();
        onValue(value);
      },
    );
  }
}
