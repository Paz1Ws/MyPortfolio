import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final Image image;
  const ProjectCard({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(child: image);
  }
}
