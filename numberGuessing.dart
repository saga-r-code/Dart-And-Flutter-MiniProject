import 'dart:io';
import 'dart:math';

void main(){
  String title = "Welecome To Number Guessing Game";
  print("-" * title.length);
  print(title);
  print("-" * title.length);

  final random = Random();
  int targetNumber = random.nextInt(100) + 1;
  int attepmts = 0;
  bool isGuess = false;

  print("Can You Guess The Number Between 1 To 100? ");

  while (!isGuess) {
      stdout.write("Enter Your Guess: ");
      String? input = stdin.readLineSync();
      int? guess = int.tryParse(input ?? '');

      if(guess == null){
        print("Enter the valid Number");
        continue;
      }

      attepmts++;

      if (guess > targetNumber) {
          print("Try Again !! To High Guess");
      }
      else if (guess < targetNumber) {
        print("Try Again !! To Low Guess");
      }
      else{
        print("Congratulations! You guessed the number in $attepmts attepmts");
        isGuess = true;
      }

    }
  
}
