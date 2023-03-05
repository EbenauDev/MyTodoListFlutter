import 'package:flutter/material.dart';

class DialogFormulario extends StatefulWidget {
  const DialogFormulario({super.key});

  @override
  State<DialogFormulario> createState() => _DialogFormularioState();
}

class _DialogFormularioState extends State<DialogFormulario> {
  final _formKey = GlobalKey<FormState>();
  bool possuiDataDeConclusao = false;

  void onChangeCheckbox() {
    setState(() {
      possuiDataDeConclusao = !possuiDataDeConclusao;
    });
  }

  void mostrarDatePicker() {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width * .88,
          height: MediaQuery.of(context).size.height * .80,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nova tarefa',
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Icon(Icons.close),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text('Tarefa'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      maxLines: 3,
                      maxLength: 256,
                      decoration: InputDecoration(
                        label: Text('Descrição (opcional)'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: GestureDetector(
                            onTap: onChangeCheckbox,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 28,
                                  child: Checkbox(
                                    value: possuiDataDeConclusao,
                                    onChanged: ((_) => onChangeCheckbox()),
                                  ),
                                ),
                                Text('Agendar')
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            width: 180,
                            child: TextField(
                              enabled: possuiDataDeConclusao,
                              onTap: mostrarDatePicker,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                hintText: 'DD/MM/YYYY',
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: null,
                        child: Text('Salvar'),
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 19, 76, 162),
                          fixedSize: Size(145, 30),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
