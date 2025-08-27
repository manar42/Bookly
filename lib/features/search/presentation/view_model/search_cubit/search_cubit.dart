import 'package:bookly/features/search/presentation/view_model/search_cubit/search_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../home/data/models/book_model/book_model.dart';
import '../../../data/repos/search_repo.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepository) : super(SearchInitialState());

  final SearchRepository searchRepository;

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> fetchSearchedBooks({required String bookName}) async {
    emit(SearchLoadingState());
    Either<Failure, List<BookModel>> result;
    result = await searchRepository.fetchSearchedBooks(bookName: bookName);
    result.fold((failure) {
      emit(SearchFailureState(failure.errMessage));
    }, (books) {
      emit(SearchSuccessState(books));
    });
  }

  TextEditingController searchController = TextEditingController();
}
