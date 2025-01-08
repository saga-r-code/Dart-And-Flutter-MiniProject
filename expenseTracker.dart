import 'dart:io';

// define a class to represent an expense
class Expensetracker {
  final String description;
  final double amount;
  final String Category;

// constructor to initialize the expense details
  Expensetracker(this.description, this.amount, this.Category);

// Override toString method ro display expense details
  @override
  String toString() {
    return "Description: $description\nAmount: ${amount.toStringAsFixed(2)}t\nCategory: $Category";
  }
}

void addExpense(List<Expensetracker> expenses) {
  stdout.write("Enter Expense Description: ");
  String? description = stdin.readLineSync();

  stdout.write("Enter Expense Amount: ");
  String? amountInput = stdin.readLineSync();
  double? amount = double.tryParse(amountInput ?? '');

  stdout.write("Enter Expense Category: ");
  String? category = stdin.readLineSync();

  if (description != null && amount != null && category != null) {
    expenses.add(Expensetracker(description, amount, category));
    print("Expense added successfully!");
  } else {
    print("Invalid input! Please try again.");
  }
}

void viewAllExpenses(List<Expensetracker> expenses) {
  if (expenses.isEmpty) {
    print("No expenses to display!");
  } else {
    print("\nAll Expenses:");
    for (var expense in expenses) {
      print(expense.toString());
    }
  }
}

void viewExpensesByCategory(List<Expensetracker> expenses) {
  stdout.write("\nEnter category to filter expenses: ");
  String? category = stdin.readLineSync();

  if(category != null){
      var filteredExpenses = expenses.where((expense) => expense.Category == category).toList();   

      if(filteredExpenses.isEmpty){
        print("No expenses found for this category!");
      }
      else{
        print("\nExpenses for $category:");
        for (var expense in filteredExpenses) {
          print(expense.toString());
        }
      }
  }
  else{
    print("Invalid input! Please try again.");
  }
}

void calculateTotalExpenses(List<Expensetracker> expenses) {
  double totalExpenses = 0;
  for (var expense in expenses) {
    totalExpenses += expense.amount;
    print("Total Expenses: ${totalExpenses.toStringAsFixed(2)}");
  }
}

void main() {
  List<Expensetracker> expenses = [];
  bool running = true;

  String title = "Welecome To Expense Tracker App";
  print("-" * title.length);
  print(title.toUpperCase());
  print("-" * title.length);

  while (running) {
    DisplayMenu();
    stdout.write("Enter your choice (1-4): ");
    String? input = stdin.readLineSync();
    int? choice = int.tryParse(input ?? '');
    // Handler user's choice using switch case
    switch (choice) {
      case 1:
        addExpense(expenses);
        break;
      case 2:
        viewAllExpenses(expenses);
        break;
      case 3:
        viewExpensesByCategory(expenses);
        break;
      case 4:
        calculateTotalExpenses(expenses);
        break;
      case 5:
        running = false;
        print("Thank you for using the Expense Tracker App!");
        break;
      default:
        print("Invalid choice. Please try again.");
    }
  }
}

void DisplayMenu() {
  print("1. Add Expense");
  print("2. View All Expenses");
  print("3. View Expenses by Category");
  print("4. Calculate Total Expenses");
  print("5. Exit");
}
