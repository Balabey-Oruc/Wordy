part of 'word_cubit.dart';

abstract class WordState extends Equatable {
  const WordState();

  @override
  List<Object> get props => [];
}

class WordInitial extends WordState {}

class WordLoading extends WordState {}

class WordSuccess extends WordState {
  final WordResModel wordResModel;

  const WordSuccess({required this.wordResModel});

  @override
  List<Object> get props => [wordResModel];
}

class WordFailure extends WordState {}

class NoInternetConnection extends WordState {}
