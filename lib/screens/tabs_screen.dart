import '../models/meal.dart';
import '../widgets/drawer.dart';
import 'package:flutter/material.dart';
import '../screens/category_screen.dart';
import 'favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  //initial value list of meal
  List<Meal> favouriteMeals;

  //construct to receive favourite meals
  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // list of map <string,object> used to save screens
  List<Map<String, Object>> _pages;

  //init state
  void initState() {
    // map of screens used to move from screens
    _pages = [
      {
        'page': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': CategoryScreen(),
        'title': 'Home',
      },
      {
        'page': FavouriteScreen(widget.favouriteMeals),
        'title': 'FavouriteScreen',
      },
    ];
    //to go to parent class
    super.initState();
  }

  //initial value used to select page want to move
  int _selectedPageIndex = 0;

  // method to initialize _selectedPageIndex
  void selectedPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'search',
            onPressed: () {},
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            icon: const Icon(Icons.notifications_active_outlined),
            tooltip: 'notifications',
            onPressed: () {},
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      //body move to screen
      body: _pages[_selectedPageIndex]['page'],
      // tabs
      bottomNavigationBar: BottomNavigationBar(
        //action when click in button
        onTap: selectedPage,
        // themes
        //background color of  bottomNavigationBar
        backgroundColor: Theme.of(context).primaryColor,
        //color of icons  selected
        selectedItemColor: Theme.of(context).accentColor,
        //color of icons not selected
        unselectedItemColor: Colors.white,
        //initial _selectedPageIndex =currentIndex
        currentIndex: _selectedPageIndex,
        // items
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Category"),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text("Favourites")),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
