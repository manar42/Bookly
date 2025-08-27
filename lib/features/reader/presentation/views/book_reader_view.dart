import 'package:bookly/features/reader/presentation/view_model/book_reader_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookReaderView extends StatelessWidget {
  final String bookContent;
  const BookReaderView({required this.bookContent, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookReaderCubit(),
      child: BlocBuilder<BookReaderCubit, BookReaderState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: state.isDark ? Colors.black : Colors.white,
            appBar: AppBar(
              title: const Text('Book Reader'),
              backgroundColor: state.isDark ? Colors.black : Colors.white,
              iconTheme: IconThemeData(
                color: state.isDark ? Colors.white : Colors.black,
              ),
              actions: [
                IconButton(
                  icon: Icon(state.isDark ? Icons.light_mode : Icons.dark_mode),
                  onPressed: () =>
                      context.read<BookReaderCubit>().toggleTheme(),
                ),
              ],
            ),
            body: Column(
              children: [
                Slider(
                  min: 12,
                  max: 32,
                  value: state.fontSize,
                  onChanged: (v) =>
                      context.read<BookReaderCubit>().changeFontSize(v),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      bookContent,
                      style: TextStyle(
                        fontSize: state.fontSize,
                        color: state.isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
