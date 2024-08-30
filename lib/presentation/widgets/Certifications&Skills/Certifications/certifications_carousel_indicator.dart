import 'package:flutter/material.dart';

class CertificationsCarouselIndicator extends StatelessWidget {
  final List<String> certificationImagesProvider;
  final int innerCurrentPage;
  final CarouselController controller;

  const CertificationsCarouselIndicator({
    super.key,
    required this.certificationImagesProvider,
    required this.innerCurrentPage,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: certificationImagesProvider.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => controller.animateTo(entry.key.toDouble(),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut),
          child: Container(
            width: 12.0,
            height: 12.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                  .withOpacity(innerCurrentPage == entry.key ? 0.9 : 0.4),
            ),
          ),
        );
      }).toList(),
    );
  }
}
