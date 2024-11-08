import 'package:flutter_riverpod/flutter_riverpod.dart';

final innerCurrentPageProvider = StateProvider<int>((ref) => 0);
final List<String> certificationImagesProvider = [
  "assets/images/certifications/FlutterCertificate.jpg",
  "assets/images/certifications/HackatonAward.jpeg",
  "assets/images/certifications/NasaCertificate.jpeg",
  "assets/images/certifications/NetCertification.jpg",
  "assets/images/certifications/RiverpodCertificate.jpg",
  "assets/images/certifications/VisualStudioCertificate.jpg",
];
