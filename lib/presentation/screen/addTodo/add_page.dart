import 'package:intl/intl.dart';
import 'package:todolist/app/constant.dart';
import 'package:todolist/models/todo_time.dart';
import 'package:todolist/presentation/resources/routes_manager.dart';
import 'package:todolist/presentation/screen/home/widget/home_todo_widget.dart';
import '../../widget/base_app_bar.dart';
import '../../../core/page/base_page.dart';
import 'bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/event.dart';
import 'bloc/state.dart';
import 'widget/add_screen.dart';

class AddTodoPage extends BasePage<AddTodoPage, TodoBloc> {
  final TodoData? note;
  final DateTime? dateTime;
  AddTodoPage({this.note, this.dateTime});
  void _addNote(TodoData todo) {
    bloc.add(TodoAddEvent(todoData: todo));
  }

  void _editNote(TodoData todo) {
    bloc.add(TodoEditEvent(todoData: todo));
  }

  @override
  Widget getBody() {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<TodoBloc, TodoState>(listenWhen: (previous, current) {
        return true;
      }, listener: (context, state) async {
        if (state is TodoLoadingState) {
          loadingOverlay.show(context);
        }
        if (state is TodoLoadedState) {
          loadingOverlay.hide();
          Navigator.pushReplacementNamed(context, Routes.homeRoute,
              arguments: 0);
        } else if (state is TodoErrorState) {
          loadingOverlay.hide();
        }
      }, builder: (ctx, state) {
        print(state);
        if (state is TodoLoadedState) {
          print(state.data);
          return AddScreen(
            note: note,
            dateTime: dateTime,
            addNote: _addNote,
            editDone: _editNote,
          );
        } else {
          return AddScreen(
            note: note,
            dateTime: dateTime,
            addNote: _addNote,
            editDone: _editNote,
          );
        }
      }),
    );
  }

  showInSnackBar(BuildContext cxt, String value) {
    ScaffoldMessenger.of(cxt).showSnackBar(
      SnackBar(
        content: Text(value),
        duration: const Duration(milliseconds: 1000),
      ),
    );
  }

  @override
  BaseAppBar? getBar() {
    return null;
  }

  @override
  TodoBloc getBLoc(BuildContext context) => TodoBloc();
}
