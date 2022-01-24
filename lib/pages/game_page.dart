// import 'package:cobras_e_escadas/components/player.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';

// class GamePage extends StatefulWidget {
//   const GamePage({Key? key}) : super(key: key);

//   @override
//   _GamePageState createState() => _GamePageState();
// }

// class _GamePageState extends State<GamePage> {
//   @override
//   Widget build(BuildContext context) {
//     // SystemChrome.setEnabledSystemUIOverlays([]);
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/mesa.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Player('assets/images/peao_vermelho.png', 0, true),
//                   Container(
//                     height: 400,
//                     width: double.infinity,
//                     child: Image.asset(
//                       'assets/images/Tabuleiro.png',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Player('assets/images/peao_azul.png', 0, false)
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
