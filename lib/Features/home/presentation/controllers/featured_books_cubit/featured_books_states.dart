import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class FeaturedBooksStates {}

class FeaturedBooksInitial extends FeaturedBooksStates {}

class FeaturedBooksLoading extends FeaturedBooksStates {}

class FeaturedBooksSuccess extends FeaturedBooksStates {
  final List<BookEntity> books;

  FeaturedBooksSuccess({required this.books});
}

class FeaturedBooksError extends FeaturedBooksStates {
  final String message;

  FeaturedBooksError({required this.message});
}
