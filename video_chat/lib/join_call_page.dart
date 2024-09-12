// import 'package:flutter/material.dart';
// import 'package:video_chat/video_call.dart';

// final TextEditingController controllerName = TextEditingController();
// final TextEditingController controllerUserName = TextEditingController();
// final TextEditingController controllerCallId = TextEditingController();

// class JoinCallPage extends StatefulWidget {
//   const JoinCallPage({super.key});

//   @override
//   State<JoinCallPage> createState() => _JoinCallPageState();
// }

// class _JoinCallPageState extends State<JoinCallPage> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: Column(
//           children: [
//             const Spacer(),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 25),
//                 const Center(
//                   child: Text(
//                     'Join Video Call',
//                     style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.blue),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Card(
//                   elevation: 5,
//                   child: Container(
//                     height: 42,
//                     padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey.shade300)),
//                     child: TextField(
//                       textCapitalization: TextCapitalization.characters,
//                       controller: controllerName,
//                       textAlignVertical: TextAlignVertical.center,
//                       decoration: const InputDecoration(
//                         prefixIcon: Icon(Icons.person_rounded,
//                             color: Colors.grey, size: 20),
//                         border: InputBorder.none,
//                         filled: false,
//                         hintText: 'Enter Name',
//                       ),
//                     ),
//                   ),
//                 ),
//                 Card(
//                   elevation: 5,
//                   child: Container(
//                     height: 42,
//                     padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey.shade300)),
//                     child: TextField(
//                       textCapitalization: TextCapitalization.characters,
//                       controller: controllerUserName,
//                       textAlignVertical: TextAlignVertical.center,
//                       decoration: const InputDecoration(
//                         prefixIcon: Icon(Icons.person_2_outlined,
//                             color: Colors.grey, size: 20),
//                         border: InputBorder.none,
//                         filled: false,
//                         hintText: 'Enter UserName',
//                       ),
//                     ),
//                   ),
//                 ),
//                 Card(
//                   elevation: 5,
//                   child: Container(
//                     height: 42,
//                     padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey.shade300)),
//                     child: TextField(
//                       textCapitalization: TextCapitalization.characters,
//                       controller: controllerCallId,
//                       textAlignVertical: TextAlignVertical.center,
//                       decoration: const InputDecoration(
//                         prefixIcon: Icon(Icons.video_call,
//                             color: Colors.grey, size: 20),
//                         border: InputBorder.none,
//                         filled: false,
//                         hintText: 'Enter Video call ID',
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 45),
//                 Align(
//                     alignment: Alignment.center,
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const CallPage()),
//                         );
//                       },
//                       child: Container(
//                         width: 100,
//                         height: 44,
//                         decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: const Center(
//                             child: Text(
//                           'Join ',
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white),
//                         )),
//                       ),
//                     )),
//               ],
//             ),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }
