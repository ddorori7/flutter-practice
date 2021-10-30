import 'package:flutter/material.dart';
import 'package:hello_world/models/todo.dart';
import 'package:hello_world/widget/todo_appbar.dart';

import 'detail_screen.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({Key? key}) : super(key: key);

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  int _selectedIndex = 0;
  String title = "TODO";
  List<Todo> todos = [];

  @override
  void initState() {
    todos = List.generate(
      20,
      (i) => Todo('Todo $i',
          'A description of what needs to be done for Todo $i', true),
    );
    super.initState();
  }

  void setTitle() {
    if (_selectedIndex == 0) {
      title = "TODO";
    } else {
      title = "NOT TODO";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoAppbar(
        title: title,
        addButton: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green.shade500,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            setTitle();
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "TODO",
            icon: Icon(Icons.list_alt_outlined),
          ),
          BottomNavigationBarItem(
            label: "NOT TODO",
            icon: Icon(Icons.do_not_disturb_on_outlined),
          ),
        ],
      ),
      body: Center(
        child: [
          _TodoListTab(
            todos: todos,
          ),
          const Text("Not Todos"),
        ].elementAt(_selectedIndex),
      ),
    );
  }
}

class _TodoListTab extends StatelessWidget {
  final List<Todo> todos;

  const _TodoListTab({
    Key? key,
    required this.todos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(todos[index].title),
          // 사용자가 ListTile을 선택하면, DetailScreen으로 이동합니다.
          // DetailScreen을 생성할 뿐만 아니라, 현재 todo를 같이 전달해야
          // 한다는 것을 명심하세요.
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(todo: todos[index]),
              ),
            );
          },
        );
      },
    );
  }
}
