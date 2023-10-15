import 'package:flutter/material.dart';

class SeasonWidget extends StatelessWidget {
  const SeasonWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text.rich(
        TextSpan(children: [
          const TextSpan(
              text: 'Tahun rilis : ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          TextSpan(text: text)
        ]),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
