import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(
    this.currentFilters,
    this.saveFilters,
  );

  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // initial values
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

// init state
  @override
  initState() {
    _isGlutenFree = widget.currentFilters['gluten'];
    _isLactoseFree = widget.currentFilters['lactose'];
    _isVegan = widget.currentFilters['vegetarian'];
    _isVegetarian = widget.currentFilters['vegan'];
    super.initState();
  }

  // widget take parameters  title ,description,currentValue and function
  Widget buildSwitchListTile(String title, String discription,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(discription),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Screen"),
        actions: [
          //button to save change
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                // initialize values
                final Map<String, bool> selectedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                };
                // throw values after initialized  to widget save filters
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      body: Column(
        children: [
          //title of container
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          //بياخد باقي مساحه الصفحه من الكونتينر اللي فوق عشان اشتغل عليها
          Expanded(
            child: ListView(
              children: [
                // نماذج
                buildSwitchListTile("Gluten", "only gluten Free", _isGlutenFree,
                    (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    "lactoseFree", "only lactose Free", _isLactoseFree,
                    (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }),
                buildSwitchListTile("vegan", "only vegan", _isVegan,
                    (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),
                buildSwitchListTile(
                    "vegetarian", "only vegetarian", _isVegetarian, (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
