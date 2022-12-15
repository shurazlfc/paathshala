// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:pathashala/Homepage.dart';
// import 'package:pathashala/ui.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child: Container(
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   height: 350,
//                   child: Stack(
//                     children: <Widget>[
//                       Positioned(
//                         child: Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage("assets/images/1.png"),
//                                   fit: BoxFit.fill),
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(20.0),
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                         padding: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Color.fromRGBO(143, 148, 251, .2),
//                                   blurRadius: 20.0,
//                                   offset: Offset(0, 10))
//                             ]),
//                         child: Column(
//                           children: <Widget>[
//                             Container(
//                               padding: EdgeInsets.all(8.0),
//                               decoration: BoxDecoration(
//                                   border: Border(
//                                       bottom: BorderSide(color: Colors.grey))),
//                               child:  TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(hintText: "Username"),
//             ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.all(8.0),
//                               child: TextFormField(
//               controller: _passwordController,
//               decoration: InputDecoration(hintText: "Password"),
//             ),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => DashboardPage()),
//                           );
//                         },
//                         child: Container(
//                           height: 50,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               gradient: LinearGradient(colors: [
//                                 Color.fromRGBO(143, 148, 251, 1),
//                                 Color.fromRGBO(143, 148, 251, .6),
//                               ])),
//                           child: Center(
//                             child: Text(
//                               "Login",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             gradient: LinearGradient(colors: [
//                               Colors.red,
//                               Colors.redAccent,
//                             ])),
//                         child: Center(
//                           child: Text(
//                             "Apply For Admission",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 70,
//                       ),
//                       Text(
//                         "Powered By Paathshala",
//                         style:
//                             TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }
