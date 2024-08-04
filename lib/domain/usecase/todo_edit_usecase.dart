import 'package:dartz/dartz.dart';
import 'package:todolist/data/network/failure.dart';
import 'package:todolist/domain/repository/home_todo_repository.dart';
import 'package:todolist/domain/usecase/base_usecase.dart';
import 'package:todolist/models/todo_time.dart';

class TodoEditUseCase
    implements BaseUseCase<TodoEditUseCaseInput, List<TodoData>> {
  final HomeTodoRepository _repository;

  TodoEditUseCase(this._repository);

  @override
  Future<Either<Failure, List<TodoData>>> execute(
      TodoEditUseCaseInput input) async {
    return _repository.editTodo(input.data);
  }
}

class TodoEditUseCaseInput {
  TodoData data;
  TodoEditUseCaseInput(this.data);
}
