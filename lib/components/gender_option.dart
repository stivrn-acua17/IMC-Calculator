import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_color.dart';
import 'package:imc_calculator/core/text_styles.dart';

class GenderOption extends StatelessWidget {
  final String label;
  final String imagePath;
  final String? isSelected;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;

  const GenderOption({
    super.key,
    required this.label,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
    required this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: Container(
            decoration: BoxDecoration(
                color: isSelected == label
                    ? AppColors.backgroundComponentSelected
                    : AppColors.backgroundComponent,
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Image.asset(imagePath, height: 100),
                  const SizedBox(height: 8),
                  Text(label.toUpperCase(), style: TextStyles.bodyText)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}