import 'package:bookly/core/cubit/app_cubit.dart';
import 'package:bookly/core/cubit/app_state.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/extensions_methods.dart';
import 'package:bookly/core/widgets/build_row_item.dart';
import 'package:bookly/core/widgets/custom_divider.dart';
import 'package:bookly/core/widgets/custom_option_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constants.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Center(
                  child: Image.asset(
                    AssetsData.logo,
                    height: 40.h,
                    color: cubit.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 70.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                  child: InkWell(
                    splashColor: cubit.textColor.withOpacity(0.0),
                    highlightColor: cubit.textColor.withOpacity(0.0),
                    onTap: () => cubit.changeLanguageContainerStatus(),
                    child: CustomRowItem(
                      iconData: Icons.language,
                      text: "language".translate(context: context),
                      arrowStatus: cubit.isLanguageContainerOpen,
                    ),
                  ),
                ),
                if (cubit.isLanguageContainerOpen) ...[
                  SizedBox(height: 10.h),
                  const CustomDivider(),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: CustomOptionRow(
                        title: currentLocaleApp.languageCode == "en"
                            ? "arabicLanguage".translate(context: context)
                            : "englishLanguage".translate(context: context),
                        icon: Icons.translate_outlined,
                        isActive: currentLocaleApp.languageCode == "en"
                            ? false
                            : true,
                        onChange: (value) {
                          if (value == true) {
                            cubit.changeAppLanguage(locale: const Locale('ar'));
                          } else if (value == false) {
                            cubit.changeAppLanguage(locale: const Locale('en'));
                          }
                        }),
                  ),
                ],
                Divider(
                  color: cubit.primaryColor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                  child: InkWell(
                    splashColor: cubit.textColor.withOpacity(0.0),
                    highlightColor: cubit.textColor.withOpacity(0.0),
                    onTap: () => cubit.changeThemeContainerStatus(),
                    child: CustomRowItem(
                      iconData: Icons.brightness_4,
                      text: "theme".translate(context: context),
                      arrowStatus: cubit.isThemeContainerOpen,
                    ),
                  ),
                ),
                if (cubit.isThemeContainerOpen) ...[
                  SizedBox(height: 20.h),
                  const CustomDivider(),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: CustomOptionRow(
                        title: Theme.of(context).brightness == Brightness.dark
                            ? "lightMode".translate(context: context)
                            : "darkMode".translate(context: context),
                        icon: Icons.dark_mode,
                        isActive: cubit.themeMode,
                        onChange: (value) {
                     cubit.changeTheme();
                        }),
                  ),
                  SizedBox(height: 15.h),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
