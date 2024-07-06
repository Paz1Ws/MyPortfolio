// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Experience extends ConsumerWidget {
//   const Experience({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Column(
//       children: [
//         const SizedBox(height: 20),
//         const Text(
//           'Experience',
//           style: TextStyle(
//             fontSize: 30,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 20),
//         Flexible(
//             fit: FlexFit.tight,
//             child: ShaderMask(
//               shaderCallback: (bounds) => const LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 120, 24, 136),
//                   Color.fromARGB(255, 170, 45, 192),
//                 ],
//               ).createShader(bounds),
//               child: Text(
//                 "I have experience with the following technologies",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.josefinSans(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             )),
//         const SizedBox(height: 20),
//         // const TechsList(),
//       ],
//     );
//   }
// }
