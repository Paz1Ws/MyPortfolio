import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/config/providers/media_provider.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({
    super.key,
    required this.riverpodProvider,
    required this.alignment,
  });

  final MediaProvider riverpodProvider;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : alignment == MainAxisAlignment.center
            ? Colors.white
            : Colors.black;

    return Row(
      mainAxisAlignment: alignment,
      children: [
        IconButton(
          onPressed: () {
            riverpodProvider.launchURL(0);
          },
          color: color,
          icon: const Icon(FontAwesomeIcons.linkedinIn),
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {
            riverpodProvider.launchURL(1);
          },
          icon: const Icon(FontAwesomeIcons.github),
          color: color,
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {
            riverpodProvider.launchURL(2);
          },
          icon: const Icon(FontAwesomeIcons.facebook),
          color: color,
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {
            riverpodProvider.launchURL(3);
          },
          icon: const Icon(FontAwesomeIcons.envelope),
          color: color,
        ),
        const SizedBox(width: 25),
        alignment == MainAxisAlignment.center
            ? const SizedBox()
            : ElevatedButton(
                onPressed: () async {
                  riverpodProvider.download_CV();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  side: const BorderSide(
                    color: Colors.purple,
                    width: 2,
                  ),
                  minimumSize: const Size(200, 50),
                ),
                child: const Text('Download CV'),
              )
      ],
    );
  }
}
