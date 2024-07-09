import 'package:flutter/material.dart';
import 'package:food_subs/utils/app_colors.dart';

class CustomRadioButton extends StatelessWidget {
  final void Function(bool)? onTap;
  final bool selected;
  final EdgeInsetsGeometry? margin;
  const CustomRadioButton(
      {super.key, this.onTap, required this.selected, this.margin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(!selected),
      child: Container(
        margin: margin,
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: selected ? 6 : 1,
            color: selected ? AppColors.green : Colors.grey,
          ),
        ),
      ),
    );
  }
}
