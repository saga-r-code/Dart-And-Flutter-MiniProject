import 'package:flutter/material.dart';
import 'todo_item.dart';

class TodoList extends StatefulWidget {
  TodoList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> _todos = [];

  void _addTodo(String todo) {
    setState(() {
      _todos.add(todo);
    });
  }

  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          return TodoItem(
            todo: _todos[index],
            onDelete: () => _removeTodo(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTodoDialog(context),
        tooltip: 'Add Todo',
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTodo = "";
        return AlertDialog(
          title: Text('Add a new todo'),
          content: TextField(
            onChanged: (value) {
              newTodo = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Add'),
              onPressed: () {
                _addTodo(newTodo);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}