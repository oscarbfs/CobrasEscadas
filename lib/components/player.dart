// import 'package:flutter/material.dart';

// class Player extends StatelessWidget {
//   final String asset;
//   final int points;
//   final bool vez;
//   const Player(this.asset, this.points, this.vez);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             height: 150,
//             width: 150,
//             child: Image.asset(
//               asset,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Container(
//             height: 100,
//             width: 200,
//             child: Column(
//               children: [
//                 Text('Sua posição: $points'),
//                 vez
//                     ? ElevatedButton(
//                         onPressed: () {}, child: const Text('Jogar'))
//                     : const Card(
//                         child: Text('Não é sua vez!'),
//                       )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
