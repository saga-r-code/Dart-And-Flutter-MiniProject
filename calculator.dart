import 'dart:io'; // For input and output

/// This is the main function of the calculator app
void main() {
  /// Welcome message
  print("-" * 26);
  String title = "Welecome To Calaulator App";
  print(title);
  print("-" * title.length);

  /// Get the first number from the user
  stdout.write("Enter First Number:- ");
  String strNum1 = stdin.readLineSync()!;
  double firstNumber = double.parse(strNum1);

  /// Get the operator from the user
  stdout.write("Enter Opeartor (+, -, *, /, %):- ");
  String operatorStr = stdin.readLineSync()!;

  /// Get the second number from the user
  stdout.write("Enter Second Number:- ");
  String strnum2 = stdin.readLineSync()!;
  double secondNumber = double.parse(strnum2);

  /// Perform the calculation based on the operator
  late double result;
  switch (operatorStr) {
    case '+':
      result = firstNumber + secondNumber;
      break;
    case '-':
      result = firstNumber - secondNumber;
      break;
    case '*':
      result = firstNumber * secondNumber;
      break;
    case '/':
      if (secondNumber == 0) {
        print("Cannot divide by zero");
        break;
      } else {
        result = firstNumber / secondNumber;
        break;
      }
    case '%':
      result = firstNumber % secondNumber;
      
      break;
    default:
      print("Invalid Operation");
      return;
  }
  /// Print the result
  print("Result: ${result}");

}

