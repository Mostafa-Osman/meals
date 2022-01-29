import '../models/meal.dart';
import '../widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouriteScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    // is favourite meals is empty write empty else display items
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text("favourite is Empty"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          //throw item you love it to meal item
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
