import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Милые котики',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String labelText = 'Нажмите на котика';
  bool isCatClicked = false;

  void onCatClicked() {
    setState(() {
      isCatClicked = !isCatClicked;
      labelText = isCatClicked ? 'Это котик' : 'Нажмите на котика';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Милые котики'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                labelText,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                launch('https://github.com/AlihandR0/fali01'); // Замените на ссылку на ваш репозиторий GitHub
              },
              child: Text('GitHub'),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    launch('https://www.smolgu.ru/'); // Замените на ссылку на сайт СмолГУ
                  },
                  child: Text('СмолГУ'),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: onCatClicked,
              child: Container(
                margin: EdgeInsets.only(bottom: 42.0),
                child: Image.asset(
                  isCatClicked ? 'assets/cat_clicked.png' : 'assets/cat.png',
                  width: 200.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}