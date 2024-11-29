import 'dart:math';

import 'package:dynamic_background/widget/color_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///This is a ChangeNotifierProvider for the DynamicBackgroundView
final dynamicBackgroundViewModelProvider =
    ChangeNotifierProvider<DynamicBackgroundViewModel>(
  (_) => DynamicBackgroundViewModel(),
);

/// This is the view-model of the DynamicBackgroundView
class DynamicBackgroundViewModel extends ChangeNotifier {
  ///This is the page controller for the page view used in displaying the color
  /// widgets.
  // ignore: no_magic_number
  PageController pageController = PageController(viewportFraction: 0.2);

  ///This sets the default background color to white
  ///and changes as new colors are generated.
  Color backgroundColor = const Color.fromRGBO(250, 250, 250, 1.0);

  /// This serves as the default color value to be displayed in the ColorWidget
  /// It changes the color changes
  String colorValue = 'RGB(255, 255, 255)';

  /// This serves a list for storing the history of generated colors
  List<ColorWidget> generatedColorsWidgets = [];

  ///This method generates random background colors and simultaneously
  ///adds them to a list of ColorWidgets to be displayed
  void generateRandomBackgroundColor() {
    final Random random = Random();
    final int r = random.nextInt(256);
    final int g = random.nextInt(256);
    final int b = random.nextInt(256);

    backgroundColor = Color.fromRGBO(r, g, b, 1.0);
    colorValue = 'RGB($r, $g, $b)';
    _addGeneratedColorToList(backgroundColor, colorValue);
    notifyListeners();
  }

  void _addGeneratedColorToList(Color color, String colorValue) {
    generatedColorsWidgets.add(
      ColorWidget(
        color: color,
        message: colorValue,
      ),
    );
    pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  /// Resets the background color
  void resetBackgroundColor() {
    backgroundColor = const Color.fromRGBO(255, 255, 255, 1.0);
    generatedColorsWidgets.clear();
    notifyListeners();
  }
}
