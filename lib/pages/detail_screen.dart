// 투두 타일 선택시! 상세화면
import 'package:flutter/material.dart';
import 'package:hello_world/models/todo.dart';
import 'package:hello_world/widget/todo_appbar.dart';

class DetailScreen extends StatelessWidget {
  // Todo를 들고 있을 필드를 선언합니다.
  final Todo todo;

  // 생성자는 Todo를 인자로 받습니다.
  const DetailScreen({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // UI를 그리기 위해 Todo를 사용합니다.
    return Scaffold(
      appBar: TodoAppbar(
        title: todo.title,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Text(todo.description,
            style: const TextStyle(
              fontSize: 20,
            )),
      ),
    );
  }
}
