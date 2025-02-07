import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Main Function
void main() => runApp(MyApp()); // Run the application with MyApp as the root widget

// App Root
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Set up a ChangeNotifierProvider to provide the ExpensesProvider to the app
      create: (context) => ExpensesProvider(),
      child: MaterialApp(
        title: 'Expenses Tracker', // App title
        theme: ThemeData(
          primarySwatch: Colors.blue, // App theme with blue primary color
          visualDensity: VisualDensity.adaptivePlatformDensity, // Adaptive visual density
        ),
        debugShowCheckedModeBanner: false, // Disable the debug banner
        home: HomeScreen(), // Set the home screen to HomeScreen
      ),
    );
  }
}

// State Management
class ExpensesProvider with ChangeNotifier {
  // Private list to store expenses
  final List<Map<String, dynamic>> _expenses = [];

  // Public getter to retrieve the expenses
  List<Map<String, dynamic>> get expenses => _expenses;

  // Add a new expense to the list
  void addExpense(Map<String, dynamic> expense) {
    _expenses.add(expense);
    notifyListeners(); // Notify listeners that the data has changed
  }

  // Update an existing expense in the list
  void updateExpense(int index, Map<String, dynamic> updatedExpense) {
    _expenses[index] = updatedExpense;
    notifyListeners(); // Notify listeners that the data has changed
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses Tracker'), // App bar title
        actions: [
          // Add button in the app bar
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navigate to the AddExpenseScreen when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddExpenseScreen()),
              );
            },
          ),
        ],
      ),
      body: ExpensesList(), // Display the list of expenses
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), // Floating action button with a '+' icon
        onPressed: () {
          // Navigate to the AddExpenseScreen when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExpenseScreen()),
          );
        },
      ),
    );
  }
}

// Expenses List
class ExpensesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expenses = Provider.of<ExpensesProvider>(context).expenses; // Get expenses from the provider

    return ListView.builder(
      itemCount: expenses.length, // Number of items in the expenses list
      itemBuilder: (context, index) {
        final expense = expenses[index]; // Get the expense at the current index
        final date = DateTime.parse(expense['date']); // Parse the date from the expense
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10), // Card styling
          child: ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.attach_money), // Money icon for the leading part
            ),
            title: Text(expense['title']), // Expense title
            subtitle: Text(
                'Category: ${expense['category']} • ${date.toLocal().toString().split(' ')[0]}'), // Display category and date
            trailing: Text('\₹: ${expense['amount']}'), // Display the amount with a dollar sign
            onTap: () {
              // Navigate to the EditExpenseScreen when the expense is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditExpenseScreen(expense: expense, index: index),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// Add Expense Screen
class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final titleController = TextEditingController(); // Controller for the title text field
  final amountController = TextEditingController(); // Controller for the amount text field
  String? selectedCategory; // The selected category for the expense

  final List<String> categories = ['Food', 'Transport', 'Entertainment', 'Bills', 'Others']; // List of available categories

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Expense')), // App bar title for adding new expense
      body: Padding(
        padding: EdgeInsets.all(16.0), // Padding for the form
        child: Form(
          key: _formKey, // Assign form key for validation
          child: Column(
            children: [
              // Title input field
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              // Amount input field
              TextFormField(
                controller: amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number, // Set keyboard type for numbers
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  return null;
                },
              ),
              // Category dropdown
              DropdownButtonFormField<String>(
                value: selectedCategory,
                hint: Text('Select Category'),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value; // Update selected category
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a category';
                  }
                  return null;
                },
                items: categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category), // Display category options
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              // Save button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, add the expense and navigate back
                    Provider.of<ExpensesProvider>(context, listen: false).addExpense({
                      'title': titleController.text,
                      'amount': double.parse(amountController.text),
                      'category': selectedCategory,
                      'date': DateTime.now().toString(), // Date and time when the expense is added
                    });
                    Navigator.pop(context); // Return to Home Screen
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Edit Expense Screen
class EditExpenseScreen extends StatefulWidget {
  final Map<String, dynamic> expense;
  final int index;

  EditExpenseScreen({required this.expense, required this.index});

  @override
  _EditExpenseScreenState createState() => _EditExpenseScreenState();
}

class _EditExpenseScreenState extends State<EditExpenseScreen> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  late TextEditingController titleController; // Controller for the title input
  late TextEditingController amountController; // Controller for the amount input
  String? selectedCategory; // Selected category for the expense

  final List<String> categories = ['Food', 'Transport', 'Entertainment', 'Bills', 'Others']; // List of available categories

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current expense data
    titleController = TextEditingController(text: widget.expense['title']);
    amountController = TextEditingController(text: widget.expense['amount'].toString());
    selectedCategory = widget.expense['category']; // Set the selected category to current expense's category
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Expense')), // App bar title for editing expense
      body: Padding(
        padding: EdgeInsets.all(16.0), // Padding for the form
        child: Form(
          key: _formKey, // Form key for validation
          child: Column(
            children: [
              // Title input field
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              // Amount input field
              TextFormField(
                controller: amountController,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number, // Set keyboard type for numbers
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  return null;
                },
              ),
              // Category dropdown
              DropdownButtonFormField<String>(
                value: selectedCategory,
                hint: Text('Select Category'),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value; // Update selected category
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a category';
                  }
                  return null;
                },
                items: categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category), // Display category options
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              // Update button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, update the expense and navigate back
                    Provider.of<ExpensesProvider>(context, listen: false)
                        .updateExpense(widget.index, {
                      'title': titleController.text,
                      'amount': double.parse(amountController.text),
                      'category': selectedCategory,
                      'date': DateTime.now().toString(), // Update date to current
                    });
                    Navigator.pop(context); // Return to Home Screen
                  }
                },
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
