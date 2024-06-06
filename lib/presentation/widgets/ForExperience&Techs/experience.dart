import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Experience extends ConsumerWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        SizedBox(height: 20),
        Text(
          'Experience',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'I have experience with the following technologies:',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(height: 20),
        // const TechsList(),
      ],
    );
  }
}
