import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: CounterPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CounterPage extends StatefulWidget {
  CounterPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  double _height = 180.0;
  double _width = 200.0;
  Color _bgColor = Colors.white;

  void _incrementCounter() {
    setState(() {
        _height = 0;
        _width = 0;
        _bgColor = Colors.black.withOpacity(0.7);
    });

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _counter++;
        _height = 200.0;
        _width = 300.0;
        _bgColor = Colors.white;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text('Current Count',),
            SizedBox(height: 40.0,),
            Expanded(
              child: Center(
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _bgColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: _width,
                  height: _height,
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 250),
                  child: Text(
                    '$_counter',
                    style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
