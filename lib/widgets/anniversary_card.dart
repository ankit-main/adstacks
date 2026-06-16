import 'package:flutter/material.dart';

class AnniversaryCard extends StatelessWidget {
  const AnniversaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple,
      child: const SizedBox(
        height: 150,
        child: Center(
          child: Text(
            "Anniversary\n3",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}