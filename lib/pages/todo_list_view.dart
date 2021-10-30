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
      (i) => Todo(
          'Todo $i',
          'A description of what needs kddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddto be done for Todo $i',
          true),
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
        return Container(
          decoration: const BoxDecoration(
              color: Colors.black12,
              border:
                  Border(bottom: BorderSide(color: Colors.white, width: 2))),
          padding: const EdgeInsets.all(5),
          child: ListTile(
            leading: const Icon(
              Icons.check_circle,
              color: Colors.black54,
              size: 25,
            ),
            title: Text(
              todos[index].title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(todo: todos[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
