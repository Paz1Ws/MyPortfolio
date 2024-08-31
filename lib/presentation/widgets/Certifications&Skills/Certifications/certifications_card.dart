import 'package:flutter/material.dart';

class CertificationCard extends StatelessWidget {
  const CertificationCard({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return const Center(
          child: Icon(Icons.error_outline),
        );
      },
    );
  }
}
