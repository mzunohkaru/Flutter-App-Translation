import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translation_app/utils/snack_bar.dart';

class TranslationCard extends StatelessWidget {
  final BuildContext context;
  final ValueNotifier<List<String>> translatedTextList;
  final String lang;
  final int tt;
  final String countryImage;
  final String countryName;
  final LinearGradient decoration;
  final double delay;

  const TranslationCard(
      {super.key,
      required this.context,
      required this.translatedTextList,
      required this.lang,
      required this.tt,
      required this.countryImage,
      required this.countryName,
      required this.decoration,
      required this.delay});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 6,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            children: [
              Column(
                children: [
                  Image.asset(
                    countryImage,
                    width: 50,
                  ),
                  translatedTextList.value.isEmpty
                      ? Container()
                      : const Icon(
                          Icons.record_voice_over,
                          color: Colors.black,
                        )
                ],
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextSelectionTheme(
                  data: const TextSelectionThemeData(),
                  child: Text(
                    translatedTextList.value.isEmpty
                        ? countryName
                        : translatedTextList.value[tt],
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: translatedTextList.value.isEmpty
                    ? null
                    : Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                final data = ClipboardData(
                                    text: translatedTextList.value[tt]);
                                Clipboard.setData(data);

                                showSnackbar(
                                    context: context,
                                    lang: lang,
                                    countryImage: countryImage);
                              },
                              icon: const Icon(
                                Icons.copy,
                                color: Colors.black,
                              )),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
