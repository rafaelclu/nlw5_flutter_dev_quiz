import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:nlw5_dev_quiz/shared/models/question_model.dart';

enum Level { EASY, MEDIUM, HARD, EXPERT }

extension LevelStringExt on String {
  Level get levelParse => {
        "facil": Level.EASY,
        "medio": Level.MEDIUM,
        "dificil": Level.HARD,
        "perito": Level.EXPERT,
      }[this]!;
}

extension LevelExt on Level {
  String get stringParse => {
        Level.EASY: "facil",
        Level.MEDIUM: "medio",
        Level.HARD: "dificil",
        Level.EXPERT: "perito",
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionsAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionsAnswered = 0,
    required this.image,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionsAnswered': questionsAnswered,
      'image': image,
      'level': level.stringParse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionsAnswered: map['questionsAnswered'],
      image: map['image'],
      level: map['level'].toString().levelParse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
