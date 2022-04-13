import 'package:wordy/data/models/word_res_model.dart';

class ListItemModel {
  final bool hasData;
  final WordResModel? wordResModel;
  final String word;
  ListItemModel({
    this.wordResModel,
    required this.hasData,
    required this.word,
  });
}
