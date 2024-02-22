import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/Features/home/presentation/controllers/newest_books_cubit/newest_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksStates> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future fetchNewestBooks() async {
    emit(NewestBooksLoading());

    var result = await fetchNewestBooksUseCase.call();

    result.fold((failure) {
      emit(NewestBooksError(message: failure.message));
    }, (books) {
      emit(NewestBooksSuccess(books: books));
    });
  }
}
