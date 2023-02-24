class ToDoObject {
  String? id;
  String? taskName;
  bool isDone;

  ToDoObject({
    required this.id,
    required this.taskName,
    this.isDone = false,
  });

  static List<ToDoObject> todoList() {
    return [
      ToDoObject(id: '01', taskName: 'Go to the gym', isDone: true ),
      ToDoObject(id: '02', taskName: 'Buy Groceries', isDone: true ),
      ToDoObject(id: '03', taskName: 'Finish this app', ),
    ];
  }
}