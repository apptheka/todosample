import 'package:dartz/dartz.dart';
import 'package:todolist/data/network/failure.dart';
import 'package:todolist/models/todo_time.dart';

abstract class HomeTodoRepository {
  Future<Either<Failure, List<TodoData>>> getDateTodo(String date);
  Future<Either<Failure, List<TodoData>>> delete(String date, TodoData note);
  Future<Either<Failure, List<TodoData>>> markTodo(String date, TodoData note);
  Future<Either<Failure, List<TodoData>>> addTodo(TodoData note);
  Future<Either<Failure, List<TodoData>>> editTodo(TodoData note);
}
