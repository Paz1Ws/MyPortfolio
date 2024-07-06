import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String image;
  const ProjectCard({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(child: Image.asset(image, fit: BoxFit.contain));
  }
}
