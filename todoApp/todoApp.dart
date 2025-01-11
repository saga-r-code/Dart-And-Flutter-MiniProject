import 'dart:io'; // For input and output
import 'dart:convert'; // For JSON encoding and decoding

// Define a class to represent a task
class Task {
  /// Task description
   String task;

  /// Task completion status
  bool isCompleted = false;

  /// Constructor
  Task(this.task) : isCompleted = false;

  /// Mark the task as complete
  void markAsComplete() {
    isCompleted = true;
  }

  @override
  /// Convert Task to a string representation
  String toString() {
    return "${isCompleted ?  "✅" : "❌"} $task";
  }

  /// Convert Task to a Map for JSON serialization
  ///
  /// This method is called when we want to store the tasks in a file. It
  /// converts the task object into a Map, which is a simple key-value data
  /// structure. The Map contains the task description and the completion
  /// status of the task.
  Map<String, dynamic> toJson() {
    return {
      'task': task,
      'isCompleted': isCompleted,
    };
  }

  /// Create a Task from a Map (JSON deserialization)
  ///
  /// This method is called when we want to load the tasks from a file. It
  /// takes a Map as an argument, which contains the task description and
  /// the completion status of the task. It then creates a new Task object
  /// based on this information and returns it.
  factory Task.fromJson(Map<String, dynamic> json) {
    Task task = Task(json['task']);
    task.isCompleted = json['isCompleted'];
    return task;
  }
}

// View all tasks
void viewTask(List<Task> todoList) {
  if (todoList.isEmpty) {
    print("\nNo Tasks Available.");
  } else {
    print("\nYour Tasks:");
    for (int i = 0; i < todoList.length; i++) {
      print("${i + 1}: ${todoList[i]}");
    }
  }
}

// Add a new task
void addTask(List<Task> todoList) {
  stdout.write("\nEnter New Task: ");
  String? task = stdin.readLineSync();
  if (task != null && task.isNotEmpty) {
    todoList.add(Task(task));
    print("Task Added Successfully");
  } else {
    print("Please Enter Task Properly");
  }
}

// Delete a task
void deleteTask(List<Task> todoList) {
  if (todoList.isEmpty) {
    print("\nNo Tasks To Delete");
    return;
  }

  stdout.write("\nEnter Task Number To Delete: ");
  String? input = stdin.readLineSync();
  int? index = int.tryParse(input ?? '');
  if (index != null && index > 0 && index <= todoList.length) {
    Task removeTask = todoList.removeAt(index - 1);
    print("Task $removeTask Deleted Successfully.");
  } else {
    print("Invalid task number");
  }
}

// Edit Task
void editTask(List<Task> todoList) {
  if (todoList.isEmpty) {
    print("\nNo Tasks To Edit");
    return;
  }

  stdout.write("\nEnter Task Number To Edit: ");
  String? input = stdin.readLineSync();
  int? index = int.tryParse(input ?? '');

  if (index != null && index > 0 && index <= todoList.length) {
    stdout.write("\nEnter New Task Description: ");
    String? newTask = stdin.readLineSync();

    if (newTask != null && newTask.isNotEmpty) {
      todoList[index - 1].task = newTask;
      todoList[index - 1].isCompleted = false;
      print("Task Updated Successfully");
    } else {
      print("Please Enter Task Properly");
    }
  } else {
    print("Invalid task number");
  }
}

// Mark a task as completed
void markTaskAsCompleted(List<Task> todoList) {
  if (todoList.isEmpty) {
    print("\nNo Tasks To Mark As Completed");
    return;
  }

  stdout.write("Enter task number to mark as completed: ");
  int? taskInput = int.tryParse(stdin.readLineSync() ?? '');

  if (taskInput != null && taskInput > 0 && taskInput <= todoList.length) {
    todoList[taskInput - 1].markAsComplete();
    print("Task Marked As Completed");
  } else {
    print("Invalid task number. Please try again");
  }
}


// Save tasks to a file
void saveTask(List<Task> todoList) {
  final file = File('tasks.json'); // Specify the file to save tasks
  final List<Map<String, dynamic>> taskList = todoList.map((task) => task.toJson()).toList(); // Convert tasks to JSON format
  file.writeAsStringSync(jsonEncode(taskList)); // Write JSON to the file
  print("Tasks Saved Successfully"); // Confirmation message
}

// Load tasks from a file
List<Task> loadTask() {
  final file = File('tasks.json'); // Specify the file to load tasks from
  if (file.existsSync()) { // Check if the file exists
    final String readData = file.readAsStringSync(); // Read the file content as a string
    final List<dynamic> taskList = jsonDecode(readData); // Decode the JSON string to a list
    return taskList.map((task) => Task.fromJson(task)).toList(); // Convert list items to Task objects
  } else {
    print("File Not Found"); // Message if file doesn't exist
    return []; // Return an empty list if no file found
  }
}

void main() {
  List<Task> todoList = loadTask(); // Load tasks from file
  bool running = true; // Control the loop
  while (running) {
    String title = "Welcome to Todo App";
    print("\n\n");
    print("-" * title.length);
    print(title);
    print("-" * title.length);

    // Display menu options
    print("\n1: View Tasks");
    print("\n2: Add Task");
    print("\n3: Delete Task");
    print("\n4: Edit Task");
    print("\n5: Mark Task As Completed");
    print("\n6: Save And Exit");

    stdout.write("\nChoose Option (1 - 5): ");

    int? choice = int.tryParse(stdin.readLineSync()!);

    // Handle menu choices
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
        editTask(todoList);
      case 5:
        markTaskAsCompleted(todoList);
        break;
      case 6:
        saveTask(todoList);
        running = false;
        print("Goodbye!");
        break;
      default:
        print("Invalid Choice. Please Try Again.");
    }
  }
}
