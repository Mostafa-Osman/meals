import 'package:again/screens/about_screen.dart';
import '../screens/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatelessWidget {
  //widget فانكشن هبعت ليها عنواان وايقون وفانشكن اما يضغط ع الاختيار تتنقذ الفانكشن دي
  Widget buildList(String title, IconData icon, Function tapHandler) {
    //لست تايتل تحتوي علي نص وايقون
    return ListTile(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.black12,
            child: buildList('profile', Icons.account_circle_rounded, () {}),
          ),
          Expanded(
            //عباره عن list view عشان تدعم ال scroll view
          child: ListView(
              children: [
                //نماذج
                // buildList('Profile', Icons.account_circle_sharp, () {}),
                buildList('Talabat Pay', Icons.credit_card, () {}),
                buildList('Offers', Icons.local_offer_outlined, () {}),
                buildList(
                    'Notifications', Icons.notifications_on_outlined, () {}),
                buildList('Last orders', Icons.list_alt_rounded, () {}),
                buildList('settings', Icons.settings, () {
                  Navigator.of(context).pushNamed(SettingsScreen.rounteName);
                }),
                buildList('visit Google', FontAwesomeIcons.google, () {}),
                buildList('help', Icons.help, () {}),
                buildList('about', Icons.info, () {
                  Navigator.of(context).pushNamed(AboutScreen.routeName);
                }),
                buildList('Log Out', Icons.logout, () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
