import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/data/services/word_sevice.dart';

import '../../models/word_res_model.dart';

part 'word_state.dart';

class WordCubit extends Cubit<WordState> {
  WordCubit() : super(WordInitial());

  final WordService _wordService = WordService();

  Future<void> getMeanings({required String word}) async {
    emit(WordLoading());
    try {
      final response = await _wordService.getWordDetails(word);
      emit(WordSuccess(wordResModel: response));
    } on SocketException {
      emit(NoInternetConnection());
    } catch (e) {
      emit(WordFailure());
    }
  }
}
