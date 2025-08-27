
import 'package:bookly/features/search/presentation/views/widgets/search_no_data_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../home/presentation/views/shimmer/shimmer_newset_list_view.dart';
import '../../../../home/presentation/views/widgets/best_seller_list_view_item.dart';
import '../../view_model/search_cubit/search_cubit.dart';
import '../../view_model/search_cubit/search_state.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is SearchSuccessState) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 10.0.h),
          itemCount: state.books.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: (){
              GoRouter.of(context).push(
                AppRouter.kBookDetailsView,
                extra: state.books[index],
              );
            },
            child: BestSellerListViewItem(
              bookModel: state.books[index],
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 15.0.h),
        );
      } else if (state is SearchFailureState) {
        return CustomErrorWidget(errMessage: state.error);
      } else if(state is SearchLoadingState){
        return const ShimmerNewestListView();
      }else{
        return const SearchNoDataBody();
      }
    });
  }
}