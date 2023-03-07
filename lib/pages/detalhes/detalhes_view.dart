import 'package:flutter/material.dart';

class DetalhesTarefaView extends StatefulWidget {
  const DetalhesTarefaView({super.key});

  @override
  State<DetalhesTarefaView> createState() => _DetalhesTarefaViewState();
}

class _DetalhesTarefaViewState extends State<DetalhesTarefaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes tarefa')),
    );
  }
}
