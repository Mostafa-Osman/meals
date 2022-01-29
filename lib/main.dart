import 'package:again/screens/about_screen.dart';
import './screens/filter_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/setting.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import 'package:flutter/material.dart';
import 'database/dummy_data.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // take all meals from database to use it in filter screen
  List<Meal> _availableMeals = DUMMY_MEALS;

  // list of meals used it in favourite screen
  List<Meal> _favouriteMeals = [];

  //map filters throw to filter screen after operation method _select filter
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  // method to filters meals
  void _selectFilter(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;
      //filters meals
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) return false;
        if (_filters['lactose'] && !meal.isLactoseFree) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  //find meal favourite and add or delete it
  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0)
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  //use this method to change icons star
  bool isMealFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    // control routes and theme
    return MaterialApp(
      // to delete cross icon
      debugShowCheckedModeBanner: false,
      // تنسيقات موحده  للخطوط والالوان استخدمها ع طول بدل ما اكتب لكل حاجه تنسيق
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              body2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      // home: CategoryScreen(),
      // initial route start screen display
      initialRoute: '/',
      //to move from screens
      routes: {
        //'/':(context)=>CategoryScreen(),
        '/': (context) => TabsScreen(_favouriteMeals),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavourite, isMealFavourite),
        SettingsScreen.rounteName: (context) => SettingsScreen(),
        FilterScreen.routeName: (context) =>
            FilterScreen(_filters, _selectFilter),
        AboutScreen.routeName: (context) => AboutScreen(),
      },
    );
  }
}
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Meal App"),
//       ),
//       body: null,
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
