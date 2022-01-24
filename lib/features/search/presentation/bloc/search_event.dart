part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class TypingSearchEvent extends SearchEvent {}

class DoSearchEvent extends SearchEvent {
  final String enteredWord;

  const DoSearchEvent(this.enteredWord);
}

class InitSearchEvent extends SearchEvent {}
