import 'package:flutter/material.dart';

class CreatorsCard extends StatelessWidget {
  const CreatorsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (_, i) {
          return ListTile(
            leading: const CircleAvatar(),
            title: Text("Creator ${i + 1}"),
            trailing: const Text("★★★★"),
          );
        },
      ),
    );
  }
}