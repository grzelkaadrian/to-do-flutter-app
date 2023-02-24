import 'package:flutter/material.dart';
import 'to_do_object.dart';

class ToDoItem extends StatelessWidget {
  final ToDoObject todo;
  final dynamic onChange;
  final dynamic onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onChange,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 0.5))),
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onChange(todo);
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.red,
        ),
        title: Text(
          todo.taskName!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
            color: Colors.red,
            iconSize: 25,
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id);
            },
          ),
        ),
    );
  }
}
