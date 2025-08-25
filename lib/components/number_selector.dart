import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_color.dart';
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
      
      decoration: BoxDecoration(
        color: AppColors.backgroundComponent,
        borderRadius: BorderRadius.circular(16)
      ),
      
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          
          children: [
            Text(widget.title, style: TextStyles.bodyText),
            Text(widget.value.toString(),
              style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold)),  
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: (){
                    widget.onDecreament();
                  }, 
                  shape: CircleBorder(), 
                  backgroundColor: AppColors.primary, 
                  child: Icon(Icons.remove, color: Colors.white)
                ), 
                
                SizedBox(width: 16),
                FloatingActionButton(
                  onPressed: (){
                    widget.onIncrement();
                  }, 
                  shape: CircleBorder(), 
                  backgroundColor: AppColors.primary, 
                  child: Icon(Icons.add, color: Colors.white)
                )  
              ]
            )
          ],
        ),
      ),
    );
  }
}