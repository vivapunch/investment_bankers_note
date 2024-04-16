import 'package:flutter/material.dart';
import 'package:investment_bankers_note/components/variables.dart';

class WriteContract extends StatelessWidget {
  const WriteContract({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('계약서 작성'),
      ),
      body: Column(
        children: [
          Text(selectedObject),
          Text(selectedAct),
          Text(selectedRole),
          Text(selectedAlloc),
          Text(selectedDetailAlloc),
          Text(selectedPurpose),
          Text(selectedForfeit),
        ],
      ),
      // body: MainSelectItem(),
    );
  }
}
