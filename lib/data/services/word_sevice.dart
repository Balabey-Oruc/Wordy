import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wordy/data/models/word_res_model.dart';

class WordService {
  final String url = "https://api.dictionaryapi.dev/api/v2/entries/en/";
  Future<WordResModel> getWordDetails(String word) async {
    final response = await http.get(Uri.parse(url + word));
    final body = wordResModelFromJson(response.body);
    return body;
  }
}
