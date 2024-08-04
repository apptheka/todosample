import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/app/constant.dart';
import 'package:todolist/app/extensions.dart';
import 'package:todolist/models/todo_time.dart';
import 'package:todolist/presentation/resources/color_manager.dart';
import 'package:todolist/presentation/resources/font_manager.dart';
import 'package:todolist/presentation/resources/values_manager.dart';
import 'package:todolist/presentation/screen/addTodo/add_page.dart';
import 'package:todolist/presentation/screen/addTodo/widget/add_screen.dart';
import 'package:todolist/presentation/widget/app_text.dart';
import 'package:todolist/presentation/widget/divider_timeline.dart';

class TodoItemWidget extends StatefulWidget {
  TodoItemWidget(
      {required this.todo,
      required this.onDelete,
      required this.index,
      required this.markDone});
  Function(int) onDelete;
  Function(int) markDone;
  final TodoData todo;
  final int index;

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.todo.isDone.toString());
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: GestureDetector(
        onLongPress: () {
          print(">>>><markDone<<<>>>");
          widget.markDone(widget.index);
        },
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddTodoPage(note: widget.todo),
            ),
          );
          if (result != null) {}
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.09,
                child: divideView()),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.04,
                  ),
                  padding: EdgeInsets.only(
                    top: AppPadding.p8,
                    bottom: AppPadding.p8,
                  ),
                  width: MediaQuery.of(context).size.width * 0.09,
                  decoration: BoxDecoration(
                    color: ColorManager.primaryAppColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: getAppBoldTextView(
                        DateFormat(TIME_FORMAT).format(DateFormat(DATE_FORMAT)
                            .parse(widget.todo.date + " " + widget.todo.time)),
                        color: Colors.white,
                        decoration: widget.todo.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        context: context,
                        textAlign: TextAlign.center),
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * .65,
                          child: getAppMediumTextView(widget.todo.title,
                              decoration: widget.todo.isDone
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              fontSize: FontSize.headerSub1TextHeight,
                              context: context,
                              maxLine: 1,
                              textOverflow: TextOverflow.ellipsis)),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * .65,
                          child: getAppLightTextView(
                              decoration: widget.todo.isDone
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              widget.todo.content.removeHtmlTags(),
                              context: context,
                              fontSize: FontSize.headerSub3TextHeight,
                              maxLine: 1,
                              textOverflow: TextOverflow.ellipsis)),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => widget.onDelete(widget.index),
                  icon: Icon(Icons.delete, color: Colors.black87),
                )
              ],
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.09,
                child: divideView()),
          ],
        ),
      ),
    );
    ;
  }
}
