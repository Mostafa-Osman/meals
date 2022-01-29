import 'package:flutter/cupertino.dart';
import '../database/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal_detail';
  final Function toggleFavourite;
  final Function isFavourite;

  const MealDetailScreen(this.toggleFavourite, this.isFavourite);

  // عشان المكونات والخطوات هياخدوا نفس التنسيق روحت عاملت فانكشن واباسي فيه العنوان بدل ما اكتبها مرتين
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.deepOrangeAccent),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  // عشان المكونات والخطوات هياخدوا نفس التنسيق روحت عاملت فانكشن واباسي فيه child بدل ما اكتبها مرتين
  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 150,
      width: 300,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    // عشان ياخد ال id في متغير
    final mealId = ModalRoute.of(context).settings.arguments as String;
    //عشان يدور ع الصور اول صوره تقابله تحقق الشرط يختارها
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        // عنوان الصفحه تكون باسم الاكله
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //عشان احط الصوره وعنوان الاكله عليها
            Stack(
              children: [
                //تنسيقات الصوره
                Container(
                  height: 400,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      //عشان تخلي الصوره دائريه من جهه فوق شمال
                      bottomLeft: Radius.circular(25),
                      //عشان تخلي الصوره دائريه من جهه فوق يمين
                      bottomRight: Radius.circular(25),
                    ),
                    //الصوره بتاعت الاكله
                    child: Image.network(
                      selectedMeal.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //تنسيقات النص
                Positioned(
                  left: 380,
                  child: Container(
                    color: Colors.blueGrey,
                    child: Text(
                      selectedMeal.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //عنوان مكونات الوصفه
            buildSectionTitle(context, "Ingredients"),
            // مكونات الوصفه
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index])),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            //عنوان خطوات الوصفه
            buildSectionTitle(context, "Steps"),
            // خطوات الوصفه
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                        leading: CircleAvatar(
                          child: Text("# ${index + 1}"),
                        ),
                        title: Text(selectedMeal.steps[index])),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavourite(mealId),
        child: Icon(
          isFavourite(mealId) ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
      ),
    );
  }
}
