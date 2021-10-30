import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/home_view.dart';

// main(), runApp(위젯이 와야함) -> 함수(소문자 시작)
// MyApp() (위젯) -> 클래스명(대문자시작)
void main() => runApp(const MyApp());

// stl 입력하면 StatelessWidget 한번에 생성
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "First app",
      // theme: 기본테마
      // primarySwatch : 기본적으로 사용할 색상견본
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      getPages: [GetPage(name: '/list', page: () => ListView())],
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
