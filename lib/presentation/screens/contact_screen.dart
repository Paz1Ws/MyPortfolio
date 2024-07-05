import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/config/providers/navigations_key_prov.dart';
import 'package:my_portfolio/presentation/widgets/ForContact/rotating_border.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> with TickerProviderStateMixin  {
  @override
  Widget build(BuildContext context) {
     final animationController = AnimationController(
vsync: this,
      duration: const Duration(seconds: 5),
    );
    animationController.forward();
    return Scaffold(
      key: NavigationByPages().contactSection,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child:  Flexible(
              // Remove 'const' keyword
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.only(top: 200.0, left: 550),
                child: RotatingBorder(
                           key: UniqueKey(),
                  animationController: animationController,
                  color1: Colors.red,
                  color2: Colors.yellow,
                  color3: Colors.green,
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
