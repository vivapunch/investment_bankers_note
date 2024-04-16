import 'package:flutter/material.dart';
import 'package:investment_bankers_note/components/variables.dart';

class MakeProposal extends StatelessWidget {
  const MakeProposal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('제안서 작성'),
      ),
      // body: MainSelectItem(),
    );
  }
// Center(
//     child: SizedBox(
//         width: 200.0,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               padding: const EdgeInsets.all(5.0),
//               color: Colors.grey[300],
//               margin: const EdgeInsets.symmetric(
//                 vertical: 2.0,
//                 horizontal: 5.0,
//               ),
//               child: const Row(
//                 children: <Widget>[
//                   Icon(
//                     Icons.mail_outline,
//                     size: 15.0,
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   Text('laborre@nhqv.com')
//                 ],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(5.0),
//               color: Colors.grey[300],
//               margin: const EdgeInsets.symmetric(
//                 vertical: 2.0,
//                 horizontal: 5.0,
//               ),
//               child: const Row(
//                 children: <Widget>[
//                   Icon(
//                     Icons.lock_outline,
//                     size: 15.0,
//                   ),
//                   SizedBox(
//                     width: 10.0,
//                   ),
//                   Text('*********')
//                 ],
//               ),
//             ),
//           ],
//         ))),
// );
}

class NullPage extends StatelessWidget {
  const NullPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('업무선택'),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(child: Image.asset('images/baby.jpeg')),
    );
  }
}
