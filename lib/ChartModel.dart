import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ChartModel extends Model {
  static const double baseDPI = 160;
  int _positiveLetters = 0; // Correct guessed letters
  int _wrongLettersInARow = 0; // Wrong guessed letters in a row
  int _totalGuesses = 0; // Total attempts in test
  int _totalLetters = 30; // Total letters in test
  double distance = 30.0; // Default distance to device
  double ringHeight = 189.0; // Default height of Landolt chart for 30cm
  PageController controller = PageController();

  // Use these to calculate result
  int get positiveLetters => _positiveLetters;
  int get totalLetters => _totalLetters;

  void correctAnswer() {
    _totalGuesses++; // Increment result by one correct letter
    _positiveLetters++; // Reset how many attempts have been wrong in a row
    _wrongLettersInARow = 0;

    if (_totalGuesses == _totalLetters) {
      // TODO: Finish the test with current score
      notifyListeners();
    }
  }

  void wrongAnswer() {
    _totalGuesses++;
    _wrongLettersInARow++;
    if (_wrongLettersInARow >= 3) {
      // TODO Finish test
      notifyListeners();
    }
  }

  // Navigate to the next element in PageView
  nextPage() {
    controller.nextPage(
        duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  // Set the height of the Landolt ring
  setHeight(double ratio) {
    double inch = this.distance / 2.54; // cm -> in conversion
    this.ringHeight =
        (inch * baseDPI * ratio) / ratio / 10; // in -> dp conversion
  }
}
