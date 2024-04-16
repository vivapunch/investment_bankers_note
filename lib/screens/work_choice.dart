import 'package:flutter/material.dart';
import 'package:investment_bankers_note/components/constant.dart';
import 'package:investment_bankers_note/components/variables.dart';

class ChooseWork extends StatelessWidget {
  const ChooseWork({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: SizedBox(
                width: 200.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 100.0,
                      backgroundImage: AssetImage('images/baby.jpeg'),
                    ),
                    const Text(
                      "Banker's Note",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.blueGrey,
                          fontFamily: 'NanumPenScript',
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        selectedWork = setSchedule;
                        Navigator.pushNamed(context, selectPage);
                      },
                      child: const Text('일정 생성'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        selectedWork = makeProposal;
                        Navigator.pushNamed(context, selectPage);
                      },
                      child: const Text('제안서 작성'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        selectedWork = writeContract;
                        Navigator.pushNamed(context, selectPage);
                      },
                      child: const Text('계약서 작성'),
                    ),
                  ],
                ))),
      ),
    );
  }
}
