import 'package:flutter_riverpod/flutter_riverpod.dart';

final innerCurrentPageProvider = StateProvider<int>((ref) => 0);
final List<String> certificationImagesProvider = [
  "assets/images/certifications/NetCertification.jpg",
  "assets/images/certifications/FlutterCertificate.jpg",
];
