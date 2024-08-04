import 'package:intl/intl.dart';
import 'package:todolist/app/constant.dart';
import 'package:todolist/models/todo_time.dart';
import 'package:todolist/presentation/screen/home/widget/home_todo_widget.dart';
import '../../widget/base_app_bar.dart';
import '../../../core/page/base_page.dart';
import 'bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/event.dart';
import 'bloc/state.dart';

class HomeTodoPage extends BasePage<HomeTodoPage, HomeTodoBloc> {
  void _onDaySelected(DateTime date) {
    bloc.add(HomeTodoEvent(dt: DateFormat(DATE_SAVE_FORMAT).format(date)));
  }

  void _onDeleteSelected(DateTime date, TodoData data) {
    bloc.add(HomeTodoDeleteEvent(
        dt: DateFormat(DATE_SAVE_FORMAT).format(date), todoDat: data));
  }

  void onMarkDone(DateTime date, TodoData data) {
    print(">>><<<HomeTodoPage.onMarkDone>>><<<<" + data.isDone.toString());
    bloc.add(HomeTodoMarkEvent(
        dt: DateFormat(DATE_SAVE_FORMAT).format(date), todoDat: data));
  }

  @override
  Widget getBody() {
    DateTime now = DateTime.now();
    String dt = DateFormat(DATE_SAVE_FORMAT).format(now);
    return BlocProvider(
      create: (context) => bloc..add(HomeTodoEvent(dt: dt)),
      child: BlocConsumer<HomeTodoBloc, HomeTodoState>(
          listenWhen: (previous, current) {
        return true;
      }, listener: (context, state) async {
        if (state is HomeTodoLoadingState) {
          loadingOverlay.show(context);
        }
        if (state is HomeTodoLoadedState) {
          loadingOverlay.hide();
        } else if (state is HomeTodoErrorState) {
          loadingOverlay.hide();
        }
      }, builder: (ctx, state) {
        print(state);
        if (state is HomeTodoLoadedState) {
          print(state.data);
          return HomeTodoScreen(
            todo: state.data,
            onDateChange: _onDaySelected,
            deleteNote: _onDeleteSelected,
            markDone: onMarkDone,
          );
        } else {
          return HomeTodoScreen(
            todo: [],
            onDateChange: _onDaySelected,
            deleteNote: _onDeleteSelected,
            markDone: onMarkDone,
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
  HomeTodoBloc getBLoc(BuildContext context) => HomeTodoBloc();
}
