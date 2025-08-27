import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../../../home/data/models/book_model/book_model.dart';

class SearchRepositoryImplementation extends SearchRepository {
  final ApiService apiServicesImplementation;

  SearchRepositoryImplementation(this.apiServicesImplementation);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String bookName}) async {
    try {
      var data = await apiServicesImplementation.get(
        endPoint:'volumes?Filtering=free-ebooks &q=intitle:$bookName',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return Right(books);
    } catch (error) {
      if(error is DioError){
        return Left(ServerFailure.fromDioError(error));
      }
      else{
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}