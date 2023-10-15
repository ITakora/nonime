import 'package:flutter/material.dart';

class GenreTextWidget extends StatelessWidget {
  const GenreTextWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text.rich(
        TextSpan(children: [
          const TextSpan(
              text: 'Genre : ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          TextSpan(text: text)
        ]),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
