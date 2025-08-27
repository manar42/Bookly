part of 'book_reader_cubit.dart';

class BookReaderState {
  final double fontSize;
  final bool isDark;

  BookReaderState({required this.fontSize, required this.isDark});

  BookReaderState copyWith({double? fontSize, bool? isDark}) {
    return BookReaderState(
      fontSize: fontSize ?? this.fontSize,
      isDark: isDark ?? this.isDark,
    );
  }
}
