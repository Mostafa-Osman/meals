import '../widgets/drawer.dart';
import '../database/dummy_data.dart';
import '../widgets/categorys_item.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //GridView control layout
      //gridDelegate control children layout within Gridview
      body: GridView(
        // SliverGridDelegateWithMaxCrossAxisExtent     create layout
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          // crossAxisSpacing the space between two children by x axis
          crossAxisSpacing: 20,
          //the space between two children by y axis
          mainAxisSpacing: 20,
          //نسبه عرض الايتم الواحد بالنسبه لمحور X
          maxCrossAxisExtent: 200,
          //نسبه عرض الايتم الواحد بالنسبه لمحور y
          /* mainAxisExtent: 200,
            //نسبه عرض بالنسبه لx الي نسبه الطول بالنسبه ال y لكل واحد ايتم
            */
          childAspectRatio: 3 / 2,
        ),
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((catData) =>
                CategoryItem(catData.id, catData.title, catData.color))
            .toList(),
      ),
      drawer: MyDrawer(),
    );
  }
}
