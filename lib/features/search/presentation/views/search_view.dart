import 'package:bookly/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../view_model/search_cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left:20.0.w, right: 16.w),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
        ),
        title: const CustomSearchTextField(),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                if(SearchCubit.get(context).searchController.text.isNotEmpty){
                  SearchCubit.get(context).fetchSearchedBooks(
                    bookName: SearchCubit.get(context).searchController.text,
                  );
                }
              },
            ),
          ),
        ],
      ),
      body: const SearchViewBody(),
    );
  }
}