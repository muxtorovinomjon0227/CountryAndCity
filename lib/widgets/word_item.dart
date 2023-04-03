import 'package:flutter/material.dart';
import 'package:it_termens/models/word.dart';

class WordItem extends StatelessWidget {
  final Word word;
  const WordItem(this.word, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              word.country ?? " ....",
              style: const TextStyle(fontSize: 26),
            ),
          )
        ],
      ),
    );
  }
}
