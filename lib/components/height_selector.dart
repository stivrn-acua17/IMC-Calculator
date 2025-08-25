import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_color.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final double height;
  final Function(double) onHeightChange;

  const HeightSelector({
    super.key,
    required this.height,
    required this.onHeightChange
  });

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text('ALTURA', style: TextStyles.bodyText),
            ),
            Text('${widget.height.toStringAsFixed(0)} cm', 
                style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold)),
            
            Slider(
              value: widget.height, 
              onChanged: (newHeight){
                widget.onHeightChange(newHeight);
              }, 
              min: 150, 
              max: 220, 
              divisions: 70,
              label: '${widget.height.toStringAsFixed(0)} cm', 
              activeColor: AppColors.primary
            )
          ],
        ),
      ),
    );
  }
}