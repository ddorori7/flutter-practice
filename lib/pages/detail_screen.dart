// 투두 타일 선택시! 상세화면
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hello_world/models/todo.dart';
import 'package:hello_world/widget/todo_appbar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DetailScreen extends StatefulWidget {
  // Todo를 들고 있을 필드를 선언합니다.
  final Todo todo;
  final void Function(bool) onChangeImportant;

  // 생성자는 Todo를 인자로 받습니다.
  const DetailScreen({
    Key? key,
    required this.todo,
    required this.onChangeImportant,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // /* DatePicker 띄우기 */
  // void showDatePickerPop() {
  //   Future<DateTime?> selectedDate = showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(), //초기값
  //     firstDate: DateTime(2021), //시작일
  //     lastDate: DateTime(2030), //마지막일
  //     builder: (BuildContext context, Widget? child) {
  //       return Theme(
  //         data: ThemeData.dark(), //다크 테마
  //         child: child!,
  //       );
  //     },
  //   );

  //   selectedDate.then((dateTime) {
  //     Fluttertoast.showToast(
  //       msg: dateTime.toString(),
  //       toastLength: Toast.LENGTH_LONG,
  //       //gravity: ToastGravity.CENTER,  //위치(default 는 아래)
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // UI를 그리기 위해 Todo를 사용합니다.
    return Scaffold(
      appBar: TodoAppbar(
        title: widget.todo.title,
        toEditPage: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _SectionTile(
              label: "할일",
              description: widget.todo.title,
              isTitle: true,
              important: widget.todo.important,
              onPressed: () {
                print("wow");
                widget.onChangeImportant(!widget.todo.important);
                setState(() {
                  !widget.todo.important;
                });
              },
            ),
            _SectionTile(
              label: "기한",
              description: widget.todo.deadline,
            ),
            _SectionTile(
              label: "상세",
              description: widget.todo.description,
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTile extends StatefulWidget {
  final String label;
  final String description;
  final bool isTitle;
  final void Function()? onPressed;
  final bool important;

  const _SectionTile({
    Key? key,
    required this.label,
    required this.description,
    this.isTitle = false,
    this.onPressed,
    this.important = false,
  }) : super(key: key);

  @override
  State<_SectionTile> createState() => _SectionTileState();
}

class _SectionTileState extends State<_SectionTile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.black12,
            width: 2,
          ))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 30),
                child: Text(
                  widget.label,
                  style: _labelStyle,
                ),
              ),
              Expanded(
                child: Text(
                  widget.description,
                  style: _informationStyle,
                ),
              ),
            ],
          ),
        ),
        widget.isTitle
            ? Positioned(
                right: 10,
                top: 6,
                child: Container(
                  width: 50,
                  height: 50,
                  child: TextButton(
                      onPressed: widget.onPressed,
                      child: widget.important
                          ? const Icon(
                              Icons.star_outlined,
                              size: 30,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.star_border_outlined,
                              size: 30,
                              color: Colors.red,
                            )),
                ),
              )
            : Container()
      ],
    );
  }
}

// 텍스트스타일
TextStyle _labelStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  height: 1,
);

TextStyle _informationStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w400,
  height: 22 / 20,
);
