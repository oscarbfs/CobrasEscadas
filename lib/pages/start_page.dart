// import 'package:cobras_e_escadas/utils/app_routes.dart';
// import 'package:flutter/material.dart';

// class StartPage extends StatefulWidget {
//   const StartPage({Key? key}) : super(key: key);

//   @override
//   State<StartPage> createState() => _StartPageState();
// }

// class _StartPageState extends State<StartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(colors: [
//                 Colors.blue,
//                 Colors.yellow,
//               ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//             ),
//           ),
//           Center(
//             child: SingleChildScrollView(
//               child: Container(
//                 width: double.infinity,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(
//                         bottom: 20,
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 10,
//                         horizontal: 70,
//                       ),
//                       // transform: Matrix4.rotationZ(-8 * pi / 180)
//                       //   ..translate(-10.0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.red,
//                         boxShadow: const [
//                           BoxShadow(
//                             blurRadius: 8,
//                             color: Colors.black26,
//                             offset: Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Text(
//                         'Cobras e Escadas',
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontFamily: 'Anton',
//                           color: Theme.of(context).accentColor,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 70),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.of(context).pushReplacementNamed(
//                           AppRoutes.GAME,
//                         );
//                       },
//                       child: const Text('START'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
