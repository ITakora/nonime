import 'package:flutter/material.dart';

class SynopsisTextWidget extends StatelessWidget {
  const SynopsisTextWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Text.rich(
        TextSpan(children: [
          const TextSpan(
            text: 'Synopsis : ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextSpan(
            text: text,
          )
        ]),
        // maxLines: 10,
        // overflow: TextOverflow.fade,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
