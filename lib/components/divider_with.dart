import 'package:flutter/material.dart';

class DividerWith extends StatelessWidget {
  const DividerWith({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Expanded(child: Divider()),
          Expanded(child: Center(child: Text(text))),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}
