import 'package:flutter/material.dart';

class Certifications extends StatefulWidget {
  const Certifications({super.key});

  @override
  _CertificationsState createState() => _CertificationsState();
}

class _CertificationsState extends State<Certifications> {
  List<String> certifications = [
    'Certification 1',
    'Certification 2',
    'Certification 3',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Agrega aquí el diseño y estilo deseado para el carrusel
      child: Column(
        children: [
          Text(
            certifications[currentIndex],
            style: const TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    currentIndex = (currentIndex - 1) % certifications.length;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  setState(() {
                    currentIndex = (currentIndex + 1) % certifications.length;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
