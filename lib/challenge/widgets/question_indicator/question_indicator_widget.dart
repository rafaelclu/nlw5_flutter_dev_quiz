import 'package:flutter/material.dart';
import 'package:nlw5_dev_quiz/core/app_text_styles.dart';
import 'package:nlw5_dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int questionsLenght;

  const QuestionIndicatorWidget(
      {Key? key, required this.currentPage, required this.questionsLenght})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão $currentPage",
                style: AppTextStyles.body,
              ),
              Text(
                "de $questionsLenght",
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ProgressIndicatorWidget(
            value: currentPage / questionsLenght,
          )
        ],
      ),
    );
  }
}
