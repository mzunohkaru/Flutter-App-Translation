import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_translation_app/utils/constants.dart';
import 'package:flutter_translation_app/widgets/chips_widget.dart';
import 'package:flutter_translation_app/widgets/slidable_action_widget.dart';
import 'package:flutter_translation_app/widgets/translation_card_widget.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

class MainPage extends HookWidget {
  final flutterTts = FlutterTts();
  final translator = GoogleTranslator();

  final List<String> _languagesCode = [
    'en',
    'ja',
    'zh-cn',
    'ko',
    'fr',
    'es',
    'de',
    'it',
    'ru',
    'hi',
  ];

  MainPage({super.key});

  Future speak({required String languageCode, required String text}) async {
    await flutterTts.setLanguage(languageCode);
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(1);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    final us = useState(true);
    final uk = useState(true);
    final ja = useState(true);
    final cn = useState(true);
    final ko = useState(true);
    final fr = useState(true);
    final es = useState(true);
    final de = useState(true);
    final it = useState(true);
    final ru = useState(true);
    final hi = useState(true);

    final loading = useState(false);
    final translatedTextList = useState<List<String>>([]);
    final searchTextController = useTextEditingController();

    Future translate() async {
      List<String> translatedTexts = [];
      loading.value = true;
      try {
        for (String code in _languagesCode) {
          final translation =
              await translator.translate(searchTextController.text, to: code);
          final translatedText = translation.text;
          if (translatedText.isEmpty) {
            throw Exception('翻訳に失敗しました。');
          }
          translatedTexts.add(translatedText);
        }
        translatedTextList.value = translatedTexts;
      } catch (e) {
        print(e); // 実際のアプリケーションでは、エラーハンドリングを適切に行う必要があります。
        translatedTextList.value = [];
      } finally {
        loading.value = false;
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              // Search TextField
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 8,
                          child: CupertinoTextField(
                            minLines: 5,
                            maxLines: 8,
                            controller: searchTextController,
                            placeholderStyle:
                                const TextStyle(color: Colors.black45),
                            placeholder: "テキストを入力またはペーストしてください。",
                            onChanged: (value) async {
                              await Future.delayed(const Duration(seconds: 3));
                              if (value == searchTextController.text) {
                                if (searchTextController.text.isNotEmpty) {
                                  translate();
                                }
                              }
                            },
                            suffix: searchTextController.text.isNotEmpty
                                ? CupertinoButton(
                                    child: const Icon(CupertinoIcons.clear),
                                    onPressed: () {
                                      searchTextController.clear();
                                    },
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ],
                  )),

              //
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Visibility(
                      visible: us.value,
                      child: Slidable(
                        endActionPane: ActionPane(
                          extentRatio: 0.2,
                          motion: const ScrollMotion(),
                          children: [
                            SlidableActionWidget(
                                countryCode: us, label: 'Remove'),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (translatedTextList.value.isNotEmpty) {
                              speak(
                                  languageCode: "en-US",
                                  text: translatedTextList.value[0]);
                            }
                          },
                          child: TranslationCard(
                              context: context,
                              translatedTextList: translatedTextList,
                              lang: "en-US",
                              tt: 0,
                              countryImage: "assets/country/united-states.png",
                              countryName: "United States American",
                              decoration: langDecoration1,
                              delay: 5),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: uk.value,
                      child: Slidable(
                        endActionPane: ActionPane(
                          extentRatio: 0.2,
                          motion: const ScrollMotion(),
                          children: [
                            SlidableActionWidget(
                                countryCode: uk, label: 'Remove'),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (translatedTextList.value.isNotEmpty) {
                              speak(
                                  languageCode: "en-GB",
                                  text: translatedTextList.value[0]);
                            }
                          },
                          child: TranslationCard(
                              context: context,
                              translatedTextList: translatedTextList,
                              lang: "en-GB",
                              tt: 0,
                              countryImage: "assets/country/united-kingdom.png",
                              countryName: "United Kingdom",
                              decoration: langDecoration2,
                              delay: 4),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: ja.value,
                      child: Slidable(
                        endActionPane: ActionPane(
                          extentRatio: 0.2,
                          motion: const ScrollMotion(),
                          children: [
                            SlidableActionWidget(countryCode: ja, label: '削除'),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (translatedTextList.value.isNotEmpty) {
                              speak(
                                  languageCode: "ja-JP",
                                  text: translatedTextList.value[1]);
                            }
                          },
                          child: TranslationCard(
                              context: context,
                              translatedTextList: translatedTextList,
                              lang: "ja-JP",
                              tt: 1,
                              countryImage: "assets/country/japan.png",
                              countryName: "日本",
                              decoration: langDecoration1,
                              delay: 4.5),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: cn.value,
                      child: Slidable(
                        endActionPane: ActionPane(
                          extentRatio: 0.2,
                          motion: const ScrollMotion(),
                          children: [
                            SlidableActionWidget(countryCode: cn, label: '消除'),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (translatedTextList.value.isNotEmpty) {
                              speak(
                                  languageCode: "zh-CN",
                                  text: translatedTextList.value[2]);
                            }
                          },
                          child: TranslationCard(
                              context: context,
                              translatedTextList: translatedTextList,
                              lang: "zh-CN",
                              tt: 2,
                              countryImage: "assets/country/china.png",
                              countryName: "中国",
                              decoration: langDecoration2,
                              delay: 3),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: ko.value,
                      child: Slidable(
                        endActionPane: ActionPane(
                          extentRatio: 0.2,
                          motion: const ScrollMotion(),
                          children: [
                            SlidableActionWidget(
                                countryCode: ko, label: '제거하다'),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (translatedTextList.value.isNotEmpty) {
                              speak(
                                  languageCode: "ko-KR",
                                  text: translatedTextList.value[3]);
                            }
                          },
                          child: TranslationCard(
                              context: context,
                              translatedTextList: translatedTextList,
                              lang: "ko-KR",
                              tt: 3,
                              countryImage: "assets/country/korea.png",
                              countryName: "한국",
                              decoration: langDecoration1,
                              delay: 3.5),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: fr.value,
                      child: Slidable(
                        endActionPane: ActionPane(
                          extentRatio: 0.2,
                          motion: const ScrollMotion(),
                          children: [
                            SlidableActionWidget(
                                countryCode: fr, label: 'Supprimer'),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (translatedTextList.value.isNotEmpty) {
                              speak(
                                  languageCode: "fr-FR",
                                  text: translatedTextList.value[4]);
                            }
                          },
                          child: TranslationCard(
                              context: context,
                              translatedTextList: translatedTextList,
                              lang: "fr-FR",
                              tt: 4,
                              countryImage: "assets/country/france.png",
                              countryName: "France",
                              decoration: langDecoration2,
                              delay: 3),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: es.value,
                      child: Slidable(
                        endActionPane: ActionPane(
                          extentRatio: 0.2,
                          motion: const ScrollMotion(),
                          children: [
                            SlidableActionWidget(
                                countryCode: es, label: 'Borrar'),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (translatedTextList.value.isNotEmpty) {
                              speak(
                                  languageCode: "es-ES",
                                  text: translatedTextList.value[5]);
                            }
                          },
                          child: TranslationCard(
                              context: context,
                              translatedTextList: translatedTextList,
                              lang: "es-ES",
                              tt: 5,
                              countryImage: "assets/country/spain.png",
                              countryName: "España",
                              decoration: langDecoration1,
                              delay: 2.5),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: de.value,
                      child: Slidable(
                        endActionPane: ActionPane(
                          extentRatio: 0.2,
                          motion: const ScrollMotion(),
                          children: [
                            SlidableActionWidget(
                                countryCode: de, label: 'Supprimer'),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (translatedTextList.value.isNotEmpty) {
                              speak(
                                  languageCode: "de-DE",
                                  text: translatedTextList.value[6]);
                            }
                          },
                          child: TranslationCard(
                              context: context,
                              translatedTextList: translatedTextList,
                              lang: "de-DE",
                              tt: 6,
                              countryImage: "assets/country/germany.png",
                              countryName: "Deutschland",
                              decoration: langDecoration2,
                              delay: 2),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: it.value,
                      child: Slidable(
                        endActionPane: ActionPane(
                          extentRatio: 0.2,
                          motion: const ScrollMotion(),
                          children: [
                            SlidableActionWidget(
                                countryCode: it, label: 'löschen'),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (translatedTextList.value.isNotEmpty) {
                              speak(
                                  languageCode: "it-IT",
                                  text: translatedTextList.value[7]);
                            }
                          },
                          child: TranslationCard(
                              context: context,
                              translatedTextList: translatedTextList,
                              lang: "it-IT",
                              tt: 7,
                              countryImage: "assets/country/italy.png",
                              countryName: "Italia",
                              decoration: langDecoration1,
                              delay: 1.5),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: ru.value,
                      child: Slidable(
                        endActionPane: ActionPane(
                          extentRatio: 0.2,
                          motion: const ScrollMotion(),
                          children: [
                            SlidableActionWidget(
                                countryCode: ru, label: 'löschen'),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (translatedTextList.value.isNotEmpty) {
                              speak(
                                  languageCode: "ru-RU",
                                  text: translatedTextList.value[8]);
                            }
                          },
                          child: TranslationCard(
                              context: context,
                              translatedTextList: translatedTextList,
                              lang: "ru-RU",
                              tt: 8,
                              countryImage: "assets/country/russia.png",
                              countryName: "Россия",
                              decoration: langDecoration2,
                              delay: 1),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: hi.value,
                      child: Slidable(
                        endActionPane: ActionPane(
                          extentRatio: 0.2,
                          motion: const ScrollMotion(),
                          children: [
                            SlidableActionWidget(
                                countryCode: hi, label: 'eliminare'),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (translatedTextList.value.isNotEmpty) {
                              speak(
                                  languageCode: "hi-IN",
                                  text: translatedTextList.value[9]);
                            }
                          },
                          child: TranslationCard(
                              context: context,
                              translatedTextList: translatedTextList,
                              lang: "hi-IN",
                              tt: 9,
                              countryImage: "assets/country/india.png",
                              countryName: "Hindu",
                              decoration: langDecoration1,
                              delay: 0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ChipsWidget(
                        us: us,
                        uk: uk,
                        ja: ja,
                        cn: cn,
                        ko: ko,
                        fr: fr,
                        es: es,
                        de: de,
                        it: it,
                        ru: ru,
                        hi: hi),
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
