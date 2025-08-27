import 'package:bookly/core/utils/extensions_methods.dart';
import 'package:flutter/material.dart';

import '../../view_model/search_cubit/search_cubit.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: SearchCubit.get(context).searchController,
      maxLines: 1,
      cursorColor: Colors.white,
      textInputAction: TextInputAction.search,
      onEditingComplete: () {
        if (SearchCubit.get(context).searchController.text.isNotEmpty) {
          SearchCubit.get(context).fetchSearchedBooks(
            bookName: SearchCubit.get(context).searchController.text,
          );
        }
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "search".translate(context: context),
      ),
    );
  }
}
