import 'package:flutter_riverpod/flutter_riverpod.dart';

final innerCurrentPageProvider = StateProvider<int>((ref) => 0);
final List<String> certificationImagesProvider = [
  "assets/images/.NetCertification.jpg",
  "assets/images/FlutterCertificate.jpg",
];
