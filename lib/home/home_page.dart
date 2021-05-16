import 'package:flutter/material.dart';
import 'package:nlw5_dev_quiz/challenge/challenge_page.dart';
import 'package:nlw5_dev_quiz/core/app_colors.dart';
import 'package:nlw5_dev_quiz/home/home_controller.dart';
import 'package:nlw5_dev_quiz/home/home_state.dart';
import 'package:nlw5_dev_quiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:nlw5_dev_quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:nlw5_dev_quiz/home/widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.SUCCESS) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget.easy(),
                  LevelButtonWidget.medium(),
                  LevelButtonWidget.hard(),
                  LevelButtonWidget.expert(),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: controller.quizzes
                      .map(
                        (quiz) => QuizCardWidget(
                          title: quiz.title,
                          completed:
                              "${quiz.questionsAnswered}/${quiz.questions.length}",
                          percent:
                              quiz.questionsAnswered / quiz.questions.length,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChallengePage(
                                  questions: quiz.questions,
                                  title: quiz.title,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
