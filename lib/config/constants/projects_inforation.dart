import 'package:flutter/material.dart';

class ProjectsInformation {
  String fitbody =
      "I developed FitBody, the launch application of my YouTube channel, Flutterize. I built a complete fitness app that offers the integration of personalized training plans, progress tracking and an online community.\n\nUsing Flutter and a design in Figma, implement an intuitive and fluid user interface, integrating Riverpod for status management as to optimize performance.\n\nThis project took me 3 weeks of deep work which allowed me to perfect my skills in solving complex problems, agile development and design of attractive user interfaces.";
  List<Image> fitbody_icons = [
    Image.asset('assets/images/tech/flutter.png', fit: BoxFit.cover),
    Image.asset('assets/images/tech/figma.png', fit: BoxFit.cover),
    Image.asset('assets/images/tech/riverpod.png', fit: BoxFit.cover),
  ];

  String jobMatch =
      'I created JobMatch to revolutionize the way we find jobs. \n\nUsing Flutter, I designed an intuitive and effective app, a smooth user experience with smooth animations and a focus on accessibility. \n\nThe modular and scalable architecture, combined with Firebase, for an efficient management of users, data and notifications in real time, and CV reading through an API managed with Nest.js, guarantee a personalized experience from talent search to candidate management. \n\nJobMatch simplifies the recruitment process.';

  List<Image> jobMatch_icons = [
    Image.asset('assets/images/tech/flutter.png', fit: BoxFit.cover),
    Image.asset('assets/images/tech/firebase.png', fit: BoxFit.cover),
    Image.asset('assets/images/tech/nestjs.png', fit: BoxFit.cover),
  ];
  String billboard =
      "Experience the ultimate movie-going app with Ultimate Billboard.\n\n Discover the latest cinema releases, explore popular and upcoming movies, and dive into a curated selection of TV content. \n\nEasily search for your favorite movies and keep track of your watchlist. Built with Flutter for a seamless, cross-platform experience.";
  List<Image> billboard_icons = [
    Image.asset('assets/images/tech/flutter.png', fit: BoxFit.cover),
    Image.asset('assets/images/tech/firebase.png', fit: BoxFit.cover),
  ];
}
