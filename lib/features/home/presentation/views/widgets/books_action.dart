import 'package:bookly/core/utils/extensions_methods.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../constants.dart';
import '../../../../../core/cubit/app_cubit.dart';
import 'package:bookly/features/reader/presentation/views/book_reader_view.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/book_model/book_model.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: "free".translate(context: context),
              backgroundColor: AppCubit().primaryColor,
              textColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
              borderRadius: currentLocaleApp.languageCode == "en"
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    )
                  : const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                final pdfUrl = bookModel.accessInfo?.pdf?.acsTokenLink;
                if (pdfUrl != null && pdfUrl.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SfPdfViewer.network(pdfUrl),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookReaderView(
                        bookContent: bookModel.volumeInfo.description ??
                            "No content available.",
                      ),
                    ),
                  );
                }
              },
              fontSize: 16,
              text: getText(bookModel, context),
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: currentLocaleApp.languageCode == "en"
                  ? const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
            ),
          )
        ],
      ),
    );
  }

  String getText(BookModel bookModel, context) {
    if (bookModel.accessInfo!.pdf == null) {
      return "notAvailable".translate(context: context);
    } else {
      return "download".translate(context: context);
    }
  }
}
