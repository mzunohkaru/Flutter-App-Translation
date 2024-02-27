import 'package:flutter/material.dart';
import 'package:flutter_translation_app/widgets/chip_widget.dart';

class ChipsWidget extends StatelessWidget {
  final ValueNotifier<bool> us;
  final ValueNotifier<bool> uk;
  final ValueNotifier<bool> ja;
  final ValueNotifier<bool> cn;
  final ValueNotifier<bool> ko;
  final ValueNotifier<bool> fr;
  final ValueNotifier<bool> es;
  final ValueNotifier<bool> de;
  final ValueNotifier<bool> it;
  final ValueNotifier<bool> ru;
  final ValueNotifier<bool> hi;

  const ChipsWidget(
      {super.key,
      required this.us,
      required this.uk,
      required this.ja,
      required this.cn,
      required this.ko,
      required this.fr,
      required this.es,
      required this.de,
      required this.it,
      required this.ru,
      required this.hi});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Wrap(
        spacing: 4.0,
        runSpacing: 4.0,
        children: [
          Visibility(
            visible: !us.value,
            child: GestureDetector(
                onTap: () {
                  us.value = !us.value;
                },
                child: ChipWidget(countryName: "United States of America")),
          ),
          Visibility(
            visible: !uk.value,
            child: GestureDetector(
                onTap: () {
                  uk.value = !uk.value;
                },
                child: ChipWidget(countryName: "United Kingdom")),
          ),
          Visibility(
            visible: !ja.value,
            child: GestureDetector(
                onTap: () {
                  ja.value = !ja.value;
                },
                child: ChipWidget(countryName: "日本")),
          ),
          Visibility(
            visible: !cn.value,
            child: GestureDetector(
                onTap: () {
                  cn.value = !cn.value;
                },
                child: ChipWidget(countryName: "中国")),
          ),
          Visibility(
            visible: !ko.value,
            child: GestureDetector(
                onTap: () {
                  ko.value = !ko.value;
                },
                child: ChipWidget(countryName: "한국")),
          ),
          Visibility(
            visible: !fr.value,
            child: GestureDetector(
                onTap: () {
                  fr.value = !fr.value;
                },
                child: ChipWidget(countryName: "France")),
          ),
          Visibility(
            visible: !es.value,
            child: GestureDetector(
                onTap: () {
                  es.value = !es.value;
                },
                child: ChipWidget(countryName: "España")),
          ),
          Visibility(
            visible: !de.value,
            child: GestureDetector(
                onTap: () {
                  de.value = !de.value;
                },
                child: ChipWidget(countryName: "Deutschland")),
          ),
          Visibility(
            visible: !it.value,
            child: GestureDetector(
                onTap: () {
                  it.value = !it.value;
                },
                child: ChipWidget(countryName: "Italia")),
          ),
          Visibility(
            visible: !ru.value,
            child: GestureDetector(
                onTap: () {
                  ru.value = !ru.value;
                },
                child: ChipWidget(countryName: "Россия")),
          ),
          Visibility(
            visible: !hi.value,
            child: GestureDetector(
                onTap: () {
                  hi.value = !hi.value;
                },
                child: ChipWidget(countryName: "Hindu")),
          ),
        ],
      ),
    );
  }
}
