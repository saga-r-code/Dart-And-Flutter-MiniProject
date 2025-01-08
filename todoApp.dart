import 'dart:io';

class Task {
  final String task;
  bool isCompleted = false;

  Task(this.task) : isCompleted = false;

  void markAsComplete() {
    isCompleted = true;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "${isCompleted ? "X" : ""} $task";
  }
}

// See All Task
void viewTask(List<Task> todoList) {
  if (todoList.isEmpty) {
    print("\nNo Taks Available.");
  } else {
    print("\nYour Tasks:- \n");
    for (int i = 0; i < todoList.length; i++) {
      print("${i + 1}: ${todoList[i]}");
    }
  }
}

// Add Task
void addTask(List<Task> todoList) {
  stdout.write("\nEnter New Task: ");
  String? task = stdin.readLineSync();
  if (task != null && task.isNotEmpty) {
    todoList.add(Task(task));
    print("Task Add SuccessFully");
  } else {
    print("Please Enter Task Properly");
  }
}


// Mark Task As Completed
void markTaskAsCompleted(List<Task> todoList) {
  if(todoList.isEmpty){
    print("\nNo Tasks To Mark As Completed");
    return;
  }

  stdout.write("Enter task number to mark as completed: ");
  int? taskinput = int.tryParse(stdin.readLineSync() ?? '');

  if(taskinput != null && taskinput > 0 && taskinput <= todoList.length){
    todoList[taskinput - 1].markAsComplete();
  }else{
    print("Invalid task number. Please try again");
  }
}

// Delete Task
void deleteTask(List<Task> todoList) {
  if (todoList.isEmpty) {
    print("\nNo Tasks To Delete");
    return;
  }

  stdout.write("\nEnter Task Number To Delete: ");
  String? input = stdin.readLineSync();
  int? index = int.tryParse(input ?? ''); //check the value
  if (index != null && index > 0 && index <= todoList.length) {
    Task removeTask = todoList.removeAt(index - 1);
    print("Task $removeTask Delete Successfully. ");
  } else {
    print("Invalid task number");
  }
}

void main() {
  List<Task> todoList = [];
  bool running = true;
  while (running) {
    String title = "Welecome to Todo App";
    print("\n\n");
    print("-" * title.length);
    print(title);
    print("-" * title.length);

    print("1: View tasks\n");
    print("2: Add TasK\n");
    print("3: Delete Task\n");
    print("4: Mark Task As Completed\n");
    print("5: Exit\n");

    stdout.write("Choose Option (1 - 5): ");

    int? choice = int.tryParse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        viewTask(todoList);
        break;
      case 2:
        addTask(todoList);
        break;
      case 3:
        deleteTask(todoList);
        break;
      case 4:
        markTaskAsCompleted(todoList);
        break;
      case 5:
        running = false;
        print("GoodBye Broo ");
        return;
      default:
        print("Invalid Choice Please Try Again");
        return;
    }
  }
}
