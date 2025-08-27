import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class SearchNoDataBody extends StatelessWidget {
  const SearchNoDataBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
          AssetsData.search,
        height: MediaQuery.of(context).size.width * .8,
        width: MediaQuery.of(context).size.width * .8,
      ),
    );
  }
}
