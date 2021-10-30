import 'package:flutter/material.dart';

class TodoAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = const Size.fromHeight(55.0);
  final String title;
  final bool addButton;

  const TodoAppbar({
    Key? key,
    this.addButton = false,
    required this.title,
  }) : super(
          key: key,
        );

  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white70,
      ),
      centerTitle: true,
      backgroundColor: Colors.black,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: Colors.white70,
        ),
      ),
      actions: [
        addButton
            ? IconButton(
                // TODO: 리스트에 추가할 수 있게! 모달 만들기
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 30,
                ),
              )
            : Container()
      ],
    );
  }
}
