import 'package:dynamic_background/feature/dynamic_background/dynamic_background_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
runApp(const  ProviderScope(child: Main()) );
}

/// The main entry of the app
class Main extends StatelessWidget {
/// This is the constructor
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    theme: ThemeData(
      fontFamily: 'Euclid Circular',
    ),
      home: const DynamicBackgroundView(),
    );
  }
}
