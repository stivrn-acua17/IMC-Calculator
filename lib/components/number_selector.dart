import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_color.dart';
import 'package:imc_calculator/core/decoration_styles.dart';
import 'package:imc_calculator/core/text_styles.dart';

class NumberSelector extends StatefulWidget {
  final String title;
  final int value;
  final Function() onDecreament;
  final Function() onIncrement;

  const NumberSelector({
    super.key,
    required this.title,
    required this.value,
    required this.onDecreament,
    required this.onIncrement
  });

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: DecorationStyles.contain,
      
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          
          children: [
            Text(widget.title, style: TextStyles.bodyText),
            Text(widget.value.toString(), style: TextStyles.titleText),  
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: (){
                    widget.onDecreament();
                  }, 
                  shape: const CircleBorder(), 
                  backgroundColor: AppColors.primary, 
                  child: const Icon(Icons.remove, color: Colors.white)
                ), 
                
                const SizedBox(width: 16),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: (){
                    widget.onIncrement();
                  }, 
                  shape: const CircleBorder(), 
                  backgroundColor: AppColors.primary, 
                  child: const Icon(Icons.add, color: Colors.white)
                )  
              ]
            )
          ],
        ),
      ),
    );
  }
}