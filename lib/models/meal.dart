import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> category;
  final String title;
  final String imageUrl;
  final List<String> ingredients; // مكونات الطبخه
  final List<String> steps; // خطوات تنفيذ الطبخه
  final int duration; // مده تحضير الوجبه
  final Complexity complexity; // نوع تحضير الطبخه سهل ولا صعب
  final Affordability affordability; // نوع الطبخه ثمين ولا رخيص
  final bool isGlutenFree; //نوع الطبخه دهوني
  final bool isLactoseFree; //نوع الطبخه سكري
  final bool isVegan; // نوع الطبخه نباتي
  final bool isVegetarian; //نوع الطبخه خضروات

  const Meal({
    @required this.id,
    @required this.category,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}
