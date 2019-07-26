import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:math';

class ChartModel extends Model {
  static const double baseDPI = 160; // The base screen resolution
  /**
   * ISO 8596: 4.2 Visual Acuity Grades and standard optotype grades
   * https://infostore.saiglobal.com/preview/is/en/2018/i.s.eniso8596-2018.pdf
   */
  static const List<Map<String, double>> chartSteps = [
    {"acuity": 20.0, "arc": 5.01},
    {"acuity": 25.0, "arc": 3.98},
    {"acuity": 32.0, "arc": 3.16},
    {"acuity": 40.0, "arc": 2.51},
    {"acuity": 50.0, "arc": 2.00},
    {"acuity": 63.0, "arc": 1.58},
    {"acuity": 80.0, "arc": 1.26},
    {"acuity": 100.0, "arc": 1.00},
  ];
  int chartStepIndex = 4; // Current difficulty
  int _positiveLetters = 0; // Correct guessed letters
  int _wrongLettersInAStep = 0; // Wrong guessed letters in a row
  int _totalGuesses = 0; // Total attempts in test
  int _totalLetters = 30; // Total letters in test
  double distance = 30.0; // Default distance to device
  double ringHeight =
      31.5; // Default height of Landolt chart for 30cm at VA=0.5 in dp
  PageController controller = PageController();

  // Use these to calculate result
  int get positiveLetters => _positiveLetters;
  int get totalLetters => _totalLetters;

  void correctAnswer() {
    _totalGuesses++; // Increment result by one correct letter
    _positiveLetters++; // Reset how many attempts have been wrong in a row

    if (_totalGuesses == _totalLetters) {
      // TODO: Finish the test with current score
      notifyListeners();
    }
  }

  void wrongAnswer() {
    _totalGuesses++;
    _wrongLettersInAStep++;
    if (_wrongLettersInAStep >= 3) {
      // TODO Finish test
      notifyListeners();
    }
  }

  // Navigate to the next element in PageView
  nextPage() {
    controller.nextPage(
        duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  /**
   * Calculate physical ring diameter for current visual acuity step
   *  Formula: ringDiameter = 5 * distance * tan(arc / 60)
   *  Example: A 20/20 Letter at 4m distance would be 5.82mm big
   */
  calculateHeight() {
    double height =
        5 * this.distance * tan(chartSteps[chartStepIndex]["arc"] / 60);
    print("Height: " + height.toString());
    return height;
  }

  // Set the height of the Landolt ring
  setHeight(double ratio) {
    // TODO keep track of visual acuity steps and increase / decrease
    double height = calculateHeight();
    double inch = height / 2.54; // cm -> in conversion
    this.ringHeight =
        (inch * baseDPI * ratio) / ratio / 10; // in -> dp conversion
    print("ring in dp: " + ringHeight.toString());
  }
}
