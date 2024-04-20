import 'dart:io';
import 'dart:core';

bool winner = false;
bool isXturn = true;
int moveCount = 0;

List<String> values = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
List<String> combinations = ['012', '048', '036', '147', '246', '345', '678' ];


bool checkCombination(String combination, String checkFor){
  List<int> numbers = combination.split('').map((item){
    return int.parse(item);
  }).toList();
  bool match = false;
  for (final item in numbers){
    if(values[item] == checkFor){
      match = true;
    }else{
      match = false;
      break;

    }
  }
  return match;
}

void checkwinner(String player){
  for (final item in combinations){
    bool combinationValidity = checkCombination(item, player);
    if(combinationValidity == true ){
      print('$player WON!!!');
      winner = true;
      break;
    }
  }
}

void generateBoard(){
  print('   |   |   ');
  print('${values[0]} | ${values[1]} | ${values[2]} ');
  print('   |   |   ');
  print('${values[3]} | ${values[4]} | ${values[5]} ');
  print('   |   |   ');
  print('${values[6]} | ${values[7]} | ${values[8]} ');
  print('   |   |   ');
}

void getnextCharacter(){
  print('Choose number for ${isXturn == true? "X": "O"}'); //handle null input
  //int number = int.parse(stdin.readLineSync());
  String? input = stdin.readLineSync();
  if (input != null) {
    int number = int.parse(input);
  // ^          ^    ^              ^
// |          |    |              |
// |          |    |              +-- Parse the input string as an integer
// |          |    +-- Read a line of input from the console
// |          +-- Object representing standard input stream
// +-- Declare a variable named "number" of type integer
if (number >= 1 && number <= 9) { //check if the number is valid
  values[number -1 ] = isXturn ? 'X': 'O';
  //change a player turn
  isXturn = !isXturn;
  //increment move count
  moveCount++;
  if (moveCount == 9){
    winner = true;
    print('Draw you mofo!');
  }else{
    //clear the console
    clearScreen();
    //redraw the board with new information
    generateBoard();
  }
   } else {
      print('Invalid input. Please choose a number between 1 and 9.');
   }
}

}
void main(){
  generateBoard();
  getnextCharacter();
}

void clearScreen() {
  // Print enough newline characters to clear the console screen
  print('\n' * 30);
}

