import 'package:my_todo_list/models/task_model.dart';

class TodoRepository {
  

  Future<List<TaskModel>> recuperarTasks() async {
    await Future.delayed(Duration(milliseconds: 400));
    List<TaskModel> lista = [
      TaskModel(
        isCompleted: false,
        title: 'Listagem de tarefas',
        description: 'Desenvolver listagem das tarefas',
        dueDate: '2023-02-20T20:00:00',
      ),
      TaskModel(
        isCompleted: false,
        title: 'Pagar a conta de luz',
        dueDate: '2023-02-22T20:00:00',
      ),
      TaskModel(
        isCompleted: false,
        title: 'Levar o cachorro passear',
        dueDate: '2023-02-28T20:00:00',
      ),
    ];
    return lista;
  }
}
