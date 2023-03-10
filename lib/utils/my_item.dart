import 'package:flutter/material.dart';
import 'package:my_todo_list/models/task_model.dart';

class MyItem extends StatefulWidget {
  const MyItem({
    super.key,
    required this.tarefa,
    required this.onTap,
  });
  final TaskModel tarefa;
  final Function onTap;

  @override
  State<MyItem> createState() => _MyItemState();
}

class _MyItemState extends State<MyItem> {
  @override
  void initState() {
    super.initState();
  }

  String toBrFormat(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
          minHeight: 60,
          maxWidth: double.infinity,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.only(bottom: 6, top: 6),
        child: Material(
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () => widget.onTap(),
            borderRadius: BorderRadius.circular(8),
            child: Ink(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 22,
                          height: 22,
                          child: ClipOval(
                            child: Container(
                              color: widget.tarefa.isCompleted!
                                  ? Colors.green[50]
                                  : Colors.white,
                              child: widget.tarefa.isCompleted!
                                  ? Icon(
                                      Icons.done,
                                      size: 18,
                                      color: Colors.green,
                                    )
                                  : Container(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.tarefa.title!,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700],
                                decoration: widget.tarefa.isCompleted!
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            if (widget.tarefa.description != null)
                              Text(
                                widget.tarefa.description ?? '',
                                style: TextStyle(fontSize: 12),
                              ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.grey[700],
                          size: 21,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          toBrFormat(DateTime.parse(widget.tarefa.dueDate!)),
                          style: TextStyle(fontSize: 12),
                        ),
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
