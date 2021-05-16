import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlw5_dev_quiz/core/app_colors.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  LevelButtonWidget.easy()
      : this.label = "Fácil",
        this.backgroundColor = AppColors.levelButtonFacil,
        this.textColor = AppColors.levelButtonTextFacil,
        this.borderColor = AppColors.levelButtonBorderFacil;
  LevelButtonWidget.medium()
      : this.label = "Médio",
        this.backgroundColor = AppColors.levelButtonMedio,
        this.textColor = AppColors.levelButtonTextMedio,
        this.borderColor = AppColors.levelButtonBorderMedio;
  LevelButtonWidget.hard()
      : this.label = "Difícil",
        this.backgroundColor = AppColors.levelButtonDificil,
        this.textColor = AppColors.levelButtonTextDificil,
        this.borderColor = AppColors.levelButtonBorderDificil;
  LevelButtonWidget.expert()
      : this.label = "Perito",
        this.backgroundColor = AppColors.levelButtonPerito,
        this.textColor = AppColors.levelButtonTextPerito,
        this.borderColor = AppColors.levelButtonBorderPerito;
  LevelButtonWidget.custom({required this.label, required this.backgroundColor, required this.textColor, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(28),
        border: Border.fromBorderSide(
          BorderSide(
            color: borderColor,
          ),
        ),
      ),
      child: Text(label,
          style: GoogleFonts.notoSans(color: textColor, fontSize: 13)),
    );
  }
}
