import 'package:flutter/cupertino.dart';
import 'package:nlw5_dev_quiz/home/home_repository.dart';
import 'package:nlw5_dev_quiz/home/home_state.dart';
import 'package:nlw5_dev_quiz/shared/models/quiz_model.dart';
import 'package:nlw5_dev_quiz/shared/models/user_model.dart';

class HomeController {
  ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.EMPTY);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  late UserModel user;
  late List<QuizModel> quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.LOADING;
    user = await repository.getUser();
    state = HomeState.SUCCESS;
  }

  void getQuizzes() async {
    state = HomeState.LOADING;
    quizzes = await repository.getQuizzes();
    state = HomeState.SUCCESS;
  }
}
