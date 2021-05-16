import 'package:flutter_test/flutter_test.dart';
import 'package:nlw5_dev_quiz/home/home_repository.dart';
import 'package:nlw5_dev_quiz/shared/models/user_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  HomeRepository repository = HomeRepository();

  test("When call getUser should return user Rafael", () async {
    final user = await repository.getUser();
    expect(user.name, "Rafael");
    expect(user.score, 75);
  });

  test("When call getQuizzes should return a non empty list of quizzes", () async {
    final quizzes = await repository.getQuizzes();
    expect(quizzes.length, greaterThan(0));
  });
}