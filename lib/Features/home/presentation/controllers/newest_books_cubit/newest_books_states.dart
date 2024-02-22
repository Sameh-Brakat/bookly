import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class NewestBooksStates {}

class NewestBooksInitial extends NewestBooksStates {}

class NewestBooksLoading extends NewestBooksStates {}

class NewestBooksSuccess extends NewestBooksStates {
  final List<BookEntity> books;

  NewestBooksSuccess({required this.books});
}

class NewestBooksError extends NewestBooksStates {
  final String message;

  NewestBooksError({required this.message});
}
