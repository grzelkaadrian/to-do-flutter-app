import 'package:flutter/material.dart';
import 'to_do_object.dart';
import 'to_do_item.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final todosList = ToDoObject.todoList();
  List<ToDoObject> foundToDo = [];
  final _textController = TextEditingController();

  @override
  void initState() {
    foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            children: [
              searchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: const Text(
                        'Tasks left to do:',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    for (ToDoObject todo in foundToDo.reversed)
                      ToDoItem(
                        todo: todo,
                        onChange: _handleChange,
                        onDeleteItem: _deleteItem,
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                  left: 20,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                      hintText: 'Add a new item', border: InputBorder.none),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 20,
                right: 20,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      _addItem(_textController.text);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.black,
                          content: Text(
                            'Please enter a valid name!',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.red,
                    minimumSize: const Size(50, 50),
                    elevation: 10,
                  ),
                  child: const Icon(Icons.add)),
            ),
          ]),
        ),
      ],
    );
  }

  void _handleChange(ToDoObject chosenItem) {
    setState(() {
      chosenItem.isDone = !chosenItem.isDone;
    });
  }

  void _deleteItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addItem(String inputName) {
    setState(() {
      todosList.add(ToDoObject(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        taskName: inputName,
      ));
    });
    _textController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDoObject> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.taskName!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      foundToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.red,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
