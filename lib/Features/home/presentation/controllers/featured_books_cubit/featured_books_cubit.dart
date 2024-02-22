import 'package:bookly/Features/home/presentation/controllers/featured_books_cubit/featured_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates> {
  FeaturedBooksCubit() : super(FeaturedBooksInitial());
}
