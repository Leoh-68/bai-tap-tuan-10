// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// class LoadingScreen extends StatefulWidget {
//   const LoadingScreen({Key? key}) : super(key: key);
//   @override
//   State<LoadingScreen> createState() => _LoadingScreen();
// }

// class _LoadingScreen extends State<LoadingScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 2))
//           ..repeat();
//     Future.delayed(
//       const Duration(seconds: 3),
//       () => Navigator.push(
//         context,
//         PageRouteBuilder(
//           pageBuilder: (BuildContext context, Animation animation,
//               Animation secondaryAnimation) {
//             return const SocialMediaApp();
//           },
//           transitionsBuilder: (BuildContext context,
//               Animation<double> animation,
//               Animation<double> secondaryAnimation,
//               Widget child) {
//             return SlideTransition(
//               position: Tween<Offset>(
//                 begin: const Offset(1.0, 0.0),
//                 end: Offset.zero,
//               ).animate(animation),
//               child: child,
//             );
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Loading........",
//       home: Scaffold(
//         backgroundColor: const Color.fromRGBO(0, 141, 251, 0.41),
//         body: Stack(children: <Widget>[
//           Center(
//             child: Expanded(
//               flex: 2,
//               child: Column(
//                 children: [
//                   const Padding(padding: EdgeInsets.all(50)),
//                   const Text(
//                     "FakeBook",
//                     style: TextStyle(
//                         fontSize: 40,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   const Padding(padding: EdgeInsets.all(70)),
//                   Center(
//                     child: AnimatedBuilder(
//                       animation: _controller,
//                       builder: (_, child) {
//                         return Transform.rotate(
//                           angle: _controller.value * 2 * math.pi,
//                           child: Image.asset(
//                             "Images/loading.png",
//                             scale: 4,
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ]),
//       ),
//     );
//   }
// }
