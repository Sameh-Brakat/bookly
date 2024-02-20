import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/src/response.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewBooks();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var response = await ApiService.getData(
      url: 'volumes',
      query: {
        'Filtering': 'free-ebooks',
        'q': 'programming',
      },
    );
    List<BookEntity> books = getBooksList(response);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewBooks() async {
    var response = await ApiService.getData(
      url: 'volumes',
      query: {
        'Filtering': 'free-ebooks',
        'Sorting': 'newest',
        'q': 'programming',
      },
    );
    List<BookEntity> books = getBooksList(response);
    return books;
  }

  List<BookEntity> getBooksList(Response<dynamic> response) {
    List<BookEntity> books = [];
    for (var book in response.data['items']) {
      books.add(BookModel.fromJson(book));
    }
    return books;
  }
}
