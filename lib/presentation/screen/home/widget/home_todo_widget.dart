import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todolist/models/todo_time.dart';
import 'package:todolist/presentation/resources/color_manager.dart';
import 'package:todolist/presentation/resources/font_manager.dart';
import 'package:todolist/presentation/resources/routes_manager.dart';
import 'package:todolist/presentation/resources/styles_manager.dart';
import 'package:todolist/presentation/resources/values_manager.dart';
import 'package:todolist/presentation/screen/addTodo/add_page.dart';
import 'package:todolist/presentation/screen/addTodo/widget/add_screen.dart';
import 'package:todolist/presentation/screen/home/widget/todo_item_widget.dart';
import 'package:todolist/presentation/widget/app_text.dart';

typedef DataCallback = void Function();

class HomeTodoScreen extends StatefulWidget {
  List<TodoData> todo = [];
  Function(DateTime) onDateChange;
  Function(DateTime, TodoData) deleteNote;
  Function(DateTime, TodoData) markDone;
  HomeTodoScreen(
      {required this.todo,
      required this.onDateChange,
      required this.deleteNote,
      required this.markDone});

  @override
  State<HomeTodoScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeTodoScreen> {
  bool sorted = false;
  @override
  void initState() {
    super.initState();
  }

  List<TodoData> sortNotesByModifiedTime(List<TodoData> notes) {
    if (sorted) {
      notes.sort((a, b) => a.time.compareTo(b.time));
    } else {
      notes.sort((b, a) => a.time.compareTo(b.time));
    }
    sorted = !sorted;
    return notes;
  }

  void deleteNote(int index) {
    try {
      widget.deleteNote(today, widget.todo[index]);
    } catch (e) {}
  }

  void _markNote(int index) {
    try {
      
      widget.todo[index].isDone = !widget.todo[index].isDone;
      widget.markDone(today, widget.todo[index]);
    } catch (e) {
      print("error $e");
    }
  }

  DateTime today = DateTime.now();
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    print(selectedDay);
    today = selectedDay;
    widget.onDateChange(today);
  }

  bool isPremiumUser = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushReplacementNamed(context, Routes.addTodoRoute,
              arguments: 0);
        },
        elevation: 10,
        backgroundColor: ColorManager.primaryAppColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 38,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(top: AppPadding.p60),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: AppPadding.p12),
                  child: getAppSemiBoldTextView("Todo's List",
                      context: context,
                      color: Colors.black87,
                      fontSize: FontSize.s20),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: TableCalendar(
                  locale: "en_US",
                  focusedDay: today,
                  // calendarStyle: CalendarStyle(outsideDaysVisible: false),
                  rowHeight: 40,
                  startingDayOfWeek: StartingDayOfWeek.monday,

                  headerStyle: HeaderStyle(
                    titleTextStyle: getSemiBoldStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      // Change to your desired color
                    ),
                    leftChevronVisible: true,
                    rightChevronVisible: true,
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: false,
                    // Color for the selected day
                    selectedDecoration: BoxDecoration(
                      color: ColorManager.primaryAppColor,
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(
                      color: Colors.white, // Change to your desired color
                    ),
                    // Color for today's date
                    todayDecoration: BoxDecoration(
                      color: ColorManager.primaryAppColor
                          .withOpacity(.5), // Change to your desired color
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: TextStyle(
                      color: Colors.black, // Change to your desired color
                    ),
                  ),
                  availableGestures: AvailableGestures.all,
                  firstDay: DateTime.utc(1900, 10, 16),
                  lastDay: DateTime.utc(2100, 10, 20),
                  onDaySelected: _onDaySelected,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  calendarFormat: CalendarFormat.week,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppMargin.m12, right: AppMargin.m12),
                child: Divider(
                  thickness: .5,
                  color: ColorManager.primaryAppColor,
                ),
              ),
              getAppSemiBoldTextView(
                  "Select date to check particular date todo's list",
                  context: context,
                  color: Colors.black87,
                  fontSize: FontSize.s10),
              _todoView()
            ],
          ),
        ),
      ),
    );
  }

  Widget _todoView() {
    return widget.todo.length == 0
        ? Column(
            children: [
              Center(
                child: TextButton(
                    child: getAppLightTextView(
                        "No todos added... Click here to add",
                        context: context,
                        color: Colors.black,
                        fontSize: FontSize.s12),
                    onPressed: () async {
                      print("object");
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => AddTodoPage(),
                      ));
                    }),
              )
            ],
          )
        : Expanded(
            child: ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: widget.todo.length,
            itemBuilder: (context, index) {
              return TodoItemWidget(
                todo: widget.todo[index],
                onDelete: (index) => _handleData(index),
                markDone: (index) => _markNote(index),
                index: index,
              );
            },
          ));
  }

  void _handleData(int index) async {
    final result = await confirmDialog(context);
    if (result != null && result) {
      deleteNote(index);
    }
  }

  Future<dynamic> confirmDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey.shade900,
            icon: const Icon(
              Icons.info,
              color: Colors.grey,
            ),
            title: const Text(
              'Are you sure you want to delete?',
              style: TextStyle(color: Colors.white),
            ),
            content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: const SizedBox(
                        width: 60,
                        child: Text(
                          'Yes',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const SizedBox(
                        width: 60,
                        child: Text(
                          'No',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ]),
          );
        });
  }
}
