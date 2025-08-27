import 'package:bookly/constants.dart';
import 'package:bookly/core/cubit/app_state.dart';
import 'package:bookly/core/helper/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial()){
    int? pcIndex =
    CacheHelper.getData(key: 'primaryColor');
    bool firstMode = CacheHelper.getData(key: "isLight")??false;
    themeMode = firstMode ;
    primaryColorIndex = pcIndex ?? 0;
    primaryColor = defaultColors[primaryColorIndex];
  }

  static AppCubit get(context) => BlocProvider.of(context);

  int primaryColorIndex = 0;

  List defaultColors = [
    kPrimaryBlack,
    kPrimaryWhite,
    Colors.cyan,
    Colors.deepOrange,
    Colors.blue,
    Colors.pink,
    Colors.deepPurple,
    Colors.amber,
    Colors.lime,
    Colors.indigo,
    Colors.orange,
    Colors.green,
    Colors.blueGrey,

  ];
  dynamic primaryColor = kPrimaryyColor;

  void changePrimaryColorIndex(int newIndex, dynamic color) async {
    primaryColorIndex = newIndex;
    primaryColor = color;
    emit(PrimaryColorIndexState());
    //////////////////
    await CacheHelper.saveIntData(
      key: 'primaryColor',
      value: primaryColorIndex,
    );
  }

  bool isLanguageContainerOpen = false;

  void changeLanguageContainerStatus() {
    isLanguageContainerOpen = !isLanguageContainerOpen;
    emit(ChangeLanguageContainerStatusState());
  }

  Future<void> changeAppLanguage({required Locale locale}) async {
    await CacheHelper.saveStringData(key: "current_locale_app",value: locale.languageCode).then((value){
      if( value == true )
      {
        currentLocaleApp = Locale(locale.languageCode);
        emit(ChangeAppLanguageSuccessState());
      }
      else
      {
        emit(ChangeAppLanguageErrorState());
      }
    });
  }

  bool isThemeContainerOpen = false;
  bool themeMode = false;
  Color textColor = Colors.black;
  void changeTheme() {
    themeMode ? themeMode = false : themeMode = true;

    CacheHelper.saveBoolData(key: "isLight", value: themeMode);
    emit(ThemeChangedState());
  }

  void changeThemeContainerStatus() {
    isThemeContainerOpen = !isThemeContainerOpen;
    emit(ChangeThemeContainerStatusState());
  }

  getFirstMode(mode) {
    CacheHelper.saveBoolData(key: "isLight", value: mode);
    themeMode = CacheHelper.getData(key: "isLight");
    emit(GetFirstModeState());
  }

}
