import 'package:my_todo_list/models/task_model.dart';
import 'package:my_todo_list/repositories/todo_repository.dart';

class ListagemController {
  late TodoRepository _repository;

  ListagemController({required TodoRepository repository}) {
    _repository = repository;
  }

  Future<List<TaskModel>> recuperarTarefas() async{
      return _repository.recuperarTasks();
  }
}
