import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'filter_screen.dart';

class SettingsScreen extends StatelessWidget {
  static const rounteName = 'settings';

  //widget فانكشن هبعت ليها عنواان وايقون وفانشكن اما يضغط ع الاختيار تتنقذ الفانكشن دي
  Widget SettingItem(String title, IconData icon, Function tapHandler) {
    //لست تايتل تحتوي علي نص وايقون
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
            leading: Icon(
              icon,
              color: Colors.orange,
              size: 24,
            ),
            onTap: tapHandler,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      //عباره عن list view عشان تدعم ال scroll view

      body: ListView(
        children: [
          //نماذج
          SettingItem('Fillters', Icons.filter_tilt_shift, () {
            Navigator.of(context).pushNamed(FilterScreen.routeName);
          }),
          SettingItem('change phone Number', Icons.phone_android, () {}),
          SettingItem('change password', Icons.remove_red_eye, () {}),
          SettingItem('change Language', Icons.language, () {}),
          SettingItem('change country', Icons.add_location, () {}),
        ],
      ),
    );
  }
}
