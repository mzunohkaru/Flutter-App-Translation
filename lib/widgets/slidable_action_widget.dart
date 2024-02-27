import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableActionWidget extends StatelessWidget {
  final ValueNotifier<bool> countryCode;
  final String label;

  const SlidableActionWidget(
      {super.key, required this.countryCode, required this.label});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (_) {
        countryCode.value = !countryCode.value;
      },
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      icon: Icons.delete,
      label: label,
    );
  }
}
