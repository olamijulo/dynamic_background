import 'package:dynamic_background/feature/dynamic_background/dynamic_background_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///This view is created to demonstrate the dynamic background feature.
class DynamicBackgroundView extends ConsumerWidget {
  ///This is the constructor.
  const DynamicBackgroundView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dynamicBackgroundViewModel =
        ref.watch(dynamicBackgroundViewModelProvider);

    return GestureDetector(
      onTap: dynamicBackgroundViewModel.generateRandomBackgroundColor,
      child: Scaffold(
        backgroundColor: dynamicBackgroundViewModel.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Center(
                  child: Text(
                    'Hello there',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                const Spacer(),
                const Text(
                  'Generated Colors',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 80.0,
                      width: 300.0,
                      child: PageView.builder(
                        controller: dynamicBackgroundViewModel.pageController,
                        padEnds: false,
                        itemCount: dynamicBackgroundViewModel
                            .generatedColorsWidgets.length,
                        itemBuilder: (_, index) {
                          return dynamicBackgroundViewModel
                              .generatedColorsWidgets[index];
                        },
                      ),
                    ),
                    Column(
                      children: [
                        const Text(
                          'Reset',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.refresh),
                          iconSize: 40.0,
                          onPressed:
                              dynamicBackgroundViewModel.resetBackgroundColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
