import 'package:flutter/material.dart';
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
      body: bodyResult(context)
    );
  }

  Padding bodyResult(BuildContext context) {
    double fixedHeight = height/100;
    double imcResult = weight/(fixedHeight * fixedHeight);
    
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tu resultado', style: TextStyles.titleText),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 32),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: DecorationStyles.contain,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(getTitleImc(imcResult), style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: getColorByImc(imcResult))),
                    Text(imcResult.toStringAsFixed(2), 
                        style: const TextStyle(fontSize: 76, color: Colors.white, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Text(getDescriptionImc(imcResult), 
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white), textAlign: TextAlign.center),
                    )
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, 
            style: ButtonStyles.next, child: const Text('Finalizar', style: TextStyles.bodyText)
            ),
          )
        ]
      )
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      title: const Text('Resultado'),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }
  
  Color getColorByImc(double imcResult) {
    return switch(imcResult){
      < 18.5 => Colors.blue,  //IMC Bajo
      < 24.9 => Colors.green,  //IMC Normal
      < 29.99 => Colors.orange,  //Sobrepeso
      _ => Colors.red  //Obesidad
    };
  }

  String getTitleImc(double imcResult) {
    return switch(imcResult){
      < 18.5 => 'IMC Bajo',  
      < 24.9 => 'IMC Normal',  
      < 29.99 => 'Sobrepeso',  
      _ => 'Obesidad'  
    };
  }

  String getDescriptionImc(double imcResult) {
    return switch(imcResult){
      < 18.5 => 'Tu peso está por debajo de lo recomendado.',  
      < 24.9 => 'Tu peso está en el rango saludable.',  
      < 29.99 => 'Tienes sobrepeso, cuida tu alimentación.', 
      _ => 'Tienes obesidad, consulta con un especialista.'  
    };
  }
}