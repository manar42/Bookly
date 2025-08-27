import 'package:bookly/core/utils/localizations.dart';
import 'package:flutter/material.dart';


// Todo: use this extension to get the value for specific key from json file
extension TranslateKey on String
{
  String translate({required BuildContext context}){
    return MyLocalizations.getInstance(context: context)!.getValueFromJsonData(key: this);  // Todo: this == String value that will be used to call this extension
  }
}