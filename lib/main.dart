import 'package:flutter/material.dart';

// main(), runApp(위젯이 와야함) -> 함수(소문자 시작)
// MyApp() (위젯) -> 클래스명(대문자시작)
void main() => runApp(MyApp());

// stl 입력하면 StatelessWidget 한번에 생성
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First app",
      // theme: 기본테마
      // primarySwatch : 기본적으로 사용할 색상견본
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("first app"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("hello"),
            Text("hello"),
            Text("hello"),
          ],
        ),
      ),
    );
  }
}
