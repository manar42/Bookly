import 'package:bookly/core/utils/extensions_methods.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/view_model/newest_books_cubit/newset_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // جلب بيانات الكتب المميزة والجديدة
        await Future.wait([
          // Cubit لجلب الكتب المميزة
          context.read<FeaturedBooksCubit>().fetchFeaturedBooks(),
          // Cubit لجلب أحدث الكتب
          context.read<NewestBooksCubit>().fetchNewestBooks(),
        ]);
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                    ),
                    child: const CustomAppBar()),
                const FeaturedBooksListView(),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                    "newestBooks".translate(context: context),
                    style: Styles.textStyle18,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: const BestSellerListView(),
            ),
          ),
        ],
      ),
    );
  }
}
