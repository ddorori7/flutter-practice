import 'package:flutter/material.dart';

class TodoAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = const Size.fromHeight(55.0);
  final String title;
  final bool addButton;
  final bool toEditPage;

  const TodoAppbar({
    Key? key,
    this.addButton = false,
    required this.title,
    this.toEditPage = false,
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
            ? TextButton(
                // TODO: 리스트에 추가할 수 있게! 페이지 만들기
                onPressed: () {},
                child: const Icon(
                  Icons.add,
                  color: Colors.white70,
                  size: 30,
                ),
              )
            : Container(),
        toEditPage
            ? TextButton(
                //  TODO:버튼누르면 상세수정 페이지로(등록페이지와 같이 쓸것)
                onPressed: () {},
                child: const Text(
                  "수정",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
