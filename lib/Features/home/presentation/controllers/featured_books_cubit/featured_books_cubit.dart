import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/Features/home/presentation/controllers/featured_books_cubit/featured_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;

  Future fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    var result = await fetchFeaturedBooksUseCase.call();

    result.fold((failure) {
      emit(FeaturedBooksError(message: failure.message));
    }, (books) {
      emit(FeaturedBooksSuccess(books: books));
    });
  }
}
