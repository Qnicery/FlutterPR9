import 'package:flutter/material.dart';

class CityButton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const CityButton({super.key, required this.text, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(text),
        selected: selected,
        onSelected: (_) => onTap(),
      ),
    );
  }
}