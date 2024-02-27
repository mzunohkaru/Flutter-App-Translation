import 'package:flutter/material.dart';
import 'package:flutter_translation_app/utils/copy_text.dart';

void showSnackbar({
  required BuildContext context,
  required String lang,
  required String countryImage,
}) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
    margin: const EdgeInsetsDirectional.all(16),
    content: Row(
      children: [
        Image.asset(
          countryImage,
          width: 50,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Icon(
            Icons.check,
            color: Colors.green,
          ),
        ),
        Text(
          CheckCopyText(lang),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    showCloseIcon: true,
    elevation: 4.0,
    backgroundColor: Colors.black,
    closeIconColor: Colors.green,
    clipBehavior: Clip.hardEdge,
    dismissDirection: DismissDirection.up,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
