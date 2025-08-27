import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'book_reader_state.dart';

class BookReaderCubit extends Cubit<BookReaderState> {
  BookReaderCubit() : super(BookReaderState(fontSize: 16, isDark: false));

  void changeFontSize(double newSize) {
    emit(state.copyWith(fontSize: newSize));
  }

  void toggleTheme() {
    emit(state.copyWith(isDark: !state.isDark));
  }
}
