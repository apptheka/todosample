import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:todolist/app/constant.dart';
import 'package:todolist/data/data_source/binding/local/binding_local.dart';
import 'package:todolist/domain/repository/home_todo_repository.dart';
import 'package:todolist/models/todo_time.dart';
import '../../data/data_source/common/base_datasource_factory.dart';
import '../../data/data_source/datasource_factory.dart';
import '../../data/network/error_handler.dart';
import '../../data/network/failure.dart';

class HomeTodoRepositoryImpl extends HomeTodoRepository {
  final BindingDataSourceFactory bindingDataSourceFactory;
  HomeTodoRepositoryImpl(this.bindingDataSourceFactory);

  @override
  Future<Either<Failure, List<TodoData>>> getDateTodo(String date) async {
    BindingLocal? binding = bindingDataSourceFactory
        .createData(DataSourceState.local) as BindingLocal;

    try {
      final data = await binding.getStringValue(HiveFieldConstant.TODO);
      return Right(_getDateTodo(
          date,
          List.from(json.decode(data))
              .map((e) => TodoData.fromJson(e))
              .toList()));
    } catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  List<TodoData> _getDateTodo(String date, List<TodoData> data) {
    return data.where((todoData) => todoData.date == date).toList();
  }

  @override
  Future<Either<Failure, List<TodoData>>> delete(
      String date, TodoData note) async {
    BindingLocal? binding = bindingDataSourceFactory
        .createData(DataSourceState.local) as BindingLocal;

    try {
      final data = await binding.getStringValue(HiveFieldConstant.TODO);

      List<TodoData> tempDate = [];

      try {
        tempDate = List.from(json.decode(data))
            .map((e) => TodoData.fromJson(e))
            .toList();
      } catch (e) {}

      int i = tempDate.indexWhere((item) => item.id == note.id);
      tempDate.removeAt(i);

      String jsonstringmap = json.encode(tempDate);
      print(jsonstringmap);
      await binding.setData(HiveFieldConstant.TODO, jsonstringmap);

      return Right(_getDateTodo(date, tempDate));
    } catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<TodoData>>> markTodo(
      String date, TodoData note) async {
    BindingLocal? binding = bindingDataSourceFactory
        .createData(DataSourceState.local) as BindingLocal;

    try {
      final data = await binding.getStringValue(HiveFieldConstant.TODO);

      List<TodoData> tempDate = [];

      try {
        tempDate = List.from(json.decode(data))
            .map((e) => TodoData.fromJson(e))
            .toList();
      } catch (e) {}
      int i = tempDate.indexWhere((item) => item.id == note.id);
      tempDate[i].isDone = note.isDone;
      print(tempDate[i].isDone.toString());
      String jsonstringmap = json.encode(tempDate);
      print(jsonstringmap);
      await binding.setData(HiveFieldConstant.TODO, jsonstringmap);

      return Right(_getDateTodo(date, tempDate));
    } catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<TodoData>>> addTodo(TodoData note) async {
    BindingLocal? binding = bindingDataSourceFactory
        .createData(DataSourceState.local) as BindingLocal;
    try {
      final data = await binding.getStringValue(HiveFieldConstant.TODO);
      List<TodoData> notesList = [];
      try {
        notesList = List.from(json.decode(data))
            .map((e) => TodoData.fromJson(e))
            .toList();
      } catch (e) {}
      notesList.add(note);
      String jsonstringmap = json.encode(notesList);
      print(jsonstringmap);
      await binding.setData(HiveFieldConstant.TODO, jsonstringmap);

      return Right(notesList);
    } catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<TodoData>>> editTodo(TodoData note) async {
    BindingLocal? binding = bindingDataSourceFactory
        .createData(DataSourceState.local) as BindingLocal;

    try {
      final data = await binding.getStringValue(HiveFieldConstant.TODO);
      List<TodoData> notesList = [];
      try {
        notesList = List.from(json.decode(data))
            .map((e) => TodoData.fromJson(e))
            .toList();
      } catch (e) {}

      int i = notesList.indexWhere((item) => item.id == note.id);
      notesList.removeAt(i);
      notesList.add(note);
      String jsonstringmap = json.encode(notesList);
      print(jsonstringmap);
      await binding.setData(HiveFieldConstant.TODO, jsonstringmap);
      return Right(notesList);
    } catch (error) {
      print(error);
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
