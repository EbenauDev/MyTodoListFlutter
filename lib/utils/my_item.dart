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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
        constraints: BoxConstraints(
          minHeight: 60,
          maxWidth: double.infinity,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 6, top: 6),
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
                      color: Colors.white,
                      child: Icon(
                        Icons.done,
                        size: 18,
                        color: Colors.green,
                      ),
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
                  '28/02/2023',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
