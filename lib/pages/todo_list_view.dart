import 'package:flutter/material.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({Key? key}) : super(key: key);

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  int _selectedIndex = 0;
  String title = "TODO";

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
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white70,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white70,
          ),
        ),
        actions: [
          IconButton(
            // TODO: 리스트에 추가할 수 있게! 모달 만들기
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: 28,
            ),
          )
        ],
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
            label: "todo",
            icon: Icon(Icons.list_alt_outlined),
          ),
          BottomNavigationBarItem(
            label: "not todo",
            icon: Icon(Icons.do_not_disturb_on_outlined),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

List _widgetOptions = [
  const _TodoListTab(),
  const Text("Not Todos"),
];

class _TodoListTab extends StatelessWidget {
  const _TodoListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}
