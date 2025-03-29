import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo_list/models/todo.dart';
import 'package:intl/intl.dart';

class TodoListItem extends StatefulWidget {
  final Todo todo;
  final Function(Todo) onDelete;

  const TodoListItem({super.key, required this.todo, required this.onDelete});

  @override
  State<TodoListItem> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      closeOnScroll: true,
      endActionPane: ActionPane(
        extentRatio: 0.20,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => widget.onDelete(widget.todo),
            padding: EdgeInsets.all(0),
            icon: Icons.delete,
            backgroundColor: Colors.red,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              DateFormat('dd/MM/yyyy - HH:mm').format(widget.todo.date),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.todo.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
