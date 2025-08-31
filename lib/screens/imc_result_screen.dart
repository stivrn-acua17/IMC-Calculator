import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imc_calculator/core/app_color.dart';
import 'package:imc_calculator/core/button_styles.dart';
import 'package:imc_calculator/core/decoration_styles.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weight;

  const ImcResultScreen({
    super.key,
    required this.height,
    required this.weight
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: toolbarResult(),
      body: bodyResult()
    );
  }

  Padding bodyResult() {
    double imcResult = weight/(height*height);
    
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tu resultado', style: TextStyles.titleText),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 32),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: DecorationStyles.contain,
                child: Text(imcResult.toString(), style: TextStyles.bodyText),
              ),
            ),
          ),

          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(onPressed: (){}, style: ButtonStyles.next,
              child: Text('Finalizar', style: TextStyles.bodyText)
            ),
          )
        ]
      )
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      title: Text('Resultado'),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }
}