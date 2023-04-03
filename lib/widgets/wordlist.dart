import 'package:flutter/material.dart';
import 'package:it_termens/database/database_helper.dart';
import 'package:it_termens/utils/constants.dart';
import 'package:it_termens/widgets/word_item.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/main_provider.dart';

class Wordlist extends StatefulWidget {
  const Wordlist({Key? key}) : super(key: key);

  @override
  State<Wordlist> createState() => _WordlistState();
}

class _WordlistState extends State<Wordlist> {
  @override
  void initState() {
    super.initState();
    loadDb();
  }

  Future<void> loadDb() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoaded = prefs.getBool(Constants.IS_DATABASE_INIT) ?? false;

    if (!isLoaded) {
      await DatabaseHelper.instance.loadDB(context);
    }
    updateQuery();
  }

  @override
  Widget build(BuildContext context) {
    updateQuery();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 3,
      child: Consumer<MainProvider>(
        builder: (context, data, child) {
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 10),
            itemBuilder: (context, index) {
              return WordItem(data.words[index]);
            },
            itemCount: data.words.length,
          );
        },
      ),
    );
  }

  void updateQuery({
    String? word,
  }) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    mainProvider.initList(word: word);
  }
}
