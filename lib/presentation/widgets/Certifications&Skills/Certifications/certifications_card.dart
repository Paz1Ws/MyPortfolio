import 'package:flutter/material.dart';

class CertificationCard extends StatelessWidget {
  const CertificationCard({
    super.key,
    required this.image,
    this.fit = BoxFit.contain,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.height,
    this.width,
  });

  final String image;
  final BoxFit fit;
  final BorderRadius borderRadius;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.8,
        width: MediaQuery.sizeOf(context).width * 0.5,
        child: Image.asset(
          image,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(Icons.error_outline),
            );
          },
        ),
      ),
    );
  }
}
