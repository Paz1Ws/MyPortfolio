import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/providers/navigations_prov.dart';
import 'package:my_portfolio/presentation/widgets/ForExperience&Techs/skills.dart';

class ExpAndTech extends ConsumerWidget {
  const ExpAndTech({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Skills(),
            // Experience(), Cooming Soon
          ],
        ),
      ),
    );
  }
}
