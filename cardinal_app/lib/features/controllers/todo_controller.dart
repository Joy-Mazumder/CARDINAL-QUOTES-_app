import 'package:get/get.dart';

class TodoItem {
  final String title;
  final String subtitle;
  bool done;
  bool overdue;

  TodoItem({
    required this.title,
    required this.subtitle,
    this.done = false,
    this.overdue = false,
  });
}

class TodoController extends GetxController {
  // Observable list of todos
  var todos = <TodoItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    // initial mock data
    todos.addAll([
      TodoItem(title: "Napa", subtitle: "Everyday At 6.00 Pm"),
      TodoItem(title: "Viglimate", subtitle: "Everyday At 4.00 Pm", done: true),
      TodoItem(title: "Napa", subtitle: "Everyday At 6.00 Pm"),
      TodoItem(title: "Viglimate", subtitle: "Everyday At 4.00 Pm", done: true),
      TodoItem(
          title: "Napa",
          subtitle: "Everyday At 4.00 Pm Overdue",
          overdue: true),

      TodoItem(title: "Montair 10", subtitle: "Everyday At 6.00 Pm"),
    TodoItem(title: "Viglimate", subtitle: "Everyday At 4.00 Pm",),  
    ]);
    
  }

  void addTodo(String title, String subtitle) {
    todos.add(TodoItem(title: title, subtitle: subtitle));
  }

  void toggleDone(int index) {
    todos[index].done = !todos[index].done;
    todos.refresh();
  }
}
