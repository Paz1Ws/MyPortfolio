import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DraggableMenu extends StatefulWidget {
  const DraggableMenu({super.key});

  @override
  State<DraggableMenu> createState() => _DraggableMenuState();
}

class _DraggableMenuState extends State<DraggableMenu> {
  // Variable to store drag position
  Offset dragPosition = Offset.zero;

  // Calculate feedback size (assuming CircleAvatar)
  double feedbackSize = 40.0; // Adjust as needed based on CircleAvatar size

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: Flexible(
        fit: FlexFit.loose,
        child: Padding(
          padding: const EdgeInsets.only(left: 450, right: 450),
          child: Expanded(
            child: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              color: Colors.black38,
              height: 50,
              items: const [
                Icon(FontAwesomeIcons.user),
                Icon(FontAwesomeIcons.projectDiagram),
                Icon(FontAwesomeIcons.certificate),
              ],
            ),
          ),
        ),
      ),

      // Centered feedback element

      childWhenDragging:
          Container(), // Optional: Empty container for visual consistency
      child: Flexible(
        fit: FlexFit.loose,
        child: Padding(
          padding: const EdgeInsets.only(left: 450, right: 450),
          child: Expanded(
            child: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              color: Colors.black38,
              height: 50,
              items: const [
                Icon(FontAwesomeIcons.user),
                Icon(FontAwesomeIcons.projectDiagram),
                Icon(FontAwesomeIcons.certificate),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
