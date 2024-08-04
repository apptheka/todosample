import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:intl/intl.dart';
import 'package:todolist/app/constant.dart';
import 'package:todolist/app/functions.dart';
import 'package:todolist/models/todo_time.dart';
import 'package:todolist/presentation/resources/color_manager.dart';
import 'package:todolist/presentation/resources/font_manager.dart';
import 'package:todolist/presentation/resources/routes_manager.dart';
import 'package:todolist/presentation/widget/app_text.dart';
import 'package:todolist/presentation/widget/html_editor.dart';
// import 'package:html/parser.dart';

class AddScreen extends StatefulWidget {
  final TodoData? note;
  final DateTime? dateTime;
  Function(TodoData) addNote;
  Function(TodoData) editDone;
  AddScreen(
      {super.key,
      required this.addNote,
      required this.editDone,
      this.note,
      this.dateTime});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  double width = 0;
  late String Description = "";
  TextEditingController _titleController = TextEditingController();

  final HtmlEditorController controller = HtmlEditorController();
  DateTime now = DateTime.now();
  String day = "";
  String month = "";
  String year = "";
  String dayOfWeek = "";
  String timePick = "";
  DateTime gdateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  bool isEdit = false;
  Color textColor = Colors.yellow.shade700;
  @override
  void initState() {
    super.initState();
    now = widget.dateTime ?? DateTime.now();
    if (widget.note != null) {
      isEdit = true;
      _titleController = TextEditingController(text: widget.note!.title);
      try {
        now = DateFormat(DATE_FORMAT)
            .parse(widget.note!.date + " " + widget.note!.time);
      } catch (ex) {}

      Future.delayed(const Duration(seconds: 1), () {
        controller.setText(widget.note!.content);
      });
    }
    dayOfWeek = DateFormat('EEEE').format(now);
    day = DateFormat("dd").format(now);
    month = DateFormat("MMMM").format(now);
    year = DateFormat("yyyy").format(now);
    timePick = DateFormat('hh:mm a').format(now);
    super.initState();
  }

  String date = "Pick Date";

  void _timeSelected(TimeOfDay time) {
    timeOfDay = time;
    timePick = time.format(context);
    print(timePick);
    setState(() {});
  }

  void _dateSelected(DateTime pickedDate) {
    gdateTime = pickedDate;
    dayOfWeek = DateFormat('EEEE').format(pickedDate);
    day = DateFormat("dd ").format(pickedDate);
    month = DateFormat("MMMM").format(pickedDate);
    year = DateFormat("yyyy").format(pickedDate);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          Navigator.pushReplacementNamed(context, Routes.homeRoute,
              arguments: 0);
        },
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 60, 20, 0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.homeRoute,
                              arguments: 0);
                        },
                        padding: const EdgeInsets.all(0),
                        icon: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: textColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => onTapFunction(
                              context: context,
                              dateSelected: (DateTime date) =>
                                  {_dateSelected(date)}),
                          child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        getAppBoldTextView(day,
                                            context: context,
                                            color: textColor,
                                            fontSize: FontSize.s20),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        getAppBoldTextView(month,
                                            context: context,
                                            color: Colors.black,
                                            fontSize: FontSize.s20),
                                      ],
                                    ),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        getAppMediumTextView(
                                            "$year, $dayOfWeek",
                                            context: context,
                                            color: Colors.grey.shade700,
                                            fontSize: FontSize.s10),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.grey,
                                ),
                              ]),
                        ),
                        GestureDetector(
                          onTap: () async => {
                            onTapTimeFunction(
                                context: context,
                                dateSelected: (TimeOfDay time) =>
                                    {_timeSelected(time)})
                          }, //

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  getAppBoldTextView(timePick,
                                      context: context,
                                      color: textColor,
                                      fontSize: FontSize.s20),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.access_time_outlined,
                                      color: Colors.grey),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      textInputAction: TextInputAction.next,
                      maxLines: 1,
                      controller: _titleController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Title',
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: FontSize.s14)),
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height * .55),
                      child: getHtmlEditor(
                        controller,
                      ),
                    ),
                  ],
                ))
              ]),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveNotes();
        },
        elevation: 10,
        backgroundColor: textColor,
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
    );
  }

  saveNotes() async {
    if (_titleController.text.isNotEmpty &&
        controller.getText().toString().isNotEmpty) {
      String content = await controller.getText();
      List<TodoData> notesList = [];
      try {
        notesList = List.from(json.decode(
                Hive.box(HiveConstant.ADD_BOX).get(HiveFieldConstant.TODO)))
            .map((e) => TodoData.fromJson(e))
            .toList();
      } catch (e) {}

      if (notesList.length == 0) {
        String tag = '';
        var notes = TodoData(
            image: "",
            tag: tag,
            id: 1,
            title: _titleController.text,
            content: content.trim(),
            date: day.trim() + "/" + month + "/" + year,
            time: timePick,
            isDone: false);
        widget.addNote(notes);
      } else {
        if (widget.note != null) {
          String tag = '';

          widget.editDone(TodoData(
              image: "",
              tag: tag,
              id: widget.note!.id,
              title: _titleController.text,
              content: content.trim(),
              date: day.trim() + "/" + month + "/" + year,
              time: timePick,
              isDone: widget.note!.isDone));
        } else {
          var notes = TodoData(
              image: "",
              tag: '',
              id: notesList[notesList.length - 1].id + 1,
              title: _titleController.text,
              content: content.trim(),
              date: day.trim() + "/" + month + "/" + year,
              time: timePick,
              isDone: false);
          widget.addNote(notes);
        }
      }
    }
  }
}
