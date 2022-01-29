import 'package:again/models/meal.dart';
import '../widgets/meal_item.dart';
import 'package:flutter/material.dart';
class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'category_meals';
  List<Meal> _availableMeals;
  CategoryMealScreen(this._availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  //متغير عشان عنوان الاكله
  String categoryTitle;

  // لست اوبجيكت من الاكلات
  List<Meal> displayedMeal;

  // didChangeDependencies function static  يعني بترن الداتا اللي جواها قبل ما الكود ما يرن
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    // id of category meals as italian and quick & easy
    final categoryId = routeArg['id'];
    //title of category meals as italian and quick & easy
    categoryTitle = routeArg['title'];
    //بيدور علي الاكلات في الداتا بيز وبيرجعها كل اللي يلاقيه تحقق المطلوب
    displayedMeal = widget._availableMeals.where((meal) {
      return meal.category.contains(categoryId);
    }).toList();
    //عشان يوصل لل parent نفسه
    super.didChangeDependencies();
  }

  //فانكشن بتتحقق من ال id اول ما بتلاقيه صح بترجعه
  // void _removeMeal(String mealId) {
  //   setState(() {
  //     displayedMeal.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            // ببعت داتا لل widget اللي اسمها mealItem
            return MealItem(
              id: displayedMeal[index].id,
              title: displayedMeal[index].title,
              imageUrl: displayedMeal[index].imageUrl,
              duration: displayedMeal[index].duration,
              complexity: displayedMeal[index].complexity,
              affordability: displayedMeal[index].affordability,
            );
          },
          itemCount: displayedMeal.length,
        ));
  }
}
