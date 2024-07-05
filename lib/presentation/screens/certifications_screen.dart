import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/providers/media_provider.dart';
import 'package:my_portfolio/config/providers/navigations_key_prov.dart';
import 'package:my_portfolio/presentation/widgets/ForExperience&Techs/certifications.dart';

class CertificationsScreen extends ConsumerWidget {
  const CertificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: NavigationByPages().certificationsSection,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height - 100,
            child: const CertificationsView(),
          )
        ]),
      ),
    );
  }
}
