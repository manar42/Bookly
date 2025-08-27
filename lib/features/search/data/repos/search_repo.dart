import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../home/data/models/book_model/book_model.dart';

abstract class SearchRepository{
  Future<Either<Failure,List<BookModel>>> fetchSearchedBooks({required String bookName});
}