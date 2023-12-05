import 'dart:math';

class CalculateSquare {
  double surfaceCal(double a) {
    return a * a;
  }

  double periCal(double a) {
    return 4 * a;
  }

  double diagCal(double a) {
    return a * sqrt(2);
  }
}

class CalculateRRectangle {
  double surfaceCal(double a, double b) {
    return a * b;
  }

  double periCal(double a, double b) {
    return 2 * (a + b);
  }

  double diagCal(double a, double b) {
    double result = (a * a) + (b * b);
    return sqrt(result);
  }
}

class CalculateParallelogram {
  double surfaceCal(double a, double b, double height) {
    return b * height;
  }

  double periCal(double a, double b, double height) {
    return 2 * (a + b);
  }

  double diagCal(double a, double b, double height) {
    double result = (a * a) + (b * b);
    return sqrt(result);
  }
}

class CalculateRhombus {
  double surfaceCal(double a, double b, double? input_h) {
    return a * input_h!;
  }

  double periCal(double a, double b, double? input_h) {
    return 4 * a;
  }

  double diagCal(double a, double b, double? input_h) {
    double result = (a * a) * 4;
    return sqrt(result);
  }
}
