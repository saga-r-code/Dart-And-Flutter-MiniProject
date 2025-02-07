import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String todo;
  final VoidCallback onDelete;

  TodoItem({required this.todo, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}