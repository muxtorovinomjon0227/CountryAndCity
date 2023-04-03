import 'package:flutter/material.dart';
import 'package:it_termens/database/database_helper.dart';
import 'package:it_termens/models/word.dart';

class MainProvider extends ChangeNotifier {
  final List<Word> words = [];
  bool showCity = false;

  initList({String? word, bool? isCity}) async {
    words.clear();
    if (word == null) {
      words.addAll(await DatabaseHelper.instance.getWords());
    } else {
      words.addAll(await DatabaseHelper.instance.getWordLike(word));
    }
    notifyListeners();
  }
}
