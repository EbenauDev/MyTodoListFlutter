import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_todo_list/get_it_provider.dart';
import 'package:my_todo_list/models/task_model.dart';
import 'package:my_todo_list/pages/listagem/listagem_controller.dart';
import 'package:my_todo_list/utils/my_item.dart';

class listagemViewModel extends StatefulWidget {
  const listagemViewModel({super.key});

  @override
  State<listagemViewModel> createState() => _listagemViewModelState();
}

class _listagemViewModelState extends State<listagemViewModel> {
  late ListagemController _controller;
  late Future<List<TaskModel>> carregarTarefa;
  @override
  void initState() {
    _controller = serviceDependency.get<ListagemController>();
    carregarTarefa = _controller.recuperarTarefas();
    super.initState();
  }

  void novaTarefa() {}

  void detalhesDaTask(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 5),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(16, 49, 97, 1),
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Form(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .9,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                suffixIcon: SizedBox(
                                  width: 30,
                                  child: TextButton(
                                    onPressed: novaTarefa,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'TO DO',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 280,
                      child: FutureBuilder(
                        future: carregarTarefa,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) return ListView();

                          return ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              for (var tarefa in snapshot.data!)
                                MyItem(
                                  tarefa: tarefa,
                                  onTap: detalhesDaTask,
                                )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
