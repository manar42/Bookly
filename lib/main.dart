import 'package:bookly/core/cubit/app_cubit.dart';
import 'package:bookly/core/helper/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants.dart';
import 'core/cubit/app_state.dart';
import 'core/cubit/bloc_observer.dart';
import 'core/theme/custom_theme.dart';
import 'core/utils/app_router.dart';
import 'core/utils/localizations.dart';
import 'core/utils/service_locator.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'features/home/presentation/view_model/newest_books_cubit/newset_books_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  currentLocaleApp =
      Locale(await CacheHelper.getData(key: "current_locale_app") ?? "en");
  bool firstMode = CacheHelper.getData(key: "isLight") ?? false;
  setupServiceLocator();
  Bloc.observer = AppBlocObserver();
  runApp(MyApp(
    firstMode: firstMode,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.firstMode}) : super(key: key);

  final firstMode;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) => AppCubit()..getFirstMode(firstMode),
        )
      ],
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp.router(
                locale:
                    currentLocaleApp, // Todo: actually App's language ( which will passed to my delegate to get json files )
                localizationsDelegates: [
                  GlobalMaterialLocalizations
                      .delegate, // Todo: get the directions for names for specific widgets depending on Device language
                  GlobalCupertinoLocalizations
                      .delegate, // Todo: get the directions for names for specific widgets depending on Device language
                  GlobalWidgetsLocalizations
                      .delegate, // Todo: get the directions for widgets depending on Device language
                  MyLocalizations
                      .delegate, // Todo: Calling The Delegate which I created to load data from json files
                ],
                supportedLocales: const [
                  Locale("ar"),
                  Locale("en", "US"),
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (locale.languageCode == deviceLocale!.languageCode)
                      return deviceLocale;
                  }
                  return supportedLocales.first;
                },
                routerConfig: AppRouter.router,
                debugShowCheckedModeBanner: false,
                themeMode: AppCubit.get(context).themeMode
                    ? ThemeMode.dark
                    : ThemeMode.light,
                theme: CustomTheme.lightTheme(context),
                darkTheme: CustomTheme.darkTheme(context),
              );
            },
          );
        },
      ),
    );
  }
}
