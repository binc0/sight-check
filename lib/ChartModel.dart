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
  int chartDifficulty = 4; // Current difficulty
  int totalGuesses = 0; // Total attempts in test
  int _correctGuesses = 0; // Correct guessed letters
  int _wrongGuesses = 0; // Wrong guessed letters in a row
  final int totalAmount = 20; // Total TestCards in test
  double distance = 30.0; // Default distance to device
  double ringHeight =
      31.5; // Default height of Landolt chart for 30cm at VA=0.5 in dp
  PageController controller = PageController();
  bool isLeftEye = true;
  double leftAcuity, rightAcuity;

  void guess(bool isGuessCorrect) {
    totalGuesses++; // Increment result by one correct letter
    if (isGuessCorrect) {
      _correctGuesses++;
    } else {
      _wrongGuesses++;
    }
    // Check whether the tests for on one eye have been completed
    if (totalGuesses % totalAmount == 0) {
      if (isLeftEye) {
        leftAcuity = chartSteps[chartDifficulty]["acuity"];
        isLeftEye = false;
        chartDifficulty = 4;
      } else {
        rightAcuity = chartSteps[chartDifficulty]["acuity"];
      }
    }
    // Change difficulty after five representations
    else if (totalGuesses % 5 == 0) {
      if (_correctGuesses > _wrongGuesses) {
        chartDifficulty++;
      } else {
        chartDifficulty--;
      }
      _correctGuesses = 0;
      _wrongGuesses = 0;
    }
    notifyListeners();
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
    return 5 * this.distance * tan(chartSteps[chartDifficulty]["arc"] / 60);
  }

  // Set the height of the Landolt ring
  setHeight(double ratio) {
    double height = calculateHeight();
    double inch = height / 2.54; // cm -> in conversion
    this.ringHeight =
        (inch * baseDPI * ratio) / ratio / 10; // in -> dp conversion
  }
}
