import 'package:flutter/material.dart';
import 'package:flutter_todo_list/widgets/todo_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> todoList = [];

  final TextEditingController todoController = TextEditingController();

  void handleAddTodo() {
    String currentTodo = todoController.text;
    setState(() {
      todoList.add(currentTodo);
      todoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Lista de Tarefas",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 500,
                      child: TextField(
                        controller: todoController,
                        decoration: const InputDecoration(
                          labelText: "Tarefa",
                          hintText: "Ex: Estudar Economia.",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(50),
                        textStyle: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: handleAddTodo,
                      child: const Icon(
                        Icons.add,
                        size: 24,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: 500,
                  child: Flexible(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        for (String todo in todoList) TodoListItem(todo: todo),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
