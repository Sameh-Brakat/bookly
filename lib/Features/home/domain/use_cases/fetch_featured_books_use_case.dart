import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repositories/home_repository.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepository homeRepository;

  FetchFeaturedBooksUseCase(this.homeRepository);

  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    return homeRepository.fetchFeaturedBooks();
  }
}
