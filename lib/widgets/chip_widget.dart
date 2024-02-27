import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ChipWidget extends HookWidget {
  final String countryName;

  ChipWidget({super.key, required this.countryName});

  @override
  Widget build(BuildContext context) {
    return Chip(
      elevation: 8.0,
      padding: const EdgeInsets.all(2.0),
      avatar: const CircleAvatar(
        backgroundColor: Colors.redAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 20,
        ),
      ),
      label: Text(countryName),
      backgroundColor: Colors.white,
      shape: const StadiumBorder(
        side: BorderSide(
          width: 1,
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
