import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_option.dart';
import 'package:imc_calculator/core/app_color.dart';
import 'package:imc_calculator/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender;
  String male = 'Hombre';
  String female = 'Mujer';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Hombre
        GenderOption(
          label: male, 
          imagePath: 'assets/images/male.png', 
          isSelected: selectedGender, 
          onTap: (){ setState(() {
            selectedGender = male; }); 
          }, 
          padding: const EdgeInsets.only(top: 16, bottom: 16, right: 8, left: 16)
        ),
        
        //Mujer
        GenderOption(
          label: female, 
          imagePath: 'assets/images/female.png', 
          isSelected: selectedGender, 
          onTap: ()=> setState(()=> selectedGender = female),
          padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16, left: 8)
        )
      ],
    );
  }
}
