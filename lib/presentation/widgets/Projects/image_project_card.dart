import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String image;
  const ProjectCard({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: image.endsWith('.gif')
            ? Image.network(
                "https://deeplor.s3.us-west-2.amazonaws.com/upload/application/20240709/c016ae80e3f84955853294773800ec28.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20240709T142315Z&X-Amz-SignedHeaders=host&X-Amz-Expires=259200&X-Amz-Credential=AKIAROYXHKZUSZONTWIG%2F20240709%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Signature=7420f048555ca56942c43c27f4b336226524005004923be4524c1b3c473df2d0",
                fit: BoxFit.cover)
            : Image.asset(image, fit: BoxFit.contain));
  }
}
