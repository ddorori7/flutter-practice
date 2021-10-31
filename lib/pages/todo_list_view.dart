import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/models/todo.dart';
import 'package:hello_world/widget/todo_appbar.dart';

import 'detail_screen.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({Key? key}) : super(key: key);

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  String dropdownValue = 'One';
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
          true,
          '2020-02-02'),
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
      body: [
        _TodoListTab(
          todos: todos,
        ),
        const Text("Not Todos"),
      ].elementAt(_selectedIndex),
    );
  }
}

class _TodoListTab extends StatefulWidget {
  final List<Todo> todos;

  const _TodoListTab({
    Key? key,
    required this.todos,
  }) : super(key: key);

  @override
  State<_TodoListTab> createState() => _TodoListTabState();
}

class _TodoListTabState extends State<_TodoListTab> {
  List<Todo> todos = [];

  @override
  void initState() {
    todos = List.generate(
      20,
      (i) => Todo(
          'Todo $i',
          'A description of what needs kddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddto be done for Todo $i',
          true,
          '2020-02-02'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todos.length,
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
              widget.todos[index].title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54),
            ),
            onTap: () {
              Get.to(
                () => DetailScreen(
                  todo: todos[index],
                  onChangeImportant: (value) {
                    print(value);
                    setState(() => todos[index].important = value);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

//  DropdownButton<String>(
//               value: dropdownValue,
//               icon: const Icon(Icons.arrow_downward),
//               iconSize: 24,
//               elevation: 16,
//               style: const TextStyle(color: Colors.deepPurple),
//               underline: Container(
//                 height: 2,
//                 color: Colors.deepPurpleAccent,
//               ),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   dropdownValue = newValue!;
//                 });
//               },
//               items: <String>['One', 'Two', 'Free', 'Four']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),