import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:my_todo_list/components/dialog_formulario.dart';
import 'package:my_todo_list/get_it_provider.dart';
import 'package:my_todo_list/models/task_model.dart';
import 'package:my_todo_list/pages/listagem/listagem_controller.dart';
import 'package:my_todo_list/utils/my_item.dart';

class ListagemView extends StatefulWidget {
  const ListagemView({super.key});

  @override
  State<ListagemView> createState() => _ListagemViewState();
}

class _ListagemViewState extends State<ListagemView> {
  late ListagemController _controller;
  late Future<List<TaskModel>> carregarTarefasEmAberto;
  late Future<List<TaskModel>> carregarTarefasCompletas;
  @override
  void initState() {
    _controller = serviceDependency.get<ListagemController>();
    carregarTarefasEmAberto = _controller.recuperarTarefas();
    carregarTarefasCompletas = _controller.recuperarTarefasCompletas();
    super.initState();
  }

  void novaTarefa() {
    Navigator.pushNamed(context, '/nova-tarefa');
  }

  void detalhesDaTask() {
    print('detalhesDaTask');
    Navigator.pushNamed(context, '/detalhes-tarefa');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      floatingActionButton: SizedBox(
        width: 50,
        height: 50,
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 19, 76, 162),
          onPressed: novaTarefa,
          child: Icon(Icons.add),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: Row(children: []),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 5),
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(16, 49, 97, 1),
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Form(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .7,
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              hintStyle: TextStyle(color: Colors.white),
                              errorBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: ClipOval(
                              child: TextButton(
                                onPressed: novaTarefa,
                                child: Icon(
                                  Icons.search,
                                  size: 18,
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 19, 76, 162),
                                  foregroundColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
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
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * .75,
                  ),
                  child: SingleChildScrollView(
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
                          height: 220,
                          child: FutureBuilder(
                            future: carregarTarefasEmAberto,
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
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Text(
                              'COMPLETED',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 220,
                          child: FutureBuilder(
                            future: carregarTarefasCompletas,
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
