import 'package:again/screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  //initial variables
  final String id;
  final String title;
  final Color color;

  //construct to receive id , title and color restaurant
  const CategoryItem(this.id, this.title, this.color);

  //عشان اختار قسم الطبخ  بس ببعت معاه اسمه الفسم عشان اعرضع عنوان وid
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    //inkwell(on tap) عشان اخلي قسم الطبخات ايطالي والماني قابل للضغط
    return InkWell(
      // to make inkwell(GridView) shape round edges
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(25),
        //اسم الطبخات ايطالي والماني
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          // to make Container shape round edges
          borderRadius: BorderRadius.circular(15),
          //انحدار ومذج الالوان وتحديد بدايه ونهايه مزج الالوان
          gradient: LinearGradient(
              // عشان تدخل لونين في بعض للايتم
              colors: [
                //اللون الاول اللي هو الاساسي
                color,
                // دي معناها الشفافيه وممكن تتغير بلون تاني
                color.withOpacity(0.4),
              ],
              //بدايه انه يدخل اللونين في بعض
              begin: Alignment.bottomRight,
              //نهايه انه يدخل اللونين في بعض
              end: Alignment.topLeft),
        ),
      ),
      onTap: () => selectCategory(context),
    );
  }
}
