import 'package:animatetinz/animation_screens/easing_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      onGenerateRoute: (RouteSettings settings) {
        switch(settings.name) {
          case '/easingAnimation':
            return CupertinoPageRoute(builder: (context) {
              return EasingAnimationWidget();
            });
          case '/':
          default:
            return MaterialPageRoute(builder: (context) {
              return Home();
            });
        }
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Animations'),),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ListTile(trailing: Icon(Icons.open_in_new), title: Text('Easing Animation'), onTap: openEasingAnimation,),
          ],
        ),
      ),
    );
  }

  void openEasingAnimation() {
    Navigator.of(context).pushNamed('/easingAnimation');
  }
}
