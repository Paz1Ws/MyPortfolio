import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AvailableToWorkContainer extends StatelessWidget {
  const AvailableToWorkContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        width: MediaQuery.sizeOf(context).width * 0.35,
        decoration: BoxDecoration(
            color: Colors.purple, borderRadius: BorderRadius.circular(16)),
     
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.solidCircle,
                color: Colors.green,
                size: 16,
              ),
              const SizedBox(width: 5),
              Text('Available to work', style: TextStyle(color: Colors.white, fontSize: 12)),
            ]));
  }
}
