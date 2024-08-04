import 'package:dartz/dartz.dart';
import 'package:todolist/data/network/failure.dart';
import 'package:todolist/domain/repository/home_todo_repository.dart';
import 'package:todolist/domain/usecase/base_usecase.dart';
import 'package:todolist/models/todo_time.dart';

class HomeTodoListUseCase
    implements BaseUseCase<HomeTodoListUseCaseInput, List<TodoData>> {
  final HomeTodoRepository _repository;

  HomeTodoListUseCase(this._repository);

  @override
  Future<Either<Failure, List<TodoData>>> execute(
      HomeTodoListUseCaseInput input) async {
    return _repository.getDateTodo(input.dt);
  }
}

class HomeTodoListUseCaseInput {
  String dt;

  HomeTodoListUseCaseInput(this.dt);
}
