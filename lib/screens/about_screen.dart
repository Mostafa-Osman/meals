import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = 'about_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("about page"),
      ),
      body: Container(
        child:
            Text("about hello", style: Theme.of(context).textTheme.bodyText2),
      ),
    );
  }
}
