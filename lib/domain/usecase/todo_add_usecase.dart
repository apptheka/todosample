import 'package:dartz/dartz.dart';
import 'package:todolist/data/network/failure.dart';
import 'package:todolist/domain/repository/home_todo_repository.dart';
import 'package:todolist/domain/usecase/base_usecase.dart';
import 'package:todolist/models/todo_time.dart';

class TodoAddUseCase
    implements BaseUseCase<TodoAddUseCaseInput, List<TodoData>> {
  final HomeTodoRepository _repository;

  TodoAddUseCase(this._repository);

  @override
  Future<Either<Failure, List<TodoData>>> execute(
      TodoAddUseCaseInput input) async {
    return _repository.addTodo(input.data);
  }
}

class TodoAddUseCaseInput {
  TodoData data;
  TodoAddUseCaseInput(this.data);
}
