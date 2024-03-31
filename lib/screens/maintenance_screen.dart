// import 'package:flutter/material.dart';
// import 'package:pomodoro_app/auth/auth_service.dart';
// import 'package:pomodoro_app/screens/home_screen.dart';

// class MaintenaceScreen extends StatefulWidget {
//   const MaintenaceScreen({Key? key}) : super(key: key);

//   @override
//   State<MaintenaceScreen> createState() => _MaintenaceScreenState();
// }
// s
// class _MaintenaceScreenState extends State<MaintenaceScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Builder(builder: (BuildContext context) {
//         return Container(
//           width: double.infinity,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xFFF4A095),
//                 Color(0xFFB3C7BE),
//                 Color(0xFFD0E0E9),
//                 Color(0xFF82D2CB),
//                 Color(0xFF66D7BD),
//               ],
//               begin: Alignment.topRight,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: width * 0.05),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text('Maintenance Page',
//                     style: TextStyle(
//                       fontFamily: 'Monsterrat',
//                       color: Colors.black,
//                       fontSize: 32,
//                       fontWeight: FontWeight.w600,
//                     )),
//                 const SizedBox(height: 50),
//                 SizedBox(
//                     height: 58,
//                     width: 108,
//                     child: ElevatedButton(
//                       // onPressed: () {
//                       //   Navigator.pushReplacementNamed(context, '/homescreen');
//                       // },
//                       onPressed: () {
//                         Navigator.pushReplacementNamed(context, '/maintenancescreen');
//                       },
//                       child: const Text('Login'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(30)),
//                         ),
//                       ),
//                     )),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
